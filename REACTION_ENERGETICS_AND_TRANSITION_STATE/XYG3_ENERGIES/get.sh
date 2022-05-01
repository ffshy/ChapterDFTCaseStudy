#!/bin/bash

mols="H2O HY PY 4HY 4PY HY_H2O PY_H2O TST_GAS TST_H2O"
suffix="B3LYP_PC2_OPT_FREQ"


for mol in $mols; do
	g09_f=logs/${mol}_B3LYP_PC2_OPT_FREQ.log
	xDH_f=calc/${mol}/${mol}_XYG3_PC2.xDH
	e_zero=`g09_zeroc.py $g09_f`
	Ee_xDH=`g09_xyg3.py $xDH_f`
	E0K_xDH=`echo "scale=1; (($Ee_xDH) + ($e_zero))/1" | bc`
	echo " $mol    $E0K_xDH" >> XYG3_E0K.dat
done
