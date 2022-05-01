#!/bin/bash

funcs="SVWN PBEPBE BP86 BLYP TPSSTPSS M06L B3LYP BHandHLYP CAM-B3LYP LC-wPBE wB97 M06 M062X"
mols="HY PY"
dir_prefix="/home/tmcstu/shy/works/2PO_2HP/new_data_Gaussian09_20210826/pc2_optfreq/calc"

for func in $funcs; do
	mkdir $func
	for mol in $mols; do
		cp $dir_prefix/$mol/${mol}_${func}_PC2_OPT_FREQ.log $func
	done
done
