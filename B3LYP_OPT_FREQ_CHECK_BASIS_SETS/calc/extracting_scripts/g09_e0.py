#!/usr/bin/env python3
# -*- coding:utf-8 -*-

import numpy as np
import sys

# constant
au2klmol = 2.62549961709828E+03

def e0_log(filename):
    """
        to read the E(0K) information from a Gaussian09 log file
        output in kJ/mol
    """
    with open(filename, "r") as f:
        while True:
            line = f.readline()
            if not line:
                break
            if len(line.split()) == 7 and " ".join(line.split()[0:6]) == "Sum of electronic and zero-point Energies=":
                E0K = float(line.split()[-1])
                break
    return E0K * au2klmol

if len(sys.argv) < 2:
    print("""
        Purpose:
            to extract the E(0K) information from a G09 log file 
        Usage:
            ./g09_e0.py file.log
""")
else:
    infile = sys.argv[1]
    print("%.2f" % (e0_log(infile),))