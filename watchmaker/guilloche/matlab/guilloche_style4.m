% Guilloche
% Start of script
%-------------------------------------------------------------------------%
close all;                   	% close all figures
clearvars;                      % clear all variables
clc;                         	% clear the command terminal
format shortG;                 	% picks most compact numeric display
format compact;                	% suppress excess blank lines

% Perform guilloche
%-------------------------------------------------------------------------%
% set parameters for sinusoid on a circle
theta = 0:0.01:2*pi; % parameter (angle) 0 to 2pi
r = 2; % circle radius
a = 0.5; % sinusoid amplitude
n = 20; % number of sinusoids on the circle
xc = 0; % circle center in x
yc = 0; % circle center in y
nc = 25; % number of circles

% make a sinusoid
tau = linspace(3.0,5.5,500);
w = 2*pi;
A = floor(tau)/15;
y = A.*sin(w*tau);

% figure
% plot(tau,y,'-b')
% axis equal
% title('sinusoid')

% decriment the sinusoid and save as theta shift
ts = [];
inc = 0;
for ii = 1:10:length(tau)
    inc = inc + 1;
    ts(inc) = y(ii); % theta shift
end

% figure
% plot(ts)
% axis equal
% title('decrimented sinusoid')

% shift parameters
% ts = linspace(0.01,1,nc); % theta shift
rs = r+linspace(0.75,16,nc); % radius shift

% plot
figure
hold on
for ii = 1:1:nc
    x = (rs(ii) + a .* sin(n .* theta + ts(ii))) .* cos(theta + ts(ii)) + xc; 
    y = (rs(ii) + a .* sin(n .* theta + ts(ii))) .* sin(theta + ts(ii)) + yc;

    plot(x,y,'-b')
    plot(x,y,'.b')
end
hold off
xlim([-20 20])
ylim([-20 20])
xlabel('length (mm)')
ylabel('length (mm)')
title('2D Guilloche Pattern')


% save G-code
%-------------------------------------------------------------------------%
feed_rate = 400; % feed rate (mm/min)
rpm = 10000; % spindle speed (RPM)
depth = -0.125; % depth (mm)
tool_num = 501;
filename = 'guilloche_style4_tdcZero';

fileID = fopen([filename,'.nc'],'w');
    fprintf(fileID,'%%\n');
    fprintf(fileID,'(guilloche)\n'); % program name
    fprintf(fileID,'(T%d  D=0.125 CR=0 - ZMIN=-0.129 - vee)\n',tool_num);
    fprintf(fileID,'G90\n'); % G90 = absolute mode
    fprintf(fileID,'G17\n'); % G17 = XY plane
    fprintf(fileID,'G21\n'); % G21 = millimiters
    fprintf(fileID,'G28 G91 Z0\n'); % G28 = return to home, G91 = relative mode, Z0
    fprintf(fileID,'G90\n'); % G90 = absolute mode
    fprintf(fileID,'\n');
    fprintf(fileID,'(scribe)\n'); % operation name
    fprintf(fileID,'T%d M6\n',tool_num); % M6 = tool change
    fprintf(fileID,'S%d M3\n', rpm);% S = spindle speed, M3 = spindle ON
    fprintf(fileID,'G54\n');
    
    % loop through circles
    for ii = 1:1:nc
        % update cartesian coordinates
        x = (rs(ii) + a .* sin(n .* theta + ts(ii))) .* cos(theta + ts(ii)) + xc; 
        y = (rs(ii) + a .* sin(n .* theta + ts(ii))) .* sin(theta + ts(ii)) + yc;
        
        fprintf(fileID,'G0 X%4.3f Y%4.3f\n',x(1,1),y(1,1)); % G0 = rapid positioning
        fprintf(fileID,'Z0.6\n');
        fprintf(fileID,'Z0.2\n');
        fprintf(fileID,'Z0.01\n');
        fprintf(fileID,'G1 Z%5.3f F%d\n',depth, feed_rate); % F = feed rate, G1 linear interpolation
        
        % loop through points on each circle
        for jj = 1:length(x)
            fprintf(fileID,'G1 X%4.3f Y%4.3f\n',x(jj),y(jj));
        end
        fprintf(fileID,'G0 Z0.6\n');

    end
    
    fprintf(fileID,'G0 Z0.6\n');
    fprintf(fileID,'G17\n'); % G17 = XY plane
    fprintf(fileID,'G28 G91 Z0\n'); % G28 = return to home, G91 = relative mode, Z0
    fprintf(fileID,'G90\n'); % G90 = absolute mode
    fprintf(fileID,'G28 G91 X0 Y0\n'); % G28 = return to home, G91 = relative mode, Z0
    fprintf(fileID,'G90\n'); % G90 = absolute mode
    fprintf(fileID,'M30\n'); % M30 = end of program
    fprintf(fileID,'%%');
fclose(fileID);



% check G-code
%-------------------------------------------------------------------------%
toolPath = gCodeReader([filename,'.nc'], 0.1, 0.1, 2, 1);


% save figures
%-------------------------------------------------------------------------%
save_all_figs_OPTION(filename,'png')






