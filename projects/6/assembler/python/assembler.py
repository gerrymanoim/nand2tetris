import argparse
from collections import UserDict
from pathlib import Path
from typing import Iterator

CODE_TABLE = {
    "comp": {
        # TODO - format(num'07b') instead?
        # a c1 c2 c3 c4 c5 c6
        "0": "0101010",
        "1": "0111111",
        "-1": "0111010",
        "D": "0001100",
        "A": "0110000",
        "M": "1110000",
        "!D": "0001101",
        "!A": "0110001",
        "!M": "1110001",
        "-D": "0001111",
        "-A": "0110011",
        "-M": "1110011",
        "D+1": "0011111",
        "A+1": "0110111",
        "M+1": "1110111",
        "D-1": "0001110",
        "A-1": "0110010",
        "M-1": "1110010",
        "D+A": "0000010",
        "D+M": "1000010",
        "D-A": "0010011",
        "D-M": "1010011",
        "A-D": "0000111",
        "M-D": "1000111",
        "D&A": "0000000",
        "D&M": "1000000",
        "D|A": "0010101",
        "D|M": "1010101",
    },
    "dest": {
        # d1 d2 d2
        None: "000",
        "M": "001",
        "D": "010",
        "MD": "011",
        "A": "100",
        "AM": "101",
        "AD": "110",
        "AMD": "111",
    },
    "jump": {
        # j1 j2 j3
        None: "000",
        "JGT": "001",
        "JEQ": "010",
        "JGE": "011",
        "JLT": "100",
        "JNE": "101",
        "JLE": "110",
        "JMP": "111",
    },
}


class BinaryDict(UserDict):
    def __setitem__(self, key, value):
        if isinstance(value, int):
            value = format(value, "016b")
        super().__setitem__(key, value)


PREDEFINED_SYMBOL_TABLE = BinaryDict(
    {
        "R0": 0,
        "R1": 1,
        "R2": 2,
        "R3": 3,
        "R4": 4,
        "R5": 5,
        "R6": 6,
        "R7": 7,
        "R8": 8,
        "R9": 9,
        "R10": 10,
        "R11": 11,
        "R12": 12,
        "R13": 13,
        "R14": 14,
        "R15": 15,
        "SCREEN": 16384,
        "KBD": 24576,
        "SP": 0,
        "LCL": 1,
        "ARG": 2,
        "THIS": 3,
        "THAT": 4,
    }
)


class Parser:
    def __init__(self, input_filepath: Path, output_filepath: Path):
        self.input_lines = (line for line in input_filepath.open())
        self.output_filepath = output_filepath
        self.symbol_table = PREDEFINED_SYMBOL_TABLE.copy()
        self.seen_syms = list()

    def processed_lines(self) -> Iterator[str]:
        """
        Lines we see may be:
        1. Comments or empty -> ignore
        2. start with @ -> a instruct
        3. start with () -> label declaration
        4. otherwise a c instruct
        """
        instruction_count = 0
        for line in self.input_lines:
            line = line.strip()
            if len(line) == 0 or line.isspace() or line.startswith("//"):
                # line is empty or a comment
                continue
            elif line.startswith("@"):
                instruction_count += 1
                yield self._assemble_a_instruction(line[1:])
            elif line.startswith("("):
                label = line.strip("()")
                self.symbol_table[label] = instruction_count
                continue
            else:
                instruction_count += 1
                yield self._assemble_c_instruction(line)

    def _assemble_a_instruction(self, instruction: str) -> str:
        """
        A instructions are `0vvv vvvv vvvv vvvv`
        """
        try:
            return "0{:015b}".format(int(instruction))
        except ValueError:
            self.seen_syms.append(instruction)
            # hack to get names with dots working
            return "{0[" + instruction + "]}"

    def _assemble_c_instruction(self, instruction: str) -> str:
        """
        C instructions are `111a c1c2c3c4 c5c6d1d2 d3j1j2j3`
        """
        code, _, _ = instruction.partition("//")
        dest, sep, rest = code.strip().partition("=")
        if sep == "":
            rest = dest
            dest = None
        comp, sep, jump = rest.partition(";")
        if sep == "":
            jump = None

        return (
            "111"
            + CODE_TABLE["comp"][comp]
            + CODE_TABLE["dest"][dest]
            + CODE_TABLE["jump"][jump]
        )

    def assemble(self):
        out = "\n".join(line for line in self.processed_lines())
        symbol_table_next_slot = 16
        for sym in self.seen_syms:
            if sym not in self.symbol_table:
                self.symbol_table[sym] = symbol_table_next_slot
                symbol_table_next_slot += 1
        out = out.format(self.symbol_table)
        self.output_filepath.write_text(out)


cli_parser = argparse.ArgumentParser()
cli_parser.add_argument("input_filepath", type=Path, help="input asm filepath")
cli_parser.add_argument("output_filepath", type=Path, help="output hack filepath")
args = cli_parser.parse_args()

parser = Parser(args.input_filepath, args.output_filepath)
parser.assemble()
print("all done")
