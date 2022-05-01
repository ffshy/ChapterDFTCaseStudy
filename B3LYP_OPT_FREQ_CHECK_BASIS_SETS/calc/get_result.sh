#!/bin/bash

outfile="basis_choices.dat"
basis_sets="pc-0 pc-1 pc-2 pc-3 aug-pc-2 aug-pc-3"

for basis in ${basis_sets}; do
	f1=HY/HY_${basis}_B3LYP_OPT_FREQ.log
	f2=PY/PY_${basis}_B3LYP_OPT_FREQ.log
	bond1=`g09_bond.py $f1 1 8 12`   # O-H bond in HY
	bond2=`g09_bond.py $f2 2 8 12`   # N-H bond in PY
	freq1=`g09_freq.py $f1 30`       # O-H stretching in HY
	freq2=`g09_freq.py $f2 30`       # O-H stretching in PY
	E0K_HY=`g09_e0.py $f1`
	E0K_PY=`g09_e0.py $f2`
	dE0K=`echo "scale=1; (($E0K_PY) - ($E0K_HY))/1" | bc`
	echo "$basis    $bond1    $freq1    $bond2    $freq2    $dE0K    " >> $outfile 
done
