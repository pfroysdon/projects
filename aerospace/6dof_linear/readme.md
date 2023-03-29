# 6DOF Flight Sim - linear equations

-----------------------------------------------------------------------------------

# Introduction

***This project was an enormous undertaking, with the following key points***  
- The author designed the airplane from scratch using various aircraft design tools he designed and wrote in Matlab, including batch optimization routines to run XFOIL and AVL to optimize the vehicle layout and control surface design.  
- Then all of the aero and stibility coefficients, mass properties, and engine coefficients were developed.  
- Then a CAD model was designed from the wire-frame models in AVL.
- Then a computational fluid dynamics (CFD) model was created and a full Navier-Stokes CFD analysis was performed to validate the Vortex-Lattice results collected in AVL.
- Then a wind tunnel model was 3D printed and tested in a low-speed wind tunnel to gather actual aero coefficients.  
- Finally a 6DOF simulator was built from scratch, including the autopilot and navigation system.  
- ***This project was performed by the author alone, took nearly 4 years to complete, and the results were published in several conference and journal papers. See the BWB papers listed [here](https://github.com/pfroysdon/publications/tree/main/Papers).***

Several tools were derived from this work. including: 
- [**Aero Analysis Spreadsheet**](https://github.com/pfroysdon/projects/blob/main/aerospace/aero_analysis_spreadsheet) is a complete aircraft design speadsheet including drag build-up, take-off analysis, structures analysis, turn performance, glide performance, and a complete aero-coefficient comparison to other aircraft.
- [**3 Degrees-of-Freedom (DOF) Aerial Decelerator**](https://github.com/pfroysdon/projects/blob/main/aerospace/3dof_decelerator) (parachute) used to simulate a parachute recovery footprint given an initial altitude, airspeed and wind conditions.
- [**6 DOF Flight Simulator - Linear**](https://github.com/pfroysdon/projects/blob/main/aerospace/6dof_linear) implements classic control theory (PIDs) used for analyzing flight profiles and peformance of any aircraft.
- [**6 DOF Flight Simulator - Nonlinear**](https://github.com/pfroysdon/projects/blob/main/aerospace/6dof_nonlinear) implements model predictive control (MPC) used for simulating nonlinear flight profiles.
- [**6 DOF Trim-Condition Flight Simulator**](https://github.com/pfroysdon/projects/blob/main/aerospace/6dof_trim) used for simulating linear trim state for a given flight condition.
- [**6 DOF Flight Sim with Command Filtered Backstepping Controller**](https://github.com/pfroysdon/projects/blob/main/aerospace/6dof_backstepping) implements modern control theory with full-nonlinear command filtered backstepping.
- [**AVL batch**](https://github.com/pfroysdon/projects/blob/main/aerospace/avl_batch) performs a batch analysis of aero coefficients, using AVL, for use in a 6DOF sim.
- [**XFOIL batch**](https://github.com/pfroysdon/projects/blob/main/aerospace/xfoil_batch) performs a batch analysis of aero coefficients, using XFOIL, for use in a 6DOF sim.
- [**MDO**](https://github.com/pfroysdon/projects/blob/main/aerospace/mdo) performs a multi-disciplinary design optimization of an aircraft design.
- [**Wind Tunnel Data Analysis**](https://github.com/pfroysdon/projects/blob/main/aerospace/wind_tunnel_analysis) reduces raw wind tunnel data and converts the data into aerodynamic coefficients for a 6DOF flight simulator.
- [**Flight Data Analysis**](https://github.com/pfroysdon/projects/blob/main/aerospace/post_flight_analysis) reduces raw flight test telemetry and recorded data and converts the data into engineering units and plots the data in figures useful for post flight analysis.


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

6DOF animation of a 30 deg bank turn condition followed by a 30 deg pitch up and climb, followed by a return to straight and level flight
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/aerospace/6dof_linear/results/BWB_turn_climb_FlightViz_mod2.gif">
</p>

6DOF animation of a landing condition with a large wind gust from the side and subsequent controlled recovery to stable flight
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/aerospace/6dof_linear/results/BWB_landing_FlightViz_mod1.gif">
</p>




# References
References are available [here](https://github.com/pfroysdon/projects/blob/main/aerospace/6dof_linear/references)