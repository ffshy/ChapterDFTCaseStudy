#!/bin/bash

#SBATCH -N 1
#SBATCH -n 64
#SBATCH --time=100:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=
#SBATCH -J PY_pc2
#SBATCH -p amd_256
#SBATCH -o stdout
#SBATCH --get-user-env

module load g09/g09e01

mol=PY

for func in SVWN PBEPBE BP86 BLYP TPSSTPSS M06L B3LYP BHandHLYP CAM-B3LYP LC-wPBE wB97 M06 M062X; do
	title="${mol}_${func}_PC2_OPT_FREQ"
	echo "work for ${mol} ${func} begins..."
	date
	g09 < ${title}.gjf > ${title}.log
	echo "work for ${mol} ${func} ends..."
	date
done
