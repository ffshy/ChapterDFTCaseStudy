#!/bin/bash

outfile="func_choices_structures.dat"
funcs="SVWN PBEPBE BP86 BLYP TPSSTPSS M06L B3LYP BHandHLYP CAM-B3LYP LC-wPBE wB97 M06 M062X TPSSh"

for func in ${funcs}; do
	f_HY=HY/HY_${func}_PC2_OPT_FREQ.log
	f_PY=PY/PY_${func}_PC2_OPT_FREQ.log
	f_HY_H2O=HY_H2O/HY_H2O_${func}_PC2_OPT_FREQ.log
	bond1=`g09_bond.py $f_HY 1 8 12`   # O-H bond in HY
	freq1=`g09_freq.py $f_HY 30`       # O-H stretching in HY
	bond2=`g09_bond.py $f_PY 2 8 12`   # N-H bond in PY
	freq2=`g09_freq.py $f_PY 30`       # N-H stretching in PY
	# then we have H-bonds in H2O complexes.
	# HY:OH---O    HY:N---HO     PY:O---HO    PY:NH---O
	b3=`g09_bond.py $f_HY_H2O  8 13 15`
	b4=`g09_bond.py $f_HY_H2O  2 15 15`
	echo "$func   $bond1    $freq1    $bond2    $freq2    $b3   $b4  " >> $outfile 
done
