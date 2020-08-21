use std::env;

use std::fs::File;
use std::io::{self, BufRead};
use std::path::Path;

use std::collections::{HashMap, HashSet};

// TODO - should I use &str with a lifetime based on the struct?
struct Assembler<'a> {
    input_lines: io::Lines<io::BufReader<File>>,
    output_filepath: String,
    seen_syms: HashSet<String>,
    instruction_count: u16,
    symbol_table: HashMap<&'a str, String>,
    comp_table: HashMap<&'a str, &'a str>,
    dest_table: HashMap<&'a str, &'a str>,
    jump_table: HashMap<&'a str, &'a str>,
}

impl Iterator for Assembler<'_> {
    type Item = String; // TODO wtf is an item

    fn next(&mut self) -> Option<String> {
        let line = match self.input_lines.next() {
            Some(line) => line.unwrap(),
            None => return None
        };

        Some(line)
    }
}

impl Assembler<'_> {
    fn assemble_a_instruction(&mut self, instruction: &str) -> String {
        return match instruction.parse::<u8>() {
            Ok(a_instruction) => format!("0{:015b}", a_instruction),
            Err(_) => {
                self.seen_syms.insert(instruction.to_string());
                format!("{{{}}}", instruction)
            }
        };
    }

    // TODO - I'm making string copies all over the place
    // learn to not do that
    fn assemble_c_instruction(&self, instruction: &str) -> String {
        let code = match instruction.find("//") {
            None => instruction,
            Some(idx) => &instruction[..idx],
        };
        let (dest, rest) = match code.find("=") {
            None => ("", code),
            Some(idx) => (&instruction[..idx], &instruction[idx + 1..]),
        };
        let (comp, jump) = match rest.find(";") {
            None => (rest, ""),
            Some(idx) => (&rest[..idx], &rest[idx + 1..]),
        };

        return format!(
            "111{comp}{dest}{jump}",
            comp = self.comp_table[comp],
            dest = self.dest_table[dest],
            jump = self.jump_table[jump]
        );
    }

    fn assemble(&self) {
        let mut instruction_count = 0;
        let mut lines = Vec::new();
        for line in self.input_lines {
            // TODO - should I be using a match here instead?
            let line = line.unwrap();
            if line.starts_with("//") || line.trim().is_empty()  {
                continue;
            }
            else if line.starts_with("@") {
                instruction_count += 1;
                lines.push(self.assemble_a_instruction(&line));
            }
            else if line.starts_with("(") {
                let label = line.trim_matches(|c| c == '(' || c == ')');
                self.symbol_table.insert(label, format!("{:016b}", instruction_count));
            } else {
                instruction_count += 1;
                lines.push(self.assemble_c_instruction(&line));
            }
        };
    }
}

fn main() -> Result<(), io::Error> {
    let args: Vec<String> = env::args().collect();

    println!("Input file arg: {:?}", &args[1]);
    println!("Output file arg: {:?}", &args[2]);

    let lines = match read_lines(&args[1]) {
        Ok(lines) => lines,
        Err(e) => panic!("could not read file {}", e)
    };

    let assembler = Assembler {
        input_lines: lines,
        output_filepath: String::from(&args[2]),
        seen_syms: HashSet::new(),
        instruction_count: 0,
        symbol_table: [
            ("R0", format!("{:016b}", 0)),
            ("R1", format!("{:016b}", 1)),
            ("R2", format!("{:016b}", 2)),
            ("R3", format!("{:016b}", 3)),
            ("R4", format!("{:016b}", 4)),
            ("R5", format!("{:016b}", 5)),
            ("R6", format!("{:016b}", 6)),
            ("R7", format!("{:016b}", 7)),
            ("R8", format!("{:016b}", 8)),
            ("R9", format!("{:016b}", 9)),
            ("R10", format!("{:016b}", 10)),
            ("R11", format!("{:016b}", 11)),
            ("R12", format!("{:016b}", 12)),
            ("R13", format!("{:016b}", 13)),
            ("R14", format!("{:016b}", 14)),
            ("R15", format!("{:016b}", 15)),
            ("SCREEN", format!("{:016b}", 16384)),
            ("KBD", format!("{:016b}", 24576)),
            ("SP", format!("{:016b}", 0)),
            ("LCL", format!("{:016b}", 1)),
            ("ARG", format!("{:016b}", 2)),
            ("THIS", format!("{:016b}", 3)),
            ("THAT", format!("{:016b}", 4)),
        ]
        .iter()
        .cloned()
        .collect(), // TODO could have used ::from syntax?
        comp_table: [
            ("0", "0101010"),
            ("1", "0111111"),
            ("-1", "0111010"),
            ("D", "0001100"),
            ("A", "0110000"),
            ("M", "1110000"),
            ("!D", "0001101"),
            ("!A", "0110001"),
            ("!M", "1110001"),
            ("-D", "0001111"),
            ("-A", "0110011"),
            ("-M", "1110011"),
            ("D+1", "0011111"),
            ("A+1", "0110111"),
            ("M+1", "1110111"),
            ("D-1", "0001110"),
            ("A-1", "0110010"),
            ("M-1", "1110010"),
            ("D+A", "0000010"),
            ("D+M", "1000010"),
            ("D-A", "0010011"),
            ("D-M", "1010011"),
            ("A-D", "0000111"),
            ("M-D", "1000111"),
            ("D&A", "0000000"),
            ("D&M", "1000000"),
            ("D|A", "0010101"),
            ("D|M", "1010101"),
        ]
        .iter()
        .cloned()
        .collect(),
        dest_table: [
            ("", "000"),
            ("M", "001"),
            ("D", "010"),
            ("MD", "011"),
            ("A", "100"),
            ("AM", "101"),
            ("AD", "110"),
            ("AMD", "111"),
        ]
        .iter()
        .cloned()
        .collect(),
        jump_table: [
            ("", "000"),
            ("JGT", "001"),
            ("JEQ", "010"),
            ("JGE", "011"),
            ("JLT", "100"),
            ("JNE", "101"),
            ("JLE", "110"),
            ("JMP", "111"),
        ]
        .iter()
        .cloned()
        .collect(),
    };
    assembler.assemble();

    Ok(())
}

// The output is wrapped in a Result to allow matching on errors
// Returns an Iterator to the Reader of the lines of the file.
fn read_lines<P>(filename: P) -> io::Result<io::Lines<io::BufReader<File>>>
where
    P: AsRef<Path>,
{
    let file = File::open(filename)?;
    Ok(io::BufReader::new(file).lines())
}
