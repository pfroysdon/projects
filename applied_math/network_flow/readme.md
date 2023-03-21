# Network Flow

-----------------------------------------------------------------------------------

# Introduction
Contemporary machine learning applications attempt to solve network flow (netflow) problems from a variety of mathematical approaches.
Herein we take the classical approach applying Linear Programming (LP) to netflow and consider the following:

- (data) transportation problem.
- (data) trans-shipment problem.
- Assignment problem.
- Shortest route problem.
- Maximum flow problem.
- Minimum cut problem.
- Shortest route tree problem.

We formulate each problem from the min-cost LP perspective.


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
The technical note is available [here](https://github.com/pfroysdon/projects/blob/main/applied_math/network_flow/tech_note)

# Results
Below are just one of many examples.

Minimum vertex weight problem
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/applied_math/network_flow/results/MinVertexWeightPath_Figure_1.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/applied_math/network_flow/results/MinVertexWeightPath_Figure_2.png">
</p>
<p align="center">
	<img width="600" img src="https://github.com/pfroysdon/projects/blob/main/applied_math/network_flow/results/MinVertexWeightPath_Figure_3.png">
</p>

# References
References are available [here](https://github.com/pfroysdon/projects/blob/main/applied_math/network_flow/references)