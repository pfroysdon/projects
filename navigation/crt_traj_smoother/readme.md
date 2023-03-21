# Contemplative Real-time (CRT) trajectory smoother

-----------------------------------------------------------------------------------

# Introduction
The "Contemplative Real-time (CRT) trajectory smoother toolbox" uses real-time C++ functions, translated to Matlab, for post-processing using either real (recorded) data or synthetic data. This system performs a full-nonlinear bayesian optimal estimation for the generation of **ground truth** using IMU and GPS measurements **without integer ambiguity resolution**.  The system is easily extendable to other sensors, e.g. mag, baro, etc.

This toolbox conatins all necessary functions to read raw IMU & GPS data.  State vector is position, velocity, attitude and gyro and accel bias estimates.  Position, velocity and attitude are provided in both NED and ECEF reference frames at both low rate (rate of the GPS) and high-rate (rate of the IMU).


# Requirements
This toolbox was been developed and tested in Matlab 8.6 64-bit on Windows 7 & 10, other versions of both Windows and Matlab 
may work but are not guaranteed. The following elements are needed in order to use this Toolbox:

- A computer with Windows 7 or 10 (64-bit is preferred).
- A Matlab r2015a (8.6) installation (64-bit is preferred).  


# Operation
Use of the toolbox is quite simple, with default values which work for  most cases.

## MAIN File
The main run file is located in the root directory, labeled "MAIN_... .m", and requires no input from the user. The user simply needs to run this file after selecting the modes of operation in the "CONFIG_... .m" file.

## CONFIG File
The main configuration file is located in the root directory,  labeled "CONFIG_... .m", and requires input from the user to select  the mode(s) of operation, e.g. GPS errors, IMU biases, etc.

# Final Note 
If you are not sure of what settings to use, leave as default!  The  default values are set to run as a "demo" mode, exercising most features  of this toolbox.


# Notation Conventions
In general, the names of the varaibles are as specific as possible, and reflect naming conventions used in literature. 
Some examples below.

"r_u_ecef" Describes the position (r) of the user (_u) in the ECEF reference frame (_ecef).

"ecef2ned_pva()" Is a functions which converts position|velocity|attitude (_pva) from the ECEF reference frame to the NED reference frame (ecef2ned).

"R_a_b" Describes a rotation matrix from frame "a" (latex subscript _a) to frame "b" (latex superscript ^b).


# Technial Note
The technical note is available [here](https://github.com/pfroysdon/projects/blob/main/navigation/crt_traj_smoother_integers/tech_note)

# Results
Below are just one of many trajectory examples.

<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_traj_smoother_integers/results/traj_smoother_int_Figure_1.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_traj_smoother_integers/results/traj_smoother_int_Figure_2.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_traj_smoother_integers/results/traj_smoother_int_Figure_3.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_traj_smoother_integers/results/traj_smoother_int_Figure_4.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_traj_smoother_integers/results/traj_smoother_int_Figure_5.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_traj_smoother_integers/results/traj_smoother_int_Figure_6.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_traj_smoother_integers/results/traj_smoother_int_Figure_7.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_traj_smoother_integers/results/traj_smoother_int_Figure_8.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_traj_smoother_integers/results/traj_smoother_int_Figure_9.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_traj_smoother_integers/results/traj_smoother_int_Figure_10.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_traj_smoother_integers/results/traj_smoother_int_Figure_11.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_traj_smoother_integers/results/traj_smoother_int_Figure_12.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_traj_smoother_integers/results/traj_smoother_int_Figure_13.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_traj_smoother_integers/results/traj_smoother_int_Figure_14.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_traj_smoother_integers/results/traj_smoother_int_Figure_15.png">
</p>


# References
References are available [here](https://github.com/pfroysdon/projects/blob/main/navigation/crt_traj_smoother_integers/references)