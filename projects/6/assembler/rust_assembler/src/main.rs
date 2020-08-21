use std::env;

use std::fs::File;
use std::io::prelude::*;
use std::io::{self, BufRead};
use std::path::Path;

use std::collections::{HashMap, HashSet};

extern crate strfmt;
use strfmt::strfmt;


// TODO - should I use &str with a lifetime based on the struct?
struct Assembler<'a> {
    seen_syms: HashSet<String>,
    symbol_table: HashMap<String, String>,
    comp_table: HashMap<&'a str, &'a str>,
    dest_table: HashMap<&'a str, &'a str>,
    jump_table: HashMap<&'a str, &'a str>,
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

    fn assemble(&mut self, input_lines: io::Lines<io::BufReader<File>>) -> String {
        let mut instruction_count = 0;
        let mut output_lines = Vec::new();
        // I think I use for since I am doing this for side effects?

        for line in input_lines {
            let n_line = line.unwrap_or("".to_string());
            // TODO - should I be using a match here instead?
            if n_line.starts_with("//") || n_line.trim().is_empty() {
                continue;
            } else if n_line.starts_with("@") {
                instruction_count += 1;
                let a_instruction = self.assemble_a_instruction(&n_line[1..]);
                output_lines.push(a_instruction)
            } else if n_line.starts_with("(") {
                let label = n_line.trim_matches(|c| c == '(' || c == ')').to_string();
                self.symbol_table
                    .insert(label, format!("{:016b}", instruction_count));
            } else {
                instruction_count += 1;
                let c_instruction = self.assemble_c_instruction(&n_line);
                output_lines.push(c_instruction);
            }
        }

        let mut symbol_table_next_slot = 16;
        for sym in self.seen_syms.iter() {
            if !self.symbol_table.contains_key(sym) {
                self.symbol_table
                    .insert(sym.to_string(), format!("{:016b}", symbol_table_next_slot));
                symbol_table_next_slot += 1;
            }
        }
        let out = match strfmt(&output_lines.join("\n"), &self.symbol_table) {
            Err(why) => panic!("Something went wrong formatting {}", why),
            Ok(output) => output
        };

        out
    }
}

fn main() -> Result<(), io::Error> {
    let args: Vec<String> = env::args().collect();

    println!("Input file arg: {:?}", &args[1]);
    println!("Output file arg: {:?}", &args[2]);

    let lines = match read_lines(&args[1]) {
        Ok(lines) => lines,
        Err(e) => panic!("could not read file {}", e),
    };

    let mut assembler = Assembler {
        seen_syms: HashSet::new(),
        symbol_table: [
            ("R0".to_string(), format!("{:016b}", 0)),
            ("R1".to_string(), format!("{:016b}", 1)),
            ("R2".to_string(), format!("{:016b}", 2)),
            ("R3".to_string(), format!("{:016b}", 3)),
            ("R4".to_string(), format!("{:016b}", 4)),
            ("R5".to_string(), format!("{:016b}", 5)),
            ("R6".to_string(), format!("{:016b}", 6)),
            ("R7".to_string(), format!("{:016b}", 7)),
            ("R8".to_string(), format!("{:016b}", 8)),
            ("R9".to_string(), format!("{:016b}", 9)),
            ("R10".to_string(), format!("{:016b}", 10)),
            ("R11".to_string(), format!("{:016b}", 11)),
            ("R12".to_string(), format!("{:016b}", 12)),
            ("R13".to_string(), format!("{:016b}", 13)),
            ("R14".to_string(), format!("{:016b}", 14)),
            ("R15".to_string(), format!("{:016b}", 15)),
            ("SCREEN".to_string(), format!("{:016b}", 16384)),
            ("KBD".to_string(), format!("{:016b}", 24576)),
            ("SP".to_string(), format!("{:016b}", 0)),
            ("LCL".to_string(), format!("{:016b}", 1)),
            ("ARG".to_string(), format!("{:016b}", 2)),
            ("THIS".to_string(), format!("{:016b}", 3)),
            ("THAT".to_string(), format!("{:016b}", 4)),
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

    let output_text = assembler.assemble(lines);

    let output_filepath = Path::new(&args[2]);
    let output_filepath_display = output_filepath.display();

    let mut output_file = match File::create(&output_filepath) {
        Err(why) => panic!("couldn't create {}: {}", output_filepath_display, why),
        Ok(file) => file,
    };

    match output_file.write_all(output_text.as_bytes()) {
        Err(why) => panic!("couldn't write to {}: {}", output_filepath_display, why),
        Ok(_) => println!("successfully wrote to {}", output_filepath_display),
    }

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
