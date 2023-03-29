# 6DOF Flight Sim - non-linear equations

-----------------------------------------------------------------------------------

# Introduction
This "6DOF Flight Simulation toolbox" implements an advanced 6 degrees of freedom (6DOF) simulation model in Matlab and Simulink using **full-nonlinear optimization for the guidance and control laws (using modern control theory) as well as the optimal non-linear Bayesian state estimation system (more advanced than Kalman filters).**

This 6DOF is capable of being modified for various airplanes provided the following assumptions are followed:
    - The simulator is built using English (Imperial) units, because is common in the aircraft industry.
	- The simulator assumes that the vehicle uses electrical propulsion, thus the mass is fixed (e.g. no fuel flow).
	- The simulator assumes that a unique dataset for aero, mass, engine and autopilot coefficients are available.
	- The simulator does not increase control surface effectiveness with increased throttle.  Typically on propeller driven airplanes, the prop-wash flows over the vertical and horizontal surfaces, increasing their effectivness/ control power.  While this can have a significant effect, no accounting for this is made in the sim.
	
The aero coefficients, mass properties, engine coefficients were developed for a flying wing (with winglets) using a combination of XFOIL, AVL and other tools, as described in the [AIAA InfoTech 2011 conference paper](https://github.com/pfroysdon/projects/blob/main/aerospace/6dof_linear/tech_note).


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
The technical note is available [here](https://github.com/pfroysdon/projects/blob/main/aerospace/6dof_linear/tech_note)

# Results
6DOF simulator using  Matlab and Simulink for the 6DOF calculations and Flight Gear Flight Sim for the UI
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/aerospace/6dof_linear/results/BWB_FGFS.jpg">
</p>

CAD render of the BWB designed by Dr. Paul F. Roysdon
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/aerospace/6dof_linear/results/BWB_concept_render2_20091212.jpg">
</p>

# References
References are available [here](https://github.com/pfroysdon/projects/blob/main/aerospace/6dof_linear/references)