#!/bin/bash
#SBATCH -o stdout
#SBATCH --partition=C032M0128G
#SBATCH --qos=low
#SBATCH -A hpc0006175276 
#SBATCH -J H2O_G3
#SBATCH --get-user-env
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=6
#SBATCH --mail-type=end
#SBATCH --mail-user=
#SBATCH --time=100:00:00


module load g09/g09e1

g09 < H2O_G3.gjf > H2O_G3.log
