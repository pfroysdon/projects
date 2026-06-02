# EKF for GPS-aided INS

-----------------------------------------------------------------------------------

# Introduction
The "EKF GPS INS toolbox" uses real-time C++ functions, translated to Matlab, for simulation and post-processing using either real (recorded) data or synthetic data. The functions implemented are commonly used in navigation systems.

This toolbox enables the design and evaluation of various EKF State Estimation methods. It conatins all necessary functions to read raw IMU & GPS data.  EKF state vectors are estimated, and position, velocity, attitude estimates are calculted in NED, LLH, ECEF, and ECI reference frames for quick comparison.

Several types of states are modeled and can be aided in a variety of ways.  Below are a summary of the states and measurements.

Description of modeled states:
- [p]           = 3 pos
- [p,v]         = 3 pos, 3 vel
- [p,v,a]       = 3 pos, 3 vel, 3|4 att (euler|quat)
- [p,v,acc]     = 3 pos, 3 vel, 3 acceleration
- [...,ba,bg]   = 3 acc bias, 3 gyro bias states
- [...,bcb,bcd] = GPS RX clock bias & clock drift states
- [...,bpr]     = 12 GPS range bias states
- [...,bb]      = 1 baro bias states
- [...,bm]      = 3 mag bias states

Description of aiding measurements:
- ZUPT = zero-velocity updates for stationary cases
- SBAS = SBAS iono or pseudo range corrections
- LC = loosely-coupled GPS
	- position (Code)
	- position & velocity (Code & Doppler)
	- position (Carrier-Phase)
- TC = tightly-coupled GPS
	- position (Code)
	- position & velocity (Code & Doppler)
	- position (Carrier-Phase)
- DD = double-differenced (Code, Doppler, Carrier-Phase)
- BA = baro altitude
- MH = magnetic heading


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

# Results
Below are just one of many trajectory examples.

<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_1.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_2.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_3.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_4.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_5.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_6.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_7.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_8.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_9.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_10.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_11.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_12.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_13.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_14.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_15.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_16.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_17.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_18.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_19.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_20.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_21.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_22.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_23.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_24.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_25.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_26.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_27.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_28.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_29.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_30.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_31.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_32.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_33.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins/results/Complete_mission_Figure_34.png">
</p>