#!/bin/bash
#SBATCH -o stdout
#SBATCH --partition=C032M0128G
#SBATCH --qos=normal
#SBATCH -A hpc0006175276 
#SBATCH -J PY
#SBATCH --get-user-env
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --mail-type=end
#SBATCH --mail-user=
#SBATCH --time=100:00:00

module load g09/g09e1

g09 < PY_CCSD_PC2_OPT_FREQ.gjf > PY_CCSD_PC2_OPT_FREQ.log
