#!/usr/bin/env python3
# -*- coding:utf-8 -*-

import numpy as np
import sys

def bond_log(filename, iat, jat, natoms):
    """
        read the log file of G09 and return bond length between atom i 
        and j for the optimized structure.
        natom: number of atoms
    """
    with open(filename, "r") as f:
        crds = []
        while True:
            line = f.readline()
            if not line:
                break
            if len(line.split()) > 2 and line.split()[1] == "Optimized":
                while True:
                    lnew = f.readline()
                    if len(lnew.split()) == 2 and lnew.split()[0] == "Standard":
                        break
                for i in range(4):
                    f.readline()
                for i in range(natoms):
                    crds.append([float(x) for x in f.readline().split()[3:]])
                break
        crds = np.array(crds)
        x = crds[iat-1,:]
        y = crds[jat-1,:]
    return np.sqrt( ((x - y)**2).sum() )


if len(sys.argv) < 5:
    print("""
        Purpose:
            to extract bond between atom i and j in the Gaussian09 log file
        Usage:
            ./g09_bond.py file.log i j natoms
""")
    exit()
else:
    infile = sys.argv[1]
    iat, jat, natoms = int(sys.argv[2]), int(sys.argv[3]), int(sys.argv[4])
    print(" %8.3f" % (bond_log(infile, iat, jat, natoms),))