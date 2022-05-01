#!/bin/bash
#SBATCH -o stdout
#SBATCH --partition=C032M0128G
#SBATCH --qos=low
#SBATCH -A hpc0006175276 
#SBATCH -J tst_gas
#SBATCH --get-user-env
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=6
#SBATCH --mail-type=end
#SBATCH --mail-user=sunhuaiyang@pku.edu.cn
#SBATCH --time=100:00:00

#srun hostname -s | sort -n > slurm.hosts

#module load intel/2017.1 
#module load vasp/5.4.4-intel-2017.1

#mpirun -np 32 vasp_std

module load g09/g09e1

#for mol in H2O HY PY HY_H2O PY_H2O; do
#	cd $mol
#		title=${mol}_TPSSh_PC2_OPT_FREQ
#		g09 < $title.gjf > $title.log &
#	      	sleep 1	
#	cd ..
#done
#wait

g09 < TST_GAS_TPSSh.gjf > TST_GAS_TPSSh.log
