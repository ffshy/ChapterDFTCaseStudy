#!/bin/bash
#SBATCH -o stdout
#SBATCH --partition=C032M0256G
#SBATCH --qos=low
#SBATCH -A hpc0006175276 
#SBATCH -J G3_4PY
#SBATCH --get-user-env
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=6
#SBATCH --mail-type=end
#SBATCH --mail-user=
#SBATCH --time=100:00:00


module load g09/g09e1

g09 < 4PY_G3.gjf > 4PY_G3.log
