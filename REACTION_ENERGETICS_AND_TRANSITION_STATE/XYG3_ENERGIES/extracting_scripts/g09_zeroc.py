#!/usr/bin/env python3
# -*- coding:utf-8 -*-

import sys

# constant
au2klmol = 2.62549961709828E+03

def zero_log(filename):
    """
        to read the zero-point energy from a Gaussian09 log file
        output in kJ/mol
    """
    with open(filename, "r") as f:
        while True:
            line = f.readline()
            if not line:
                break
            if len(line.split()) == 4 and " ".join(line.split()[0:2]) == "Zero-point correction=":
                zero_c = float(line.split()[-2])
                break
    return zero_c * au2klmol

if len(sys.argv) < 2:
    print("""
        Purpose:
            to extract the zero-point energy from a G09 log file 
        Usage:
            ./g09_zeroc.py file.log
""")
else:
    infile = sys.argv[1]
    print("%.2f" % (zero_log(infile),))