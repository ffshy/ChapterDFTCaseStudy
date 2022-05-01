#!/bin/bash

for func in SVWN PBEPBE BP86 BLYP TPSSTPSS M06L B3LYP BHandHLYP CAM-B3LYP LC-wPBE wB97 M06 M062X; do
	echo "----------------- $func ---------------"
	tail -n 1 4HY_${func}_PC2_OPT_FREQ.log
done
