#!/bin/bash

for mol in HY PY H2O HY_H2O PY_H2O 4HY 4PY; do
	logfile="${mol}/${mol}_G3.log"
	E_G3=`grep "G3(0 K)=" $logfile | awk '{print $3}'`
	echo "$mol      $E_G3"  >> G3_data.dat
done
