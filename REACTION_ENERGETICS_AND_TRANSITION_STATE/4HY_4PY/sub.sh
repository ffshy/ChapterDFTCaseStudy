#!/bin/bash

for mol in 4HY 4PY; do
	cp job.sh calc/${mol}
	cd calc/${mol}
		sed -i -e "s/mol_name/${mol}/g" -e "s/job_name/${mol}_pc2/g" job.sh
		sbatch job.sh
	cd ../../
done
