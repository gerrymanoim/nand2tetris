import argparse

from pathlib import Path

parser = argparse.ArgumentParser()
parser.add_argument("filepath", type=Path, help="input asm filepath")
args = parser.parse_args()
print(args.filepath)
