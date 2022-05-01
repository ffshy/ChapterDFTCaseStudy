#!/bin/bash

for func in SVWN PBEPBE BP86 BLYP TPSSTPSS M06L B3LYP BHandHLYP CAM-B3LYP LC-wPBE wB97 M06 M062X; do
	cp pc-2.gbs job.sh  $func 
	cd $func
		sed -i -e "s/job_name/h2o_${func}/g" \
		       -e "s/func/${func}/g" job.sh
		sbatch job.sh
	cd ..
done
