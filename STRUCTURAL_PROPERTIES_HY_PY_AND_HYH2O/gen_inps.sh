#!/bin/bash

mkdir calc
for mol in HY PY HY_H2O; do
	tmp_inp="gjfs/${mol}_TMP.gjf"
	mkdir -p calc/${mol}
	cp basis/* calc/${mol} 
        for func in SVWN PBEPBE BP86 BLYP TPSSTPSS M06L B3LYP BHandHLYP CAM-B3LYP LC-wPBE wB97 M06 M062X TPSSh; do
		title="${mol}_${func}_PC2_OPT_FREQ"
		sed -e "s/title_string/${title}/g" \
	            -e "s/func_name/${func}/g" \
	 	    -e "s/basis_file/pc-2.gbs/g" ${tmp_inp} > calc/${mol}/${title}.gjf
		echo "construction for ${mol} ${func} is done."	
	done
done
