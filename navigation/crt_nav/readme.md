# Contemplative Real-Time (CRT) Navigation System

-----------------------------------------------------------------------------------

<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/crt_nav.png">
</p>

# Introduction
***The following was the result of several years of Ph.D. research. The dissertation, conference papers and journal papers are located [here](https://github.com/pfroysdon/publications/tree/main/Papers).***

The Contemplative Real-Time (CRT) Navigation System and State Estimation Toolbox is a software package for the design and evaluation of various state estimation methods.  This package contains several elements to aid in development and simulation, and is part of a toolset which contains:

-   Signal Generator: which generates ground truth as well as sensor data for GPS, Encoder, IMU, Magnetometer, Air Data, Range Finder, Altimeter, and others.
-   State Estimators: which include various Dead-Reckoning, Extended Kalman Filters, and MAP estimators.
-   xUnit: which includes a widely used Matlab-based unit test suite.
-   MonteCarlo: which is applies a Monte Carlo approach to system testing.
-   Covariance Analysis: which enables the evaluation of which states to model in a Stochastic Filter.
-   Parser: which includes several sub functions to parse real-time data from various navigation systems and GPS receivers, as well as NMEA, NTRIP, RINEX, RTCM, SP3, and others.
-   Animation & Graphics: which includes trajectory animation for various vehicles (Porsche, Quad-copter, F-16, 747) which can be saved to a .mp4 movie file.  This also includes GPS constellation animations, and the ability to save the trajectories to Google Earth .kml and .kmz files.
  
Using nonlinear optimization, CRT Nav can immediately recover from 180 degree yaw misalignment while nearly all other navigation systems will diverge and fail.
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/optimal_yaw.png">
</p>

Using differential GPS, CRT Nav achieves 1 cm position accuracy.
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_Nav_monteCarlo.png">
</p>

Using advanced mathematics, CRT Nav fully accounts for time deltas from various sensors and properly integrates the nav solution to the precise time points when the measurement is valid.
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_Nav_timingDiagram.png">
</p>

The CRT Nav software design is intentionally flexible.
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_Nav_SW_flowDiagram.png">
</p>

The Tactical-grade CRT Nav system is very portable 
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/IMG_4065.JPG">
</p>

The post-test data parser and data analysis suite makes testing and deployment easy.
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_Nav_dataParser.png">
</p>


# Basic Operation
## Operation
    Use of the toolbox is quite simple, with default values which work for 
    most cases.

## Main Run File
    The main run file is located in the root directory, labeled "MAIN_CRT_Nav.m", and
    requires input from the user to select the mode(s) of operation, as well 
    as what items to save upon completion (data, figures, animation, etc.).
   
## Example
    To run the CRT Nav Estimation with synthetic data, you can 
    "enable" the signal gen by setting "settings.genData = 1;" and "settings.
    runEst = 1;" located near the top of the "MAIN.m" file.  This will run 
    the signal gen first, followed by the Encoder-GPS EKF, plotting the 
    results for both. 

## Signal Gen Comments
    If you do not enable the signal gen, the software will assume that you 
    wish to use the previously generated file "signals_data.mat" (located in 
    the "[root]/data/" directory), which it will load 
    before running the state estimator.

    If you wish to change the parameters of the sensors (or enable/disable 
    sensors) you will need to open the signal gen configuration file located 
    in the "[root]" directory called "CONFIG_SignalGen.m".  The code
    in this file is well commented, and everything should be self-explanatory.

## State Estimator Comments
    If you wish to use a different state estimator, you will need to 
    un-comment the desired function located in the "State Estimation" section
    of the "MAIN.m" file.

    If you wish to run a state-estimator manually (without running the 
    "MAIN.m" and associated files) you may do so by opening the desired 
    state-estimator "[name].m" file located in the "[root]/estimator/" 
    directory, you will need to manually comment-out the function line at the
    top of the file, and uncomment the 3 lines within the "test code" section
    near the top of that file, there-by enabling the "clear" and "load" 
    commands necessary for operation of the file in manual mode.

    All saved data (.mat, .doc, .jpg, .fig, etc.) from the state estimator 
    simulations are saved in the "[root]/data" directory.

## Final Note
    If you are not sure of what settings to use, leave as default!  The 
    default values are set to run as a "demo" mode, exercising most features 
    of this toolbox.


# References
This toolbox uses several references, most of which are listed in the files themselves.  However, the primary references are:
    - J. A. Farrell, "Aided Navigation: GPS with High Rate Sensors", McGraw Hill, 2008.
    - IS-GPS-200D.
    - Kayton & Fried, "Aviation Navigation Systems", 1997.


# Requirements
This toolbox was been developed and tested in C/C++ and Matlab 8.6 64-bit on Windows 7 & 10, other versions of both Windows and Matlab may work but are not guaranteed. The following elements are needed in order to use this Toolbox:

- A computer with Windows 7 or 10 (64-bit is preferred).
- A Matlab r2015a (8.6) installation (64-bit is preferred).  


# Notation Conventions
In general, the names of the varaibles are as specific as possible, and reflect naming conventions used in literature. 
Some examples below.

"r_u_ecef" Describes the position (r) of the user (_u) in the ECEF reference frame (_ecef).

"ecef2ned_pva()" Is a functions which converts position|velocity|attitude (_pva) from the ECEF reference frame to the NED reference frame (ecef2ned).

"R_a_b" Describes a rotation matrix from frame "a" (latex subscript _a) to frame "b" (latex superscript ^b).


# Technial Note
The technical note is available [here](https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/tech_note)

# Results
Example trajoectory output

<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_1.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_2.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_3.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_4.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_5.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_6.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_7.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_8.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_9.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_10.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_11.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_12.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_13.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_14.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_15.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_16.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_17.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_18.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_19.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_20.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_21.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_22.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_23.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_24.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_25.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_26.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_27.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_28.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_29.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_30.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_31.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_32.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_33.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_34.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_35.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_36.png">
</p>



# References
References are available [here](https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/references)