#!/bin/bash

mkdir calc
for mol in HY PY; do
	tmp_inp="gjfs/${mol}_TMP.gjf"
	mkdir -p calc/${mol}
	cp basis/* calc/${mol} 
	for basis in pc-0 pc-1 pc-2 pc-3 aug-pc-2 aug-pc-3; do
		title="${mol}_${basis}_B3LYP_OPT_FREQ"
		sed -e "s/title_string/${title}/g" \
	 	    -e "s/basis_file/${basis}.gbs/g" ${tmp_inp} > calc/${mol}/${title}.gjf
		echo "construction for ${mol} ${basis} is done."	
	done
done
