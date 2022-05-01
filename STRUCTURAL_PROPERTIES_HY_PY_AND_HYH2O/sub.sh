#!/bin/bash

for mol in HY PY HY_H2O; do
	cp job.sh calc/${mol}
	cd calc/${mol}
		sed -i -e "s/mol_name/${mol}/g" -e "s/job_name/${mol}_pc2/g" job.sh
		sbatch job.sh
	cd ../../
done
