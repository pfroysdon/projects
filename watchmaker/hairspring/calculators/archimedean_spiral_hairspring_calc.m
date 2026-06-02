% archimedean_spiral
% Compute the length of an Archimedean spiral
% 
% Syntax:
% 
% Parameters:
%   
% Return values:
%                                                                          
% Reference:  
% [1] (various), “Spiraux - Numerotation CGS,” NIHSG 35-10, Schweizer
%     Guideline 283510, 2022-03.
% [2] C.-E. Reymondin, The Theory of Horology. The Swiss Federation of
%     Technical Colleges, 2003.
% [3] Special Metals Corporation, “NI-SPAN-C Alloy 902,” vol. SMC-086,
%     2004-09.
% [4] P. F. Roysdon, Math Refresher for Machine Learning. Fibonacci Press,
%     2022.
% [5] P. F. Roysdon, Math Handbook for Machine Learning. Fibonacci Press, 
%     2022.
% [6] W. Benenson, Handbook of Physics. Springer, 2001.
% [7] A. Gelb, Applied Optimal Estimation. The MIT Press, 2001.
% [8] D. E. Kirk, Optimal Control Theory. Dover, 1998.
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%

% Copyright 2022, Paul F. Roysdon, Ph.D.,  All rights reserved.


% Start of script
%-------------------------------------------------------------------------%
close all;                   	% close all figures
clearvars; clearvars -global;	% clear all variables
clc;                         	% clear the command terminal
format shortG;                 	% picks most compact numeric display
format compact;                	% suppress excess blank lines
startup;                        % set defaults


% Initialize
%-------------------------------------------------------------------------%
id = 1.31; % diameter (mm) >> ETA 6498-1
% id = 1.41; % diameter (mm) >> Shapiro X
od = 7.18; % diameter (mm) >> ETA 6498-1
% od = 7.12; % diameter (mm) >> Shapiro X
numRotations = 13; % controls the number of spirals
e = 0.040; % thickness (mm) >> ETA 6498-1
I = 25; % balance wheel moment of inertia (mg*cm^2) >> Shapiro
f = 2.5; % frequency (Hz) >> Shapiro X
h = 0.19; % height (mm) >> ETA 6498-1
E = 27.79*1e3 * 6.895; % Young's Modulus (1x10^3 ksi)

% Calculations
%-------------------------------------------------------------------------%
% textbook calculation of M
M = I*4*pi^2*f^2*1e-4 % elastic torque (N*mm)

% textbook calculation of L
L_1 = (E*h*e^3)/(12*M*1e-3)

% textbook calculation of E (this will check that we get the same result for E)
E_1 = ((12*M*L_1)/(h*e^3))*(1/6.895)*1e-6 % Young's Modulus (1x10^3 ksi)

% **derived** calculation length L
deltaR = od/2 - id/2; % delta radius of coils in Cartesian coord.
b = ((deltaR/numRotations) - e/2); % spacing between coils
b_c = b/(2*pi); % polar coord.
a = id/2; % distance between the start of the spiral and the origin
pointsPerRotation = 100; % controls the fidelity of the spirals
theta = 0:1/pointsPerRotation:numRotations*2*pi;
[x,y] = thetaToCartesian(theta,a,b_c);
L = thetaToArcLength(theta(end),a,b_c,0) % length (mm)

% **derived** calculation of E based on derived L
% L_1 is too long, we know that L_2 is geometrically correct, so we need to
% find new values for e and h to find an acceptable number for E_2 that is
% close to the original manufacturer value for E.
% h_2 = 0.192; % **estimated** height (mm) >> ETA 6498-1
h_2 = 0.193; % **estimated** height (mm) >> Shapiro X
% e_2 = 0.032; % **estimated** thickness (mm) >> ETA 6498-1
e_2 = 0.032; % **estimated** thickness (mm) >> Shaprio X
E_2 = ((12*M*L)/(h_2*e_2^3))*(1/6.895)*1e-6 % Young's Modulus (1x10^3 ksi)

% checks
branchDistCheck = 2*b*pi;
diameterCheck = od;%2*abs(min(y));

% plot results
plot(x,y,'.-');
axis equal;
xlim([-4 4]);
ylim([-4 4]);
title(sprintf('Archimedean Spiral for ETA 6498-1\n L=%1.1f mm, e=%1.3f mm, h=%1.3f mm, D_i=%1.2f mm, D_o=%1.2f mm, b=%1.2f mm, c_n=%1.0f',...
    L,e,h,id,od,b,numRotations));
xlabel('distance (mm)');
ylabel('distance (mm)');

% Use the following to show a point at any % of the arc length
% p = 100; % controls the percentage distance along the spiral to render an annotated (radius, angle) point 
% totalPoints = length(theta);
% thetaInc = floor(totalPoints * (p/100));
% [xInc,yInc] = thetaToCartesian(theta(thetaInc),a,b);
% hold on
% plot(xInc,yInc,'ro')
% hold off
% radiusInc = thetaToRadius(theta(thetaInc),a,b)
% angleInc = theta(thetaInc)
% LInc = thetaToArcLength(theta(thetaInc),a,b,0)

% Textbook example of Archimedean Spiral
k = 0.032;
p = 0.032;
t = 0:0.1:91;
x = k.*t.*cos(t);
y = p.*t.*sin(t);
figure;
plot(x,y,'.-');
axis square;
title('Archimedean Spiral, in polar coordinates (length defined in \pi radians), for infinitely thin wire');
xlabel('distance (-)');
ylabel('distance (-)');

% dock_all_figures;
% save_all_figs_OPTION('hairspring','png');


function radius = thetaToRadius(theta,a,b)
radius = a + b*theta;
end

function theta = radiusToTheta(radius,a,b)
theta = (radius - a)/b;
end

function [x,y] = toCartesian(theta,radius)
theta = theta - pi/2;
x = radius .* cos(theta);
y = radius .* sin(theta);
end

function [x,y] = thetaToCartesian(theta,a,b)
radius = thetaToRadius(theta,a,b);
[x,y] = toCartesian(theta,radius);
end

function L = thetaToArcLength(theta,a,b,start)
c = start;
d = theta;

L = b * ...
    (((a + b * d) * sqrt((b)^2 + (a + b * d)^2)) / (2 * (b)^2) - ...
    ((a + b * c) * sqrt((b)^2 + (a + b * c)^2)) / (2 * (b)^2) + ...
    0.5 * ...
    (log(abs(a + b * d + sqrt((b)^2 + (a + b * d)^2)) / abs(b)) - ...
    log(abs(a + b * c + sqrt((b)^2 + (a + b * c)^2)) / abs(b))));
end



