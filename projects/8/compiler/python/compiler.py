"""
| RAM addresses | Usage |
| ------------- | ----- |
| 0–15 | Sixteen virtual registers, usage described below |
| 16–255 | Static variables (of all the VM functions in the VM program) |
| 256–2047 | Stack |
| 2048–16483 | Heap (used to store objects and arrays) |
| 16384–24575 | Memory mapped I/O |
"""

import argparse
from pathlib import Path
from typing import Iterator
from textwrap import dedent

ARITHMETIC_COMMANDS = frozenset([
    # TODO - dict?
    "add",
    "sub",
    "neg",
    "eq",
    "gt",
    "lt",
    "and",
    "or",
    "not",
])

MEMORY_COMMANDS = frozenset([
    "push",
    "pop",
])

PROGRAM_FLOW_COMMANDS = frozenset([
    "label",
    "goto"
    "if-goto"
])

MEMORY_SEGMENTS = frozenset([
    "argument",
    "local",
    "static",
    "constant",
    "this",
    "that",
    "pointer",
    "temp",
])

class Compiler:
    def __init__(self, input_filepath: Path, output_filepath: Path, source_map: bool = True):
        self.input_file_name = input_filepath.name
        self.input_lines = (line for line in input_filepath.open())
        self.output_filepath = output_filepath
        self.source_map = source_map

        self.stack_pointer = 256
        self.jump_counter = 0

    def processed_lines(self) -> Iterator[str]:
        """
        Lines we see may be:
        1. Comments or empty -> ignore
        2. start with push/pop -> memory instruction
        3. an arithmetic instruction
        """
        for line in self.input_lines:
            line = line.strip()
            if len(line) == 0 or line.isspace() or line.startswith("//"):
                # line is empty or a comment
                continue
            code, _, _ = line.partition("//") # drop all the comments
            command, *args = code.split()

            if command in ARITHMETIC_COMMANDS:
                yield from self._compile_arithmetic_instruction(command)
            elif command in MEMORY_COMMANDS:
                yield from self._compile_memory_instruction(command, *args)
            elif command in PROGRAM_FLOW_COMMANDS:
                yield from self._compile_program_flow_instruction(command, *args)
            else:
                raise ValueError(f"Unable to understand {command} with {args} from {code}")

    def _compile_arithmetic_instruction(self, command):
        if self.source_map:
            yield f"// {command}"
        if command in ("add", "sub", "and", "or"):
            yield from self._compile_two_arg_instruction(command)
        elif command == "neg":
            yield self._decrement_stack_pointer_intruction()
            yield self._load_stack_pointer_to_d()
            yield "D=-D"
            yield self._store_d_and_increment_stack_pointer()
        elif command == "not":
            yield self._decrement_stack_pointer_intruction()
            yield self._load_stack_pointer_to_d()
            yield "D=!D"
            yield self._store_d_and_increment_stack_pointer()
        elif command in ("eq", "lt", "gt"):
            yield from self._compile_comparison_instruction(command)

    def _compile_two_arg_instruction(self, command: str):
        """
        add, sub, and, or
        """
        # TODO put this in a better place
        d = {
            "add": "+",
            "sub": "-",
            "and": "&",
            "or": "|",
        }
        op = d[command]
        yield self._decrement_stack_pointer_intruction()
        yield self._load_stack_pointer_to_d()
        yield self._decrement_stack_pointer_intruction()
        yield dedent(f"""
        A=M // get value from RAM[0] and store in A
        D=M{op}D // {command} D{op}RAM[RAM[0]] and store in D
        """)
        yield self._store_d_and_increment_stack_pointer()

    def _compile_comparison_instruction(self, command: str):
        """
        eq, lt, gt
        true and false as -1 (minus one, 0xFFFF) and 0 (zero, 0x0000), respectively.
        """
        # TODO move this
        d = {
            "eq": "JEQ",
            "lt": "JGT", # flipped because of loading/execution order
            "gt": "JLT", # flipped because of loading/execution order
        }
        jump = d[command]
        yield self._decrement_stack_pointer_intruction()
        yield self._load_stack_pointer_to_d()
        yield self._decrement_stack_pointer_intruction()
        yield dedent(f"""
        A=M // get value from RAM[0] and store in A
        D=D-M
        @STORE_TRUE_{self.jump_counter}
        D; {jump} // {command}
        @STORE_FALSE_{self.jump_counter}
        0;JMP
        (JUMP_BACK_{self.jump_counter})
        """)
        self.jump_counter += 1

    def _compile_memory_instruction(self, command: str, segment: str, location: str):
        """
        local - LCL
        argument - ARG
        this - THIS
        that - THAT
        """
        if self.source_map:
            yield f"// {command} {segment} {location}"
        if command == "push":
            if segment == "constant":
                yield dedent(f"""
                @{location}
                D=A
                """)
                yield self._store_d_and_increment_stack_pointer()
            elif segment in ("local", "argument", "this", "that",  "pointer", "temp"):
                yield self._store_offset_pointer(segment, location)
                yield dedent("""
                @R13
                A=M // store the offset location
                D=M // store the value in offset location
                """)
                yield self._store_d_and_increment_stack_pointer()
            elif segment=="static":
                yield dedent(f"""
                @{self.input_file_name}.{location}
                D=M // store the value in offset location
                """)
                yield self._store_d_and_increment_stack_pointer()
        else:
            yield self._decrement_stack_pointer_intruction()
            if segment in ("local", "argument", "this", "that", "pointer", "temp"):
                yield self._store_offset_pointer(segment, location)
                yield self._load_stack_pointer_to_d()
                yield dedent("""
                @R13
                A=M // store the offset location
                M=D // store the value
                """)
            elif segment=="static":
                yield self._load_stack_pointer_to_d()
                yield dedent(f"""
                @{self.input_file_name}.{location}
                M=D // store the value
                """)

    def _compile_program_flow_instruction(self, command: str, label: str):
        if self.source_map:
            yield f"// {command} {label}"

        if command == "label":
            yield f"({label}"
        elif command == "goto":
            yield dedent(f"""
            @{label}
            0;JEQ
            """)
        elif command == "if-goto":
            yield self._decrement_stack_pointer_intruction()
            yield self._load_stack_pointer_to_d()
            yield self._decrement_stack_pointer_intruction()
            yield dedent(f"""
            A=M // get value from RAM[0] and store in A
            D=D-M
            @{label}
            D; JGT // {command}
            """)
        else:
            raise ValueError(f"Unknown {command=} with {label=}")

    def _store_offset_pointer(self, pointer, offset, ram_loc="R13"):
        # TODO move
        pointer_names = {
            "local": "LCL",
            "argument": "ARG",
            "this": "THIS",
            "that": "THAT",
            "pointer": "3",
            "temp": "5", # temp start from 5?
        }
        add_intruction = "A" if pointer in ("temp", "pointer") else "M"

        return dedent(f"""
        @{offset}
        D=A // store offset in D
        @{pointer_names[pointer]}
        D=D+{add_intruction} // Add offset to pointer base
        @{ram_loc}
        M=D // store offset in {ram_loc}
        """)

    def _store_d_and_increment_stack_pointer(self):
        self.stack_pointer += 1
        return dedent("""
        @SP // set M=RAM[0]
        A=M // get value from RAM[0] and store in A
        M=D // set value of RAM[A] as D
        @SP // set M=RAM[0]
        M=M+1 // increment value at RAM[0]
        """)

    def _decrement_stack_pointer_intruction(self):
        self.stack_pointer -= 1
        return dedent("""
        @SP // set M=RAM[0]
        M=M-1 // decrement RAM[0]
        """)

    def _load_stack_pointer_to_d(self):
        return dedent("""
        @SP // set M=RAM[0]
        A=M // get value from RAM[0] and store in A
        D=M // set value of RAM[RAM[0]] in D
        """)

    def compile_true_false_jumps(self):
        instruction = dedent("""
        (STORE_TRUE_{jump})
            @SP // set M=RAM[0]
            A=M // get value from RAM[0] and store in A
            M=-1 // set value of RAM[A] as D
            @SP // set M=RAM[0]
            M=M+1 // increment value at RAM[0]
            @JUMP_BACK_{jump}
            0;JEQ
        (STORE_FALSE_{jump})
            @SP // set M=RAM[0]
            A=M // get value from RAM[0] and store in A
            M=0 // set value of RAM[A] as D
            @SP // set M=RAM[0]
            M=M+1 // increment value at RAM[0]
            @JUMP_BACK_{jump}
            0;JEQ
        """)

        return "\n".join(instruction.format(jump=jump) for jump in range(self.jump_counter))

    def compile_infinite_loop_instruction(self):
        return dedent("""
        @INFINITE_LOOP
        0;JMP
        (INFINITE_LOOP)
        @INFINITE_LOOP
        0;JMP
        """)

    def compile(self):
        out = "\n".join(line for line in self.processed_lines())
        out += self.compile_infinite_loop_instruction()
        if self.jump_counter:
            out += self.compile_true_false_jumps()
        self.output_filepath.write_text(out)


cli_parser = argparse.ArgumentParser()
# TODO - handle multiple files
cli_parser.add_argument("input_filepath", type=Path, help="input asm filepath")
cli_parser.add_argument("output_filepath", type=Path, help="output hack filepath")
args = cli_parser.parse_args()

compiler = Compiler(args.input_filepath, args.output_filepath)
compiler.compile()
print("all done")
