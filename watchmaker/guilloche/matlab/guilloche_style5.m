% Guilloche
%
% Dr. Paul F. Roysdon
% 09/11/2020

% Start of script
%-------------------------------------------------------------------------%
close all;                   	% close all figures
clearvars;                      % clear all variables
clc;                         	% clear the command terminal
format shortG;                 	% picks most compact numeric display
format compact;                	% suppress excess blank lines

% Perform guilloche
%-------------------------------------------------------------------------%
% parameters: perimeter-dial
% spacing = ((38/2) - (34/2))/9 = 0.22 mm
% nc = 9; % number of circles
% theta = linspace(0,2.1*pi,120);
% rs = linspace(34/2,38/2,nc); % radius in mm
% t = 1; % defines the percent of the circle, e.g. 0.1 is a "pie".
% xc = 0; % circle center in x (mm)
% yc = 0; % circle center in y (mm)

% parameters: sub-dial
% spacing = (5-0.6)/20 = 0.22 mm
nc = 20; % number of circles
theta = linspace(0,2.2*pi,60);
rs = linspace(0.6,5,nc); % radius in mm
t = 1; % defines the percent of the circle, e.g. 0.1 is a "pie".
xc = 0; % circle center in x (mm)
yc = -10.363; % circle center in y (mm)

% plot
figure
hold on
for ii = 1:1:nc
    x = rs(ii) .* cos(theta .* t) + xc;
    y = rs(ii) .* sin(theta .* t) + yc;

    plot(x,y,'-b')
    plot(x,y,'.b')
end
hold off
xlim([-20 20])
ylim([-20 20])
axis equal
xlabel('length (mm)')
ylabel('length (mm)')
title('2D Guilloche Pattern')


% save G-code
%-------------------------------------------------------------------------%
feed_rate_XY = 200; % feed rate (mm/min)
feed_rate_Z = 80; % feed rate (mm/min)
rpm = 10000; % spindle speed (RPM)
depth = -0.4 -0.125; % subdial total depth (mm): (engrave depth must be -0.125mm)
% depth = -0.3 -0.125; % perimeter total depth (mm): (engrave depth must be -0.125mm)
tool_num = 502;
filename = 'guilloche_style5_subDial_tdcZero';
% filename = 'guilloche_style5_perimeter_tdcZero';
retract_height = 10; % (mm)

fileID = fopen([filename,'.nc'],'w');
    fprintf(fileID,'%%\n');
    fprintf(fileID,'(guilloche)\n'); % program name
    fprintf(fileID,'(T%d  D=0.125 CR=0 - ZMIN=-0.129 - vee)\n',tool_num);
    fprintf(fileID,'G90\n'); % G90 = absolute mode
    fprintf(fileID,'G17\n'); % G17 = XY plane
    fprintf(fileID,'G21\n'); % G21 = millimiters
    fprintf(fileID,'G28 G91 Z%d\n',retract_height); % G28 = return to home, G91 = relative mode, Z0
    fprintf(fileID,'G90\n'); % G90 = absolute mode
    fprintf(fileID,'\n');
    fprintf(fileID,'(scribe)\n'); % operation name
    fprintf(fileID,'T%d M6\n',tool_num); % M6 = tool change
    fprintf(fileID,'S%d M3\n', rpm);% S = spindle speed, M3 = spindle ON
    fprintf(fileID,'G54\n');
    
    % loop through circles
    for ii = 1:1:nc
        % update cartesian coordinates
        x = rs(ii) .* cos(theta .* t) + xc;
        y = rs(ii) .* sin(theta .* t) + yc;
        
        fprintf(fileID,'G0 X%4.3f Y%4.3f\n',x(1,1),y(1,1)); % G0 = rapid positioning
        fprintf(fileID,'Z%d\n',retract_height);
        fprintf(fileID,'Z2\n');
%         fprintf(fileID,'Z0.6\n');
%         fprintf(fileID,'Z0.2\n');
%         fprintf(fileID,'Z0.01\n');
        fprintf(fileID,'G1 Z%5.3f F%d\n',depth, feed_rate_Z); % F = feed rate, G1 linear interpolation
        depth_reset_trigger = 1;
        
        % loop through points on each circle
        for jj = 1:length(x)
%             fprintf(fileID,'G1 X%4.3f Y%4.3f\n',x(jj),y(jj));
            if depth_reset_trigger==1
                fprintf(fileID,'G1 X%4.3f Y%4.3f F%d\n',x(jj),y(jj),feed_rate_XY);
                depth_reset_trigger = 0;
            else
                fprintf(fileID,'G1 X%4.3f Y%4.3f\n',x(jj),y(jj));
            end
        end
        fprintf(fileID,'G0 Z%d\n',retract_height);

    end
    
    fprintf(fileID,'G0 Z%d\n',retract_height);
    fprintf(fileID,'G17\n'); % G17 = XY plane
    fprintf(fileID,'G28 G91 Z%d\n',retract_height); % G28 = return to home, G91 = relative mode, Z0
    fprintf(fileID,'G90\n'); % G90 = absolute mode
    fprintf(fileID,'G28 G91 X0 Y0\n'); % G28 = return to home, G91 = relative mode, Z0
    fprintf(fileID,'G90\n'); % G90 = absolute mode
    fprintf(fileID,'M30\n'); % M30 = end of program
    fprintf(fileID,'%%');
fclose(fileID);



% check G-code
%-------------------------------------------------------------------------%
toolPath = gCodeReader([filename,'.nc'], 0.1, 0.1, 1, 1);


% save figures
%-------------------------------------------------------------------------%
save_all_figs_OPTION(filename,'png')






