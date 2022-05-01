#!/bin/bash
#SBATCH -o stdout
#SBATCH --partition=C032M0128G
#SBATCH --qos=low
#SBATCH -A hpc0006175276 
#SBATCH -J tst_h2o
#SBATCH --get-user-env
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=6
#SBATCH --mail-type=end
#SBATCH --mail-user=
#SBATCH --time=100:00:00


module load g09/g09e1

#for mol in H2O HY PY HY_H2O PY_H2O; do
#	cd $mol
#		title=${mol}_TPSSh_PC2_OPT_FREQ
#		g09 < $title.gjf > $title.log &
#	      	sleep 1	
#	cd ..
#done
#wait

g09 < TST_H2O_TPSSh.gjf > TST_H2O_TPSSh.log
