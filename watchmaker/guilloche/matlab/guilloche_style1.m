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
% A hypotrochoid is a roulette traced by a point P attached to a circle of 
% radius b rolling around the inside of a fixed circle of radius a, where 
% P is a distance h from the center of the interior circle. The parametric 
% equations for a hypotrochoid are 
%   x = (a-b)*cos(t)+h*cos(((a-b)/b)*t);
%   y = (a-b)*sin(t)-h*sin(((a-b)/b)*t);

% geometry 1: centered at hour/min
% size = 10; % size of circle
% R = size + 0.5; % ID to OD ratio
% r = 0.15; % density/overlap of circles
% p = size + 0.75; % ID to OD ratio
% theta = [0:0.001:2*pi]'; % number of points for each circle
% scale = 1.0; % scale
% xc = 0; % circle center in x (mm)
% yc = 0; % circle center in y (mm)

% geometry 2: centered at sub-second
size = 10; % size of circle
R = size + 0.02; % ID to OD ratio
p = size + 1.0; % ID to OD ratio
scale = 1.5; % scale
xc = 0; % circle center in x (mm)
yc = -10.363; % circle center in y (mm)

% standard bit
r = 0.10889; % density/overlap of circles
theta = [0:0.0005:2*pi]'; % number of points for each circle

% diamond drag bit
% r = 0.06; % density/overlap of circles
% theta = [0:0.0002:2*pi]'; % number of points for each circle

x = zeros(length(theta),1);
y = zeros(length(theta),1);

for ii=1:length(theta)
    x(ii,1) = ((R-r)*cos(theta(ii)) + p*cos(((R-r)/r)*theta(ii)))*scale + xc;
    y(ii,1) = ((R-r)*sin(theta(ii)) - p*sin(((R-r)/r)*theta(ii)))*scale + yc;
end

theta_star = linspace(0,2*pi,60);
rs_star = 36/2; % radius in mm
t_star = 1; % defines the percent of the circle, e.g. 0.1 is a "pie".
xc_star = 0; % circle center in x (mm)
yc_star = 0;%-10.363; % circle center in y (mm)
x_star = 36/2 .* cos(theta_star .* t_star) + xc_star;
y_star = 36/2 .* sin(theta_star .* t_star) + yc_star;

figure
hold on
plot(x,y,'-b')
plot(x,y,'.b')
% add keep-out regions
plot((38/2 .* cos(theta_star .* t_star)),(38/2 .* sin(theta_star .* t_star)),'-r','LineWidth',2)
plot((36.6/2 .* cos(theta_star .* t_star)),(36.6/2 .* sin(theta_star .* t_star)),'-r','LineWidth',2)
plot((34/2 .* cos(theta_star .* t_star)),(34/2 .* sin(theta_star .* t_star)),'-r','LineWidth',2)
plot((2.6/2 .* cos(theta_star .* t_star)),(2.6/2 .* sin(theta_star .* t_star)),'-r','LineWidth',2)
plot((5 .* cos(theta_star .* t_star)) - 0,(5 .* sin(theta_star .* t_star))-10.363,'-r','LineWidth',2)
hold off
xlim([-20 20])
ylim([-20 20])
axis equal
xlabel('length (mm)')
ylabel('length (mm)')
title('2D Guilloche Pattern')
% saveas(gcf,'guilloche_tdcZero','png')

% dock_all_figures


% save G-code
%-------------------------------------------------------------------------%
feed_rate_XY = 200; % feed rate (mm/min)
feed_rate_Z = 80; % feed rate (mm/min)
rpm = 10000; % spindle speed (RPM)
depth = -0.125; % depth (mm)
retract_height = 10; % (mm)

% Diamond Drag Bit
% tool_num = 801;
% filename = 'guilloche_style1_subDialCenter_tdcZero_DIAMOND_DRAG_BIT';

% Standard bit
tool_num = 502;
filename = 'guilloche_style1_subDialCenter_tdcZero';

% Start writing file.
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
    if tool_num~=801
        fprintf(fileID,'T%d M6\n',tool_num); % M6 = tool change
        fprintf(fileID,'S%d M3\n', rpm);% S = spindle speed, M3 = spindle ON
    end
    fprintf(fileID,'G54\n');

    % engrave only within a limited region
    keep_out_radius = 38/2; % radius of keep-out region (mm)
    init_trigger = 0; % set initial position, depth and feedrate
    keep_out_trigger = 0; % keep-out region detected
    retract_trigger = 0; % retract Z
    depth_reset_trigger = 0; % reset feed-rate for Z, and later for XY
    
    % loop through (x,y)
    for ii = 1:length(x)
        % if (x,y) is outside limits -> skip, else engrave
        if sqrt(x(ii,1)^2 + y(ii,1)^2)>keep_out_radius
            keep_out_trigger = 1; % set trigger
            if retract_trigger==0
                retract_trigger = 1;
                if init_trigger~=0
                    fprintf(fileID,'G0 Z%d\n',retract_height);
                end
            end
            
        % if (x,y) is inside limits -> engrave    
        else
            % if (x,y) is inside limit -> reset triggers
            if keep_out_trigger==1
                keep_out_trigger = 0;
                retract_trigger = 0;
                % if (x,y) within limit and initialized -> reset Z to engrave.
                if init_trigger==1
                    fprintf(fileID,'G0 X%4.3f Y%4.3f\n',x(ii,1),y(ii,1)); % G0 = rapid positioning
                    fprintf(fileID,'Z%d\n',retract_height);
                    fprintf(fileID,'Z2\n');
%                     fprintf(fileID,'Z0.6\n');
%                     fprintf(fileID,'Z0.2\n');
%                     fprintf(fileID,'Z0.01\n');
                    fprintf(fileID,'G1 Z%5.3f F%d\n',depth,feed_rate_Z); % F = feed rate, G1 linear interpolation
                    depth_reset_trigger = 1;
                end
            end
            % if (x,y) within limit and not initialized -> init and reset Z to engrave.
            if init_trigger==0
                init_trigger = 1;
                fprintf(fileID,'G0 X%4.3f Y%4.3f\n',x(ii,1),y(ii,1)); % G0 = rapid positioning
                fprintf(fileID,'Z%d\n',retract_height);
                fprintf(fileID,'Z2\n');
%                 fprintf(fileID,'Z0.6\n');
%                 fprintf(fileID,'Z0.2\n');
%                 fprintf(fileID,'Z0.01\n');
                fprintf(fileID,'G1 Z%5.3f F%d\n',depth,feed_rate_Z); % F = feed rate, G1 linear interpolation
                depth_reset_trigger = 1;
            
            % if (x,y) within limit and initialized -> engrave
            else
                if depth_reset_trigger==1
                    fprintf(fileID,'G1 X%4.3f Y%4.3f F%d\n',x(ii,1),y(ii,1),feed_rate_XY);
                    depth_reset_trigger = 0;
                else
                    fprintf(fileID,'G1 X%4.3f Y%4.3f\n',x(ii,1),y(ii,1));
                end
            end
        end
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
%-------------------------------------------------------------------------
save_all_figs_OPTION(filename,'png')




