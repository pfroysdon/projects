# AVL Batch

-----------------------------------------------------------------------------------

# Introduction
The "AVL Batch toolbox" uses Matlab to perform a batch run and optimization of an aircraft design.


# Requirements
This toolbox was been developed and tested in Matlab 8.6 64-bit on Windows 7 & 10, other versions of both Windows and Matlab 
may work but are not guaranteed. The following elements are needed in order to use this Toolbox:

- A computer with Windows 7 or 10 (64-bit is preferred).
- A Matlab r2015a (8.6) installation (64-bit is preferred).  


# Operation
Use of the toolbox is quite simple, with default values which work for most cases. The code is well commented, so you should read the header of each file to understand the input/output, as well as the body of the code to understand the variables and parameters.

This file performs the following actions:
1. Sets the initial parameters
2. Runs the AVL_xxx.m files

To run this script you must have the following:
1. Directories: 
        \airfoils - directory for all reference airfoil .dat files
2. Files:
        AVL_sweep.m - main file for run
        AVL_plot.m - main file for plotting
        AVL_build_aerodata.m - main file for building the aero deck
        AVL_geo.m - main file for building the AVL geometry file
        AVL_opt.m - main file for the optimization routine
        avl326.exe - main file for analysis
        run_avl.bat - enables batch run process
            (created by AVL_sweep.m)
        avl_run_def.dat - global runtime parameters for each run
            (created by AVL_sweep.m)
        'name'.avl - aircraft configuration file
            (created by AVL_geo.m)
        'name'.mass - aircraft mass properties file
            (created by AVL_sweep.m)
        'name'.run - run parameters file
            (created by AVL_sweep.m)
        avl_doc.txt - AVL User Guide (for reference only)

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
The technical note is available [here](https://github.com/pfroysdon/projects/blob/main/aerospace/avl_batch/tech_note)

# Results

AVL Runtime Routines
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/aerospace/avl_batch/results/AVL_MatLab.JPG">
</p>

AVL wire-frame vortex-lattice model for the blended wing body (BWB)
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/aerospace/avl_batch/results/AVL_bwb_VLM.jpg">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/aerospace/avl_batch/results/AVL_VLM_BWB_model.JPG">
</p>

Pitching moment results from over 1000 runs at 1000 different flight conditions
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/aerospace/avl_batch/results/AVL_MatLab_pitching_moment.JPG">
</p>

Rolling moment results from over 1000 runs at 1000 different flight conditions
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/aerospace/avl_batch/results/AVL_MatLab_rolling_moment.JPG">
</p>

Yawing moment due to delta aileron results from over 1000 runs at 1000 different flight conditions
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/aerospace/avl_batch/results/AVL_MatLab_yawing_moment_delta_aileron.JPG">
</p>

Yawing moment due to delta elevator results from over 1000 runs at 1000 different flight conditions
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/aerospace/avl_batch/results/AVL_MatLab_yawing_moment_delta_elevator.JPG">
</p>

Yawing moment due to delta rudder results from over 1000 runs at 1000 different flight conditions
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/aerospace/avl_batch/results/AVL_MatLab_yawing_moment_delta_rudder.JPG">
</p>


# References
References are available [here](https://github.com/pfroysdon/projects/blob/main/aerospace/avl_batch/references)