#!/usr/bin/env python3
# -*- coding:utf-8 -*- 

import sys

# constant
au2klmol = 2.62549961709828E+03

def e_xyg3_log(filename):
    """
        to read the E(XYG3) information from a xDH log file
        output in kJ/mol
    """
    with open(filename, "r") as f:
        while True:
            line = f.readline()
            if not line:
                break
            if len(line.split()) == 8 and line.split()[4] == "E(XYG3)":
                e_xyg3 = float(line.split()[-2])
                break
    return e_xyg3 * au2klmol

if len(sys.argv) < 2:
    print("""
        Purpose:
            to extract the XYG3 energy information from a xDH log file 
        Usage:
            ./g09_xyg3.py file.xDH
""")
else:
    infile = sys.argv[1]
    print("%.2f" % (e_xyg3_log(infile),))