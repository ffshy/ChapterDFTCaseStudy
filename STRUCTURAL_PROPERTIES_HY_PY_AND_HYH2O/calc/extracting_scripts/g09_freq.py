#!/usr/bin/env python3
# -*- coding:utf-8 -*-

import numpy as np
import sys

def freqs_log(filename):
    """
        to read frequencies in the G09 log file
    """
    fs = []
    with open(filename, "r") as f:
        while True:
            line = f.readline()
            if not line:
                break
            if len(line.split()) > 2 and " ".join(line.split()[0:2]) == "Frequencies --":
                fs += [float(x) for x in line.split()[2:]]
    fs = np.array(fs)
    return fs

if len(sys.argv) < 3:
    print("""
        Purpose:
            to read the given i-th mode frequency in the given G09 log file
        Usage:
            ./g09_freq.py file.log i
""")
    exit(1)
else:
    infile =  sys.argv[1]
    imode = int(sys.argv[2])
    fs = freqs_log(infile)
    print(" %.0f " % (fs[imode-1],) )