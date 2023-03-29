# XFOIL Batch

-----------------------------------------------------------------------------------

# Introduction
The "XFOIL Batch toolbox" uses Matlab to perform a batch run and optimization of an aircraft design.

**For additional information, see the blended wing body (BWB) papers listed [here](https://github.com/pfroysdon/publications/tree/main/Papers)**


# Requirements
This toolbox was been developed and tested in Matlab 8.6 64-bit on Windows 7 & 10, other versions of both Windows and Matlab 
may work but are not guaranteed. The following elements are needed in order to use this Toolbox:

- A computer with Windows 7 or 10 (64-bit is preferred).
- A Matlab r2015a (8.6) installation (64-bit is preferred).  


# Operation
Use of the toolbox is quite simple, with default values which work for most cases. The code is well commented, so you should read the header of each file to understand the input/output, as well as the body of the code to understand the variables and parameters.

To run this script you must have the following:
1. Directories: 
	- \airfoils - contains all reference airfoil .dat files
	- \results - container for all runtime results
	- \polars - container for all airfoil polar .dat files
2. Files:
	- xfoilP4.exe - main file for analysis
	- pplot.exe - main file for plotting results
	- run_xfoil.bat - enables batch run process (created by XFOIL_batch.m)
	- run_pplot.bat - enables batch run process (created by XFOIL_batch.m)
	- xfoil.def - GLOBAL parameters (created by XFOIL_batch.m)
	- xfoil_run_def.dat - RUNTIME parameters for each run (created by XFOIL_batch.m)
	- pplot_run_def.dat - RUNTIME parameters for each run (created by XFOIL_batch.m)
	- 'airfoil name'.dat - airfoil file located in the \airfoils directory
	- xfoil_doc.txt - XFoil User Guide (for reference only)

## MAIN File
The main run file is located in the root directory, labeled "MAIN_ ... .m", while user selectable options are located in the "CONFIG_ ... .m".

## Example  
To run the simulation with test data, simply run the "MAIN_ ... .m" file. This will load the data, run the necessary functions, and plot the results. All saved data (.mat, .doc, .jpg, .fig, etc.) are saved in the "[root]/results" directory.

## Final Note 
If you are not sure of what settings to use, leave as default!  The default values are set to run as a "demo" mode, exercising most features of this toolbox.


# Notation Conventions
In general, the names of the varaibles are as specific as possible, and reflect naming conventions used in literature. 
Some examples below.

"r_u_ecef" Describes the position (r) of the user (_u) in the ECEF reference frame (_ecef).

"ecef2ned_pva()" Is a functions which converts position|velocity|attitude (_pva) from the ECEF reference frame to the NED reference frame (ecef2ned).

"R_a_b" Describes a rotation matrix from frame "a" (latex subscript _a) to frame "b" (latex superscript ^b).


# Technial Note
The technical note is available [here](https://github.com/pfroysdon/projects/blob/main/aerospace/xfoil_batch/tech_note)

# Results

XFOIL Runtime Routines
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/aerospace/xfoil_batch/results/XFOIL_MatLab.JPG">
</p>

Alpha sweep of the MH61 airfoil
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/aerospace/xfoil_batch/results/XFOIL_MH61_alpha_sweep.jpg">
</p>

Lift and Drag polar plots for the MH61 airfoil
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/aerospace/xfoil_batch/results/XFOIL_MH61_polar.JPG">
</p>

Alpha sweep of the NLF airfoil
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/aerospace/xfoil_batch/results/XFOIL_NLF_alpha_sweep.JPG">
</p>

Lift and Drag polar plots for the NLF airfoil
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/aerospace/xfoil_batch/results/XFOIL_NLF_polar.JPG">
</p>



# References
References are available [here](https://github.com/pfroysdon/projects/blob/main/aerospace/xfoil_batch/references)