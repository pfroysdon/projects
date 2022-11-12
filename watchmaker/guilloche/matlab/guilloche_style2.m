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
t = 0:0.01:18;
w = 2*pi;
phi = 0;
A = floor(t)/8; % 36mm dial
y = A.*sin(w*t+phi);
plot(t,y);
v = [t',y'];

plot(v(:,1),v(:,2),'-b')
axis equal
xlabel('length (mm)')
ylabel('length (mm)')
title('2D Guilloche Pattern')

hold on
for theta = 0:10:360
    % Create rotation matrix
    R = [cosd(theta) -sind(theta); sind(theta) cosd(theta)];

    % Rotate your point(s)
    vr = zeros(length(t),2);
    for ii = 1:length(t)
        vr(ii,:) = R*v(ii,:)';
    end
    plot(vr(:,1),vr(:,2),'-b')
    plot(vr(:,1),vr(:,2),'.b')
end
hold off



% save G-code
%-------------------------------------------------------------------------%
feed_rate = 400; % feed rate (mm/min)
rpm = 10000; % spindle speed (RPM)
depth = -0.125; % depth (mm)
tool_num = 501;
filename = 'guilloche_style2_tdcZero';

% fileID = fopen([filename,'.nc'],'w');
%     fprintf(fileID,'%%\n');
%     fprintf(fileID,'(guilloche)\n'); % program name
%     fprintf(fileID,'(T%d  D=0.125 CR=0 - ZMIN=-0.129 - vee)\n',tool_num);
%     fprintf(fileID,'G90\n'); % G90 = absolute mode
%     fprintf(fileID,'G17\n'); % G17 = XY plane
%     fprintf(fileID,'G21\n'); % G21 = millimiters
%     fprintf(fileID,'G28 G91 Z0\n'); % G28 = return to home, G91 = relative mode, Z0
%     fprintf(fileID,'G90\n'); % G90 = absolute mode
%     fprintf(fileID,'\n');
%     fprintf(fileID,'(scribe)\n'); % operation name
%     fprintf(fileID,'T%d M6\n',tool_num); % M6 = tool change
%     fprintf(fileID,'S%d M3\n', rpm);% S = spindle speed, M3 = spindle ON
%     fprintf(fileID,'G54\n');
%     
%     % loop through circles
%     for ii = 1:1:nc
%         % update cartesian coordinates
%         x = (rs(ii) + a .* sin(n .* theta + ts(ii))) .* cos(theta + ts(ii)) + xc; 
%         y = (rs(ii) + a .* sin(n .* theta + ts(ii))) .* sin(theta + ts(ii)) + yc;
%         
%         fprintf(fileID,'G0 X%4.3f Y%4.3f\n',x(1,1),y(1,1)); % G0 = rapid positioning
%         fprintf(fileID,'Z0.6\n');
%         fprintf(fileID,'Z0.2\n');
%         fprintf(fileID,'Z0.01\n');
%         fprintf(fileID,'G1 Z%5.3f F%d\n',depth, feed_rate); % F = feed rate, G1 linear interpolation
%         
%         % loop through points on each circle
%         for jj = 1:length(x)
%             fprintf(fileID,'G1 X%4.3f Y%4.3f\n',x(jj),y(jj));
%         end
%         fprintf(fileID,'G0 Z0.6\n');
% 
%     end
%     
%     fprintf(fileID,'G0 Z0.6\n');
%     fprintf(fileID,'G17\n'); % G17 = XY plane
%     fprintf(fileID,'G28 G91 Z0\n'); % G28 = return to home, G91 = relative mode, Z0
%     fprintf(fileID,'G90\n'); % G90 = absolute mode
%     fprintf(fileID,'G28 G91 X0 Y0\n'); % G28 = return to home, G91 = relative mode, Z0
%     fprintf(fileID,'G90\n'); % G90 = absolute mode
%     fprintf(fileID,'M30\n'); % M30 = end of program
%     fprintf(fileID,'%%');
% fclose(fileID);



% check G-code
%-------------------------------------------------------------------------%
% toolPath = gCodeReader([filename,'.nc'], 0.1, 0.1, 2, 1);


% save figures
%-------------------------------------------------------------------------%
save_all_figs_OPTION(filename,'png')

