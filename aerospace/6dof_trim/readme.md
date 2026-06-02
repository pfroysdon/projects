# 6DOF Trim-state

-----------------------------------------------------------------------------------

# Introduction
The "6DOF Trim-state toolbox" is a "from-scratch" Matlab 6 degrees of freedom (DOF) flight simulator that uses nonlinear optimization to find the trim state of any vehicle for a given flight condition.

The aero coefficients, mass properties, engine coefficients were developed for a flying wing (with winglets) using a combination of XFOIL, AVL and other tools, as described in the [AIAA InfoTech 2011 conference paper](https://github.com/pfroysdon/projects/blob/main/aerospace/6dof_linear/tech_note).

The output contains:

Diagnostics
- Final Cost
- Number of Func Evals
- Number of Iterations
- Elapsed Time (min)

Flight Conditions
- Turn Rate(deg/s)
- Climb Rate (ft/s)
- Altitude (ft)
- Mach No.
- IAS (kts)
- EAS (kts)
- TAS (kts)
- Dynamic Press (psf)
- Power
- Weight (lb)
- Xcg (in)
- Ycg (in)
- Zcg (in)
- Ixx (slug-ft2)
- Iyy (slug-ft2)
- Izz (slug-ft2)
- Ixz (slug-ft2)

State Vector
- TAS (fps)
- AoA (deg)
- AoSS (deg)
- Roll (deg)
- Pitch (deg)
- Yaw (deg)
- P (deg/s)
- Q (deg/s)
- R (deg/s)
- North Position (ft)
- East Position (ft)
- Down Position (ft)
- Engine Speed (%)
   
Control Vector
- Throttle(%)
- Elevator (deg)
- Aileron (deg)
- Rudder (deg)



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
The technical note is available [here](https://github.com/pfroysdon/projects/blob/main/aerospace/6dof_trim/tech_note)

# Results
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/aerospace/6dof_trim/results/6DOF.png">
</p>

# References
References are available [here](https://github.com/pfroysdon/projects/blob/main/aerospace/6dof_trim/references)