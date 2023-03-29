# 6DOF Formation Flight Sim - linear equations

-----------------------------------------------------------------------------------

<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/aerospace/6dof_formation_flight_linear/results/formation_flight.png">
</p>

# Introduction
*** This work was a precursor to the work implemented in the [nonlinear formation flight toolbox](https://github.com/pfroysdon/projects/blob/main/aerospace/6dof_formation_flight_nonlinear)***
This "6DOF Formation Flight Simulation - linear equations toolbox" implements an advanced 6 degrees of freedom (6DOF) simulation model in Matlab and Simulink, implementing the DATCOM F-16 flight simulation model from scratch.

This project is motivated by a need to model the following methods:
- Evaluation of different guidance and control methods, e.g., neural nets, vector field, nonlinear, H-infinity, linear quadratic regulator, prue pursuit and line-of-sight, model predictive conrtol
- Evaluation of different path planning methods, e.g., Voronoi, visibility graphs, Dijkstra
- Formation maintaining (leader and follower)
- Formation joining (leader and follower)
- Formation breaking (leader and follower)

The details are available in the [tech note](https://github.com/pfroysdon/projects/blob/main/aerospace/6dof_formation_flight_linear/tech_note), however the document is quite dated and there are several minor errors that I don't have time to correct.


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
The technical note is available [here](https://github.com/pfroysdon/projects/blob/main/aerospace/6dof_formation_flight_nonlinear/tech_note)

# Results
Example flight geometry for formation joining
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/aerospace/6dof_formation_flight_linear/results/formation_flight_geometry.png">
</p>


# References
References are available [here](https://github.com/pfroysdon/projects/blob/main/aerospace/6dof_formation_flight_nonlinear/references)