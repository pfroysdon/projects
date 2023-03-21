# Signal Generator

-----------------------------------------------------------------------------------

# Introduction
The "Signal Generator toolbox" is a comprehensive and very accurate Matlab toolbox for generating aerial and ground trajectories, and then sensor outputs based on those trajectories.  The generated data is then used to evaluate real-time functions used in autopilots and navigation systems.

High-Fidelity Models which are easily modified for any manufacturer  datasheet: 
- IMU (3-axis accel, 3-axis gyro)
- GPS (L1 & L2), rover and base-station (X,Y,Z positioning)
- Magnetometer (3-axis)
- Air data (static pressure, dynamic pressure, humidity)
- Altimeter: radar, ultrasonic, LiDAR (Z positioning)
- Rangefinder: radar, ultrasonic, LiDAR (X,Y positioning)
- Signals of Opportunity (X,Y,Z positioning)

Each model has user defined:
- data-rate
- error models
- failures or drop-outs

The model outputs were verified against outputs for identical trajectories  using a commercial-off-the-shlef signal generator from NavLabs (tactical  and aviation grade simulation).

The trajectory simulator models the physics for automobiles, drones,  and fighter jets (e.g. the F16 is modeled with a full autopilot feedback control system for realistic trajectories with full 6DOF maneuvers).


# Requirements
This toolbox was been developed and tested in Matlab 8.6 64-bit on Windows 7 & 10, other versions of both Windows and Matlab 
may work but are not guaranteed. The following elements are needed in order to use this Toolbox:

- A computer with Windows 7 or 10 (64-bit is preferred).
- A Matlab r2015a (8.6) installation (64-bit is preferred).  


# Operation
Use of the toolbox is quite simple, with default values which work for  most cases.

## MAIN File
The main run file is located in the root directory, labeled "MAIN_SignalGen.m", and requires no input from the user. The user simply needs to run this file after selecting the modes of operation in the "CONFIG_SignalGen.m" file.

## CONFIG File
The main configuration file is located in the root directory,  labeled "CONFIG_SignalGen.m", and requires input from the user to select  the mode(s) of operation, e.g. GPS errors, IMU biases, etc.

Several pre-defined trajectories and sensor models (e.g. IMU, Mag) are  selectable from this file.  You can add additional models in their  respective function files.  

## Example 1: 
To add a new trajectory, open "utilities/preDef/preDef_trajectory.m",  add a new "case" number and your trajectory definitions.  This new  case number will now be selectable in the "CONFIG_SignalGen.m". Make sure that you follow the format and variable names in the already defined in "preDef_trajectory.m", e.g. 2D (car) trajectories must use "segDef_car", 3D (plane or F16) trajectories must use "segDef_plane" or "segDef_f16". 

Note: 
	- "segDef_car" only models 2D kinematics.
	- "segDef_plane" models 3D kinematics.
	- "segDef_f16" models 3D kinematics with autopilot feedback control (for smooth transitions between flight segments).

# Example 2: 
To add a new IMU, open "utilities/preDef/preDef_IMU.m", add a new  "case" number and your IMU definitions.  This new case number will  now be selectable in the "CONFIG_SignalGen.m".  Make sure that you follow the format and variable names in the already defined in "preDef_IMU.m"  

## Example 3:  
To run the "MAIN_SignalGen.m" file.  Select your options "CONFIG_SignalGen.m", then press "F5". This will generate the trajectory  data, run the IMU/ GPS/ MAG/ Altimeter, etc. models, and plot the results. 

All saved data (.mat, .doc, .jpg, .fig, etc.) from the signal generator 
are saved in the "[root]/data" directory.

# Final Note 
If you are not sure of what settings to use, leave as default!  The  default values are set to run as a "demo" mode, exercising most features  of this toolbox.


# Specific Models
- Wheel Rotary-Encoder
	- validity = [time,status,time,status,...]
	- encoder clock stability (ppm)
	- sensor errors (spin, slip, tire imflation, time delay)
	- number of encoder increments (1 every 1 degrees)
	- sensor bias
	- sensor error
	- wheel radius (L & R)
	- wheel base width
	- data rate (Hz)
	- dropout interval (samples)
	- spike interval (samples)
- IMU
	- validity = [time,status,time,status,...]
	- IMU axis: 24 possible orientations of the IMU
	- IMU clock stability (ppm)
	- initial velocity error
	- initial tilt error
	- misalignment error
	- accel Bias
	- accel scale-factor errors
	- accel Velocity Random Walk white noise standard deviation
	- accel bias cross axis scale-factor 
	- gyro Bias
	- gyro scale-factor errors
	- gyro Angular Random Walk white noise standard deviation
	- gyro cross axis scale-factor
	- gyro g sensitivity to accel along gyro input axis: deg / hr per g
	- data rate (Hz)
- GPS Paramters
	- validity = [time,status,time,status,...]
	- GPS Receiver bias (m)
	- GPS Receiver error (m/s)
	- GPS Receiver clock stability (ppm)
	- dropout interval (samples)
	- Pseudorange errors (Thermal Noise, Troposphere, SA, Multipath, Ionosphere)
	- GPS Multipath
	- Randomly drop additional GPS SV to replicate typical test data.  This
	- read from RINEX file
	- mission_UTC_time
	- GPS antenna valid angle
	- GPS Mask Angle
	- GPS Lever Arm
	- EGM96 calculations 
	- Calculate MSL and Geoid based on GPS Ellipsoid Height
	- data rate (Hz)
	- PPS latency (msec)
	- PPS counter
- Air Data
	- validity = [time,status,time,status,...]
	- clock stability (ppm)
	- static pressure errors (Pa)
	- dynamic pressure errors (Pa)
	- temperature errors (K)
	- Initial Temperature (standard day @ sea level = 15 C)
	- Initial Pressure (standard day @ sea level = 101325 Pa)
	- Baro offset alt (m)
	- Kollsman constant.  This is the correction from Standard Day.
	- pitot correction factor (polynomial coeff.)
	- static pressure correction factor (polynomial coeff.)
	- data rate (Hz)
	- dropout interval (samples)
	- spike interval (samples)
- Magnetometer
	- validity = [time,status,time,status,...]
	- EGM96 model
	- clock stability (ppm)
	- bias (milli-Gauss)
	- error (milli-Gauss)
	- angular-rate sensitivity
	- linear-rate sensitivity
	- misalignment
	- data rate (Hz)
	- dropout interval (samples)
	- spike interval (samples)
- Altimeter
	- validity = [time,status,time,status,...]
	- clock stability (ppm)
	- altitude bias
	- altitude error
	- altitude limit
	- valid angle
	- data rate (Hz)
	- dropout interval (samples)
	- spike interval (samples)
	- Terrain Model
	- Sea State Model
- Rangefinder
	- validity = [time,status,time,status,...]
	- clock stability (ppm)
	- sensor errors
	- data rate (Hz)
	- dropout interval (samples)
	- spike interval (samples)
 

# Notation Conventions
In general, the names of the varaibles are as specific as possible, and reflect naming conventions used in literature. 
Some examples below.

"r_u_ecef" Describes the position (r) of the user (_u) in the ECEF reference frame (_ecef).

"ecef2ned_pva()" Is a functions which converts position|velocity|attitude (_pva) from the ECEF reference frame to the NED reference frame (ecef2ned).

"R_a_b" Describes a rotation matrix from frame "a" (latex subscript _a) to frame "b" (latex superscript ^b).


# Technial Note
The technical note is available [here](https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/tech_note)


# Results
Below are just one of many trajectory examples.

<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_1.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_2.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_3.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_4.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_5.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_6.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_7.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_8.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_9.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_10.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_11.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_12.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_13.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_14.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_15.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_16.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_17.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_18.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_19.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_20.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_21.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_22.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_23.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_24.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_25.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_26.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_27.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_28.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/results/sigGen_complete_mission_Figure_29.png">
</p>


# References
References are available [here](https://github.com/pfroysdon/projects/blob/main/navigation/signal_generator/references)