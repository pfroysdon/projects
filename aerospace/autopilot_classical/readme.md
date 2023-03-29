# Autopilot - classical equations

-----------------------------------------------------------------------------------

# Introduction
The "autopilot - classical equations" is a full-functional autopilot and navigation system, built in C/C++ and uses a specifically designed PCB, that is able to control the following aerial vehicles:

- Airplane (cruciform tail and vee-tail)
- Delta wing
- Flying Wing
- Helicopter
- Bi-copter
- Tri-copter
- Quadcopter (both + and X configurations)
- Y4 multicopter
- Y6 multicopter
- Hexacopter (both + and X configurations)
- Octocopter (double-quad, flat +, flat X, flat V)

The autopilot uses **classical control theory** with a PID controller. 
 
The navigation system consists of a GPS-aided AHRS with basic filtering (no Kalman filtering).


# Unit Tests 
Use the included items to test the basic functionality of the system without autopilot code.

Test in the following order:
1. test_Status_LED 				- this will check the Arduino Leonardo functionality with analog ports.
2. test_I2C_Scanner 			- this will verify that the Arduino can "see" the sensors.
3. test_AccelGyro 				- this will check that the IMU is functioning.
4. test_Baro 					- this will check that the Baro is functioning.
5. test_Mag 					- this will check that the Mag is functioning.
6. test_Sonar 					- this will check that the Sonar is functioning.
7. test_Motor_cmd 				- this will verify the Arduino commands to the motors.
8. test_Motor_cmd_stress_test	- this will stress the motor circuit to check for faulty motor connections & battery voltage level.


# Acknowledgements
I would like to thank the many contributions to the open source community for software and hardware ideas.
I have included what I believe to be the best from what I have seen on many platforms and combined them 
into the RazorPilot software and hardware, including the RadorQuad, ultimately making the RazorPilot very 
unique.  

Specifically I would like to thank:
	•	Bill Premerlani for his innovative navigation and controls software architecture.
	•	The MultiWii team for their compact integer-based core C-code architecture.
	•	William Thielicke for his creative frame designs. 
	•	The UAV Dev Board team for their tireless code development and testing.
	•	The SparkFun team for their unique approach to electronics hardware.
	•	The AeroQuad team for their object oriented C++ code sensor I/O models.
	•	The ArduPilot & ArduCopter teams for their pioneering efforts in the realm of DIY UAV's.

Each of these groups of people from all around the world have contributed to the general development and testing 
of multicopters, and each of them has contributed unique code, designs and ideas.  Thank you all.


# Technial Note
The technical note is available [here](https://github.com/pfroysdon/projects/blob/main/aerospace/autopilot_classical/tech_note)

# Results

<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/aerospace/autopilot_classical/results/razor_pilot.png">
</p>


# References
References are available [here](https://github.com/pfroysdon/projects/blob/main/aerospace/autopilot_classical/references)