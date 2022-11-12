function toolPath = gCodeReader(filepath, dist_res, angle_res, plot_path, verbose)
%gCodeReader  Function that takes a G-Code file and outputs the tool path 
% for plotting/analysis. Not a complete analysis of the whole file, but 
% more or less the basic motions. 
% Inputs: 
%        - path to G-Code file
%        - point spacing for linear motion (mm or inches, I guess)
%        - point spacing for arc motion (degrees)
%        - Plot the current path: no=0, yes=1, yes+animate=2
%        - Output 1=current line, 2=raw G-Code to console
% Outputs:
%        - The interpolated tool path
% Notes:
%        - This is not at all complete, but should work well enough for
%        simple CNC G-Code. If you need anything more complex, I'd suggest
%        you implement it yourself, as this was more or less all I needed
%        at the time.
%        - I have also done zero optimization.
%        - This comes with no guarantees or warranties whatsoever, but I
%        hope it's useful for someone.
% 
% Example usage:
%       toolpath = gCodeReader('simplePart.NC',0.5,0.5,1,0);
% 
% Tom Williamson
% 18/06/2018

raw_gcode_file = fopen(filepath);

% Modes
Rapid_positioning = 0;
Linear_interpolation = 1;
CW_interpolation = 2;
CCW_interpolation = 3;
current_mode = NaN;

% Initialize variables
current_pos = [0,0,0];
toolPath = [];
arc_offsets = [0,0,0];
interp_pos = [];
lineInc = 0;
while ~feof(raw_gcode_file)
    lineInc = lineInc + 1;
    if verbose == 1
        fprintf(1,'Reading Line %d\n',lineInc);
    end
    tline = fgetl(raw_gcode_file);
    % Check if its an instruction line
    if (~isempty(tline)) && (tline(1) ~= '(') && (tline(1) ~= '%')
        arc_offsets = [0,0,0];
        %tline = tline(6:end);
        splitLine = strsplit(tline,' ');
        for i = 1:length(splitLine)
            if verbose == 2
                disp(splitLine{i});
            end
            % Check what the command is (only the main ones are
            % implemented i.e. G0 - G3)
            if strcmp(splitLine{i}, 'G0')
                if verbose == 2
                    disp('Rapid positioning')
                end
                current_mode = Rapid_positioning;
            elseif strcmp(splitLine{i}, 'G1')
                if verbose == 2
                    disp('Linear interpolation')
                end
                current_mode = Linear_interpolation;
            elseif strcmp(splitLine{i}, 'G2')
                if verbose == 2
                    disp('Circular interpolation, clockwise')
                end
                current_mode = CW_interpolation;
            elseif strcmp(splitLine{i}, 'G3')
                if verbose == 2
                    disp('Circular interpolation, counterclockwise')
                end
                current_mode = CCW_interpolation;
            else
                if splitLine{i}(1) == 'X'
                    current_pos(1) = str2num(splitLine{i}(2:end));
                elseif splitLine{i}(1) == 'Y'
                    current_pos(2) = str2num(splitLine{i}(2:end));
                elseif splitLine{i}(1) == 'Z'
                    current_pos(3) = str2num(splitLine{i}(2:end));
                elseif splitLine{i}(1) == 'I'
                    arc_offsets(1) = str2num(splitLine{i}(2:end));
                elseif splitLine{i}(1) == 'J'
                    arc_offsets(2) = str2num(splitLine{i}(2:end));
                elseif splitLine{i}(1) == 'G'
                    arc_offsets(2) = str2num(splitLine{i}(2:end));
                end
            end
        end
        % Check the current mode and calculate the next points along the
        % path: linear modes
        if current_mode == Linear_interpolation || current_mode == Rapid_positioning
            if length(toolPath > 0)
                interp_pos = [linspace(toolPath(end,1),current_pos(1),100)',linspace(toolPath(end,2),current_pos(2),100)',linspace(toolPath(end,3),current_pos(3),100)'];
                dist = norm((current_pos - toolPath(end,:)));
                if dist > 0
                    dire = (current_pos - toolPath(end,:))/dist;
                    interp_pos = toolPath(end,:) + dire.*(0:dist_res:dist)';
                    interp_pos = [interp_pos;current_pos];
                end
            else
                interp_pos = current_pos;
            end
        % Check the current mode and calculate the next points along the
        % path: arc modes, note that this assumes the arc is in the X-Y
        % axis only
        elseif current_mode == CW_interpolation
            center_pos = toolPath(end,:) + arc_offsets;
            v1 = (toolPath(end,1:2)-center_pos(1:2));
            v2 = (current_pos(1:2)-center_pos(1:2));
            
            r = norm(current_pos(1:2)-center_pos(1:2));
            angle_1 = atan2d(v1(2),v1(1));
            angle_2 = atan2d(v2(2),v2(1));
 
            if angle_2 > angle_1
                angle_2 = angle_2-360;
            end
            interp_pos = [center_pos(1:2) + [cosd(angle_1:-angle_res:angle_2)',sind(angle_1:-angle_res:angle_2)']*r, linspace(center_pos(3),current_pos(3),length(angle_1:-angle_res:angle_2))'];
            interp_pos = [interp_pos;current_pos];
        elseif current_mode == CCW_interpolation
            center_pos = toolPath(end,:) + arc_offsets;
            v1 = (toolPath(end,1:2)-center_pos(1:2));
            v2 = (current_pos(1:2)-center_pos(1:2));
            r = norm(current_pos(1:2)-center_pos(1:2));
            angle_1 = atan2d(v1(2),v1(1));
            angle_2 = atan2d(v2(2),v2(1));
           if norm(v1) <0.1
                angle_1 = 0;
            end
            if norm(v2) <0.1
                angle_2 = 0;
            end
            
            if angle_2 < angle_1
                angle_2 = angle_2+360;
            end
            interp_pos = [center_pos(1:2) + [cosd(angle_1:angle_res:angle_2)',sind(angle_1:angle_res:angle_2)']*r, linspace(center_pos(3),current_pos(3),length(angle_1:angle_res:angle_2))'];
            interp_pos = [interp_pos;current_pos];
        end
        toolPath = [toolPath;interp_pos];
    end
end

% Plot if requested
if plot_path==1
    figure
    plot3(toolPath(:,1),toolPath(:,2),toolPath(:,3),'r-');
    xlabel('length (mm)')
    ylabel('length (mm)')
    zlabel('length (mm)')
    title('CAM Tool-path')
elseif plot_path==2
    % plot
    figure;
    plot3(toolPath(:,1),toolPath(:,2),toolPath(:,3),'r-');
    xlabel('length (mm)')
    ylabel('length (mm)')
    zlabel('length (mm)')
    title('CAM Tool-path')
    % animation
    figure;
    for ii = 1:10:length(toolPath(:,1))
        gcf;
        plot3(toolPath(:,1),toolPath(:,2),toolPath(:,3),'b-',...
            toolPath(ii,1),toolPath(ii,2),toolPath(ii,3),...
            'or','MarkerSize',5,'MarkerFaceColor','r')
        xlabel('length (mm)')
        ylabel('length (mm)')
        zlabel('length (mm)')
        title('CAM Simulation')
        drawnow limitrate;
    end 
end

fclose(raw_gcode_file);
end