# This runs on irv_username.asm and uncomment corresponding .include instructions
# Input: argv1 ------ test case #
import glob
import fileinput
import sys
import os

# 1. Comment all the .include directives to make the program generally
filename = glob.glob('i*.asm')
if len(filename) > 1:
    print("More than 2 files found in the processing folder")
elif len(filename) == 0:
    print("No valid file found")
else:
    for line in fileinput.input(filename, inplace=True):
        if '.include' in line:
            print('#' + line.strip('#').rstrip())
        else:
            print(line.rstrip())
    # 2. Uncomment corresponding test case
    for line in fileinput.input(filename, inplace=True):
        if '"test' + sys.argv[1] + '.asm"' in line:
            print(line.strip('#').rstrip())
        else:
            print(line.rstrip())
