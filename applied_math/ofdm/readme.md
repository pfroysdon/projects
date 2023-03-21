# Orthogonal Frequency Division Multiplexing

-----------------------------------------------------------------------------------

# Introduction
Many applications demand multi-carrier wireless transmission in various environments.  To evaluate this problem we consider an emerging technology for high data rates, Orthogonal Frequency Division Multiplexing (OFDM).  This paper applies OFDM to a robust, high-fidelity, MATLAB simulation with a user interface for BPSK, QPSK, 16-PSK and 256-PSK modulation schemes with variable IFFT size, Number of Carriers, SNR, and Amplitude clipping by the communication channel.  The simulation emulates a modern embedded Digital Signal Processor (DSP) and is applied to a 8-bit grey-scale image. An analysis of the transmitted results are presented, and a demonstration of the trade-off of Bit Error Rate vs. data-rate is provided.


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


# Technial Note
The technical note is available [here](https://github.com/pfroysdon/projects/blob/main/applied_math/ofdm/tech_note)

# Results
Below are just one of many examples.

Original Photo
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/applied_math/ofdm/results/Lenna_BW.jpg">
</p>

Photo received with 16PSK and SnR 0 dB
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/applied_math/ofdm/results/lenna_BW_OFDM_16PSK_SnR_0dB.jpg">
</p>

Photo received with 16PSK and SnR 0 dB
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/applied_math/ofdm/results/lenna_BW_OFDM_16PSK_SnR_30dB.jpg">
</p>

Time signals
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/applied_math/ofdm/results/results_OFDM_time_multi_sample.jpg">
</p>

Received phases
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/applied_math/ofdm/results/results_received_phases.jpg">
</p>

# References
References are available [here](https://github.com/pfroysdon/projects/blob/main/applied_math/ofdm/references)