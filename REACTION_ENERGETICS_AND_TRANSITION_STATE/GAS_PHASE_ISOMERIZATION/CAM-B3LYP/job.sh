#!/bin/bash

#SBATCH -N 1
#SBATCH -n 64
#SBATCH --time=100:00:00
#SBATCH --mail-type=end
#SBATCH --mail-user=
#SBATCH -J gas_CAM-B3LYP
#SBATCH -p amd_256
#SBATCH -o stdout
#SBATCH --get-user-env

module load g09/g09e01

title="TST_GAS_CAM-B3LYP"

date
g09 < ${title}.gjf > ${title}.log
date
