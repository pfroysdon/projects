# projects

-----------------------------------------------------------------------------------

# Project Overview
This repository is a **collection of projects from my MS & PhD research, and hobby interests**.  


Note: **Most projects require a password to access the source code**, while others are free and open to the public.  This repository is a **work in progress,** some projects are better documented than others.  I will clean this up as I have time to do so.


# Aerospace
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/figures/aircraft_design_toolbox2.png">
</p>

This repo is a collection of tools from my **masters research and publications** on blended-wing-body (BWB) aircraft:
- [**3 degrees-of-freedom (DOF) aerial decellerator**](https://github.com/pfroysdon/projects/blob/main/aerospace/3dof) (parachute) used to simulate a parachute recovery footprint given an initial altitude, airspeed and wind conditions.
- [**6 DOF flight simulator**](https://github.com/pfroysdon/projects/blob/main/aerospace/6dof) used for analyzing flight profiles and peformance of any aircraft.
- [**Aero Analysis Spreadsheet**](https://github.com/pfroysdon/projects/blob/main/aerospace/aero_analysis_spreadsheet) is a complete aircraft design speadsheet including drag build-up, take-off analysis, structures analysis, turn performance, glide performance, and a complete aero-coefficient comparison to other aircraft.
- [**Antenna Tracker (Software & GUI)**](https://github.com/pfroysdon/projects/blob/main/aerospace/antenna_tracker) is a tool to generate both simulated and realtime azimuth and elevation servo commands for a narrow beam antenna gimbal to track an aircraft.
- [**Autopilot - Classical Control Theory (Software & GUI)**](https://github.com/pfroysdon/projects/blob/main/aerospace/autopilot_classical) is real-time embedded software for guidance and control of a fixed-wing aircraft (standard wing, delta, flying wing), Helicopters, and multi-copters (bi, tri, quad, hexa, octa) using classical control theory.
- [**Autopilot - Modern Control Theory (Software & GUI)**](https://github.com/pfroysdon/projects/blob/main/aerospace/autopilot_modern) is real-time embedded software for guidance and control of a fixed-wing aircraft (standard wing, delta, or flying wing), using modern nonlinear backstepping control theory.
- [**AVL batch**](https://github.com/pfroysdon/projects/blob/main/aerospace/avl_batch) performs a batch analysis of aero coefficients, using AVL, for use in a 6DOF sim.
- [**Camera Gimbal (Software & GUI)**](https://github.com/pfroysdon/projects/blob/main/aerospace/camera_gimbal) is real-time embedded software to control a 2 or 3-axis camera stabalization gimbal.
- [**On-screen Display (Software & GUI)**](https://github.com/pfroysdon/projects/blob/main/aerospace/on_screen_display) is real-time embedded software used to display real-time flight parameters to a heads-up-display.
- [**XFOIL batch**](https://github.com/pfroysdon/projects/blob/main/aerospace/xfoil_batch) performs a batch analysis of aero coefficients, using XFOIL, for use in a 6DOF sim.


# Applied Math
<p align="center">
	<img width="500" img src="https://github.com/pfroysdon/projects/blob/main/figures/ILP_Lite_Main.png">
</p>

This repo is a collection of tools from **personal and Ph.D. research in mathematics and machine learning**:
- [**Cascaded AML**](https://github.com/pfroysdon/projects/blob/main/applied_math/cascaded_aml) performs an adversarial machine learning (AML) analysis using a cascaded algorithm.
- [**ilpLite**](https://github.com/pfroysdon/projects/blob/main/applied_math/ilpLite) is a complete implementation of integer linear programming for network analysis.
- [**JPDAF**](https://github.com/pfroysdon/projects/blob/main/applied_math/jpdaf) is a complete implementation of a joint-probability data-association filter (JPDAF); basically a cascaded EKF for object tracking.
- [**Network Flow**](https://github.com/pfroysdon/projects/blob/main/applied_math/network_flow) performs a network flow anaysis using ilpLite.
- [**OFDM**](https://github.com/pfroysdon/projects/blob/main/applied_math/ofdm) is an advanced sim for othogonal frequency division multiplexing.


# Navigation
<p align="center">
	<img width="500" img src="https://github.com/pfroysdon/projects/blob/main/figures/navigation_toolbox2.png">
</p>

This repo is a collection of tools from my **Ph.D. research and publications**:
- [**AHRS State Estimation**](https://github.com/pfroysdon/projects/blob/main/navigation/ahrs) is a complete implementation of an attitude heading and reference system.
- [**Allan Variance**](https://github.com/pfroysdon/projects/blob/main/navigation/allan_variance) is a complete implementation of an Allan-Variance analysis.
- [**Baro Temporal Propagation**](https://github.com/pfroysdon/projects/blob/main/navigation/baro_temporal_prop) is a complete implementation of a baro-altitude temporal propagation algorithm.
- [**Covariance Analysis**](https://github.com/pfroysdon/projects/blob/main/navigation/covariance) is a complete implementation of a covariance analysis to select parameters to estimate in a state estimation filter.
- [**CRT LSS Nav (Software & GUI)**](https://github.com/pfroysdon/projects/blob/main/navigation/crt) is a complete GPS-aided INS nav that implements a *state-of-the-art full-nonlinear optimal Bayesian navigation system*. This system is highly flexible with selectable states (GPS loosely-coupled, GPS tightly-coupled, GPS single-differencing, GPS double-differencing, baro-aiding), selectable initialization modes, selectable mechanization (NED, wander-azimuthm, ECEF, ECI), and IMU errros (bias, scale factor, quantiization)
- [**Trajectory Smoother**](https://github.com/pfroysdon/projects/blob/main/navigation/trajectory_smoother) this tool performs a full nonlinear optimization to smooth a trajectory using INS and GPS to an accuracy of 1 meter in position.
- [**Trajectory Smoother with Integers**](https://github.com/pfroysdon/projects/blob/main/navigation/trajectory_smoother_integers) this tool performs a full nonlinear optimization to smooth a trajectory using INS and L1/L2 GPS to an *accuracy of 1 centimeter* in position.  *This is used for generating ground-truth in my scientific publications.*
- [**Data Acquisition System**](https://github.com/pfroysdon/projects/blob/main/navigation/daq) is a complete implementation of data acquisition system with GPS, IMU, Mag, and 20 A2D channels.
- [**Data Parser CRT**](https://github.com/pfroysdon/projects/blob/main/navigation/parser_crt) parses the binary messages generated from real-time CRT navigation system.
- [**Data Parser NovAtel**](https://github.com/pfroysdon/projects/blob/main/navigation/parser_novatel) parses the binary messages generated from a real-time NovAtel GPS system.
- [**Data Parser uBlox**](https://github.com/pfroysdon/projects/blob/main/navigation/parser_ublox) parses the binary messages generated from a real-time uBlox GPS system.
- [**EKF GPS**](https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps) is a complete implementation of an extended Kalman filter (EKF) for a GPS receiver with selectable 5, 8, and 11-states.
- [**EKF GPS INS**](https://github.com/pfroysdon/projects/blob/main/navigation/ekf_gps_ins) is a complete implementation of an EKF for a GPS-aided inertial navigation system (INS).  This system is highly flexible with selectable states (GPS loosely-coupled, GPS tightly-coupled, GPS single-differencing, GPS double-differencing, baro-aiding), selectable initialization modes, selectable mechanization (NED, wander-azimuthm, ECEF, ECI), and IMU errros (bias, scale factor, quantiization).
- [**EKF IMU zero-update**](https://github.com/pfroysdon/projects/blob/main/navigation/ekf_imu_zero_update) is a complete implementation of an EKF performing zero-updates (velocity or angular rate) of an IMU.  This is used to evaluate the real-time performance of IMU accel-bias and gyro-bias parameters.
- [**GPS Positioning**](https://github.com/pfroysdon/projects/blob/main/navigation/gps_positioning) is a complete implementation of GPS positioning system using pseudo-range, doppler and phase on both L1 and L2 frequencies for precise positioning.
- [**IMU Coning & Sculling**](https://github.com/pfroysdon/projects/blob/main/navigation/imu_coning_sculling) calculates the coning and sculling errors of an IMU.
- [**IMU Divergence**](https://github.com/pfroysdon/projects/blob/main/navigation/imu_divergence) evaluates the divergence and covariance of several different grades of IMU's.
- [**INS Alignment**](https://github.com/pfroysdon/projects/blob/main/navigation/ins_alignment) is a complete implementation of an INS alignment.
- [**INS Error Comparison**](https://github.com/pfroysdon/projects/blob/main/navigation/ins_error_comp) evaluates the errors of several different grades of IMU's.
- [**INS Error Sensitivity**](https://github.com/pfroysdon/projects/blob/main/navigation/ins_error_sens) evaluates the error sensitivity of several different grades of IMU's given a trajectory.
- [**INS Temporal Propagation**](https://github.com/pfroysdon/projects/blob/main/navigation/ins_temporal_prop) is a complete implementation of an INS temporal propagation algorithm in with selectable mechanization (NED, wander-azimuthm, ECEF, ECI).
- [**Mag Calibration**](https://github.com/pfroysdon/projects/blob/main/navigation/mag_cal) is a complete implementation of a 3-axis magnetometer calibration.
- [**Mag Temporal Propagation**](https://github.com/pfroysdon/projects/blob/main/navigation/mag_temporal_prop) is a complete implementation of a 3-axis magnetometer temporal propagation.
- [**Monte Carlo**](https://github.com/pfroysdon/projects/blob/main/navigation/monte_carlo) is a complete MonteCarlo analysis toolbox for evaluating EKF and CRT performance. 
- [**ReFrame GUI**](https://github.com/pfroysdon/projects/blob/main/navigation/reframe) is a GUI to load attitude data from a .CSV and transform the reference frame from NED to ECEF or ECI.  This is used for visual inspection of robotics data with an unknown reference frame definition.
- [**RTK**](https://github.com/pfroysdon/projects/blob/main/navigation/rtk) is a complete implementation of a real-time kinematic GPS positioning system using both a base station and rover for 1 cm level positioning.
- [**Signal Generator**](https://github.com/pfroysdon/projects/blob/main/navigation/signal_gen) is a complete implementation of a 3DOF/6DOF trajectory generator and a signal generator for several sensors (GPS, IMU, baro, mag, sonar, radar, and signals of opportunity).
- [**3DOF/6DOF Trajectory Generator**](https://github.com/pfroysdon/projects/blob/main/navigation/tragetory_gen) is a complete implementation of a trajectory generator for both air and land vehicles.  This tool implements both a kinematics model capable of any trajectory, and an F-16 6DOF model capable of advanced aerial profiles with realistic autopilot feed-back loops (this uses the NASA F-16 6DOF model parameters).


# Musings
This repo is a collection of random projects:
- [**Garden Bot**](https://github.com/pfroysdon/projects/blob/main/musings/garden_bot) is a real-time embedded software for a garden irrigation system.
- [**Package Shaker**](https://github.com/pfroysdon/projects/blob/main/musings/package_shaker) is a real-time embedded software for a "Gag Gift" that, when triggered, either shakes a package, sounds a siren or plays a melody.
- [**Greenhouse**](https://github.com/pfroysdon/projects/blob/main/musings/greenhouse) is a complete build guide with blueprints for 10'x12' floating panel greenhouse that can be built using common tools and materials sourced from any home-improvement store.

# Watchmaker
This repo is a collection of tools for **watchmakers**:
- [**Beat Rate**](https://github.com/pfroysdon/projects/blob/main/watchmaker/beat_rate) this tool uses recorded audio of a mechanical watch to determine the beat rate and phase of the balance.  Beat error results in a watch running fast or slow.  This enables the precise adjustment of a mechanical watch to reduce beat error. 
- [**Guilloche CAD/CAM**](https://github.com/pfroysdon/projects/blob/main/watchmaker/guilloche) this toolbox generates complex geometric patterns for wrist watch dials, and then generates the tool paths and g-code (machine code) for use on a CNC mill.
- [**Hairspring Calculations**](https://github.com/pfroysdon/projects/blob/main/watchmaker/hairspring) This project contains a complete report of the equations, derivations and unit conversion to calculate the length of a hairspring for any material, thickness, and height.  A spreadsheet "calculator" is also provided, to automatically calculate the length given a few input parameters.
