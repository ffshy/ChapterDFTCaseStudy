#!/bin/bash

mols="HY PY HY_H2O PY_H2O"

for mol in $mols; do
	mkdir $mol
	cp ../others/${mol}/${mol}_TPSSh_PC2_OPT_FREQ.chk $mol
	cp files/G3_TMP.gjf   $mol 
	title=${mol}_G3
	cd $mol
		sed -i "s/molname/${mol}/g" G3_TMP.gjf
		mv G3_TMP.gjf ${title}.gjf	
	cd ..
	echo "construction for ${mol} is done. !"
done
