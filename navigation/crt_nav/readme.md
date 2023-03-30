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
  

# Unique Features
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


# References
This toolbox uses several references, most of which are listed in the files themselves.  However, the primary references are:
    - J. A. Farrell, "Aided Navigation: GPS with High Rate Sensors", McGraw Hill, 2008.
    - IS-GPS-200D.
    - Kayton & Fried, "Aviation Navigation Systems", 1997.
	
	
# Technial Note
The technical note is available [here](https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/tech_note)

# Results
Below is an example **trajectory with high multi-path and GNSS signal errors and drop-outs (for 10's of seconds)**.  The CRT Nav with LSS outlier detection and removal is able to maintain a converged navigation solution throughout the trajectory whereas most navigation systems completely fail.

<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_35.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_36.png">
</p>

<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_26.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/results/CRT_HT_L10_Rho1.35_Dop1.35_Figure_27.png">
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


# References
References are available [here](https://github.com/pfroysdon/projects/blob/main/navigation/crt_nav/references)