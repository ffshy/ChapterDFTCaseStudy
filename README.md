#### Summary

Here we provide the input (`.gjf`) and output (`.log`) files for the Gaussian09 calculations mentioned in the Case Study part of chapter DFT in the book titled *Quantum Chemistry in the Age of Machine Learning*. 

#### Contents

* ./B3LYP_OPT_FREQ_CHECK_BASIS_SETS

    Data of Table 1. HY/PY geometry optimization and frequency analysis using B3LYP functional. Basis sets pc-0, pc-1, pc-2, aug-pc-2 and aug-pc-3 are tested.

* ./STRUCTURAL_PROPERTIES_HY_PY_AND_HYH2O

    Data of Table 2. Structural properties of HY, PY and HY(H2O) are calculated using pc-2 basis set and different levels of density functional approximations. CCSD reference bond lengths and angles are computed at ./STRUCTURAL_PROPERTIES_HY_PY_AND_HYH2O/CCSD_OPTIMIZATION

* ./VIBRATIONAL_SPECTRA

    Data of Figs. 3 and 4. The IR and Raman spectra of HY and PY molecule calculated at the CAM-B3LYP/pc-2 level of theory.

* ./REACTION_ENERGETICS_AND_TRANSITION_STATE

    Data of Table 3. The reaction energies of the HY/PY isomerization with and without hydrogen-bonding with H2O. 

    Contents in this directory: 

    * GAS_PHASE_ISOMERIZATION/ & H2O_CATALYZED_ISOMERIZATION/: transition state calculation data 
    * HY_binding_with_H2O/: calculation of the binding energy of HY with H2O using different functionals.
    * 4HY_4PY/: calculation of the relative stability of 4HY and 4PY 
    * XYG3_ENERGIES/ & G3_ENERGIES: calculation with the XYG3 doubly hybrid functional and the G3 model chemistry.

#### Notes

1. Use "functional/gen" keyword and @basis_filename in the input file to use user-supplied basis sets.
2. All Gaussian checkpoint files (`.chk`) are removed to save storage. For some calculations, we use previous generated checkpoint files to provide (initial) structures by the `geom=checkpoint` option. For example, `XYG3` calculation is based on `B3LYP` structure, and `G3` calculation uses the `TPSSh` or `B3LYP` structure as the initial structure. Please notice that and generate your own input if you need. 

3. Remember to use `freq=raman` option to generated Raman spectra.

4. For geometry optimization of transition state using the `qst3` keyword, you can load three converged geometry optimization output files into one molecule group in the GaussView5.0, e.g., the reactant, product and reactant, and edit the last structure to be an initial guess of the transition state. In GaussView5.0, follow "File"->"Open"->"Target(Add all files to active molecule group)" to load multiple structures into one molecule group. 

5. To get total energy E(0K), i.e., electronic energy plus zero-point correction, find the string "Sum of electronic and zero-point Energies=" in the "Thermochemistry" part of the output file. The output should be from an calculation with keywords combination of "opt" and "freq". Look for "Sum of electronic and thermal Free Energies=" instead to get Gibbs free energy at 298.15K and 1.0 atm. 

6. Use GaussView5.0 to open the output files and follow "Results"->"Vibrations" to visualize normal modes, get IR/Raman spectra, etc. 

7. Structural parameters can be obtained with the help of GaussView. Or you can use our provided extracting scripts in separate directories for obtaining bond lengths quickly. 

8. Most of the calculation can be completed in Linux PCs or clusters with the command "g09 < filename.gjf > filename.log". Please modify the number of processors and memory in input templates according to your own resources. And write your own scripts for running calculation in PC or submitting jobs on computing clusters. 

9. See further notes at README.txt files at sub-directories.

