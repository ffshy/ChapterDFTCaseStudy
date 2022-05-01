#!/bin/bash

for func in SVWN PBEPBE BP86 BLYP TPSSTPSS M06L B3LYP BHandHLYP CAM-B3LYP LC-wPBE wB97 M06 M062X; do
	echo "----------------- $func ---------------"
	tail -n 1 $func/TST_H2O_${func}.log
done
