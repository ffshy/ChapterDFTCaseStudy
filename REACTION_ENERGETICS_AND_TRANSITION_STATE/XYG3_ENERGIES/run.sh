#!/bin/bash

mols="H2O HY PY 4HY 4PY HY_H2O PY_H2O TST_GAS TST_H2O"
suffix="B3LYP_PC2_OPT_FREQ"
f_dir=files

mkdir calc

for mol in $mols; do
	mkdir -p calc/$mol
	cp $f_dir/TMP.gjf chk/${mol}_${suffix}.chk $f_dir/pc-2.gbs calc/$mol
        cd calc/$mol
	infile=${mol}_XYG3_PC2.gjf
	sed -i "s/molname/${mol}/g" TMP.gjf
	mv TMP.gjf $infile
	run_xDH_using_Gaussian.py -g 09 $infile
	cd ../../
	echo "$mol is done" >> record.dat
	date	
done
