# Joint Probabilistic Data Association Filters

-----------------------------------------------------------------------------------

# Introduction

This code is designed to track multiple targets simultaneously, particularly targets whose paths cross.  Typical trackers will incorrectly switch targets whose paths cross.  However, when you want to track something continuously, e.g., a human in a crowd or a a bird in a flock of birds, then you need Joint Probabilistic Data Association Filter that associates the probability of the tracked object relative to other objects.

This code is a demo that implements multiple target tracking in 2 dimensions. It is inspired by work of Y. Bar-Shalom related to Probabilistic Data Association Filters (PDAF).

1. Generates number of points moving on different trajectories. 
2. Adds clutter and noisy points. 
3. Initializes the tracking structures. 
4. Implements multiple target tracking over the time. 
5. The tracking supports multiple target initiation, occlusion and loss.


# Requirements
This toolbox was been developed and tested in Matlab 8.6 64-bit on Windows 7 & 10, other versions of both Windows and Matlab 
may work but are not guaranteed. The following elements are needed in order to use this Toolbox:

- A computer with Windows 7 or 10 (64-bit is preferred).
- A Matlab r2015a (8.6) installation (64-bit is preferred).  


# Operation
Use of the toolbox is quite simple, with default values which work for most cases. The code is well commented, so you should read the header of each file to understand the input/output, as well as the body of the code to understand the variables and parameters.


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
The technical note is available [here](https://github.com/pfroysdon/projects/blob/main/applied_math/jpdaf/tech_note)

# Results
Below are just one of many trajectory examples.

<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/applied_math/jpdaf/results/JPDAF_tracking_demo4.gif">
</p>

<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/applied_math/jpdaf/results/JPDAF_results_update4_Figure_2.jpg">
</p>

<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/applied_math/jpdaf/results/JPDAF_results_update4_Figure_3.jpg">
</p>


# References
References are available [here](https://github.com/pfroysdon/projects/blob/main/applied_math/jpdaf/references)