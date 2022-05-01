#!/bin/bash

#SBATCH -N 1
#SBATCH -n 64
#SBATCH --time=100:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=
#SBATCH -J job_name
#SBATCH -p amd_256
#SBATCH -o stdout
#SBATCH --get-user-env

module load g09/g09e01

mol=mol_name

for basis in pc-0 pc-1 pc-2 pc-3 aug-pc-2 aug-pc-3; do
	title="${mol}_${basis}_B3LYP_OPT_FREQ"
	echo "work for ${mol} ${basis} begins..."
	date
	g09 < ${title}.gjf > ${title}.log
	echo "work for ${mol} ${basis} ends..."
	date
done
