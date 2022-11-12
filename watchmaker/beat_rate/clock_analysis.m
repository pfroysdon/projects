% Description:
% The purpose of this script is to analyse the beat frequency of a clock,
% for the purpose of adjustment of a mechanical clock.
%
% Dr. Paul F. Roysdon
% 09/11/2020                                     



% Start of script
%-------------------------------------------------------------------------%
close all;                   	% close all figures
clearvars; clearvars -global;	% clear all variables
clc;                         	% clear the command terminal
format shortG;                 	% picks most compact numeric display
format compact;                	% suppress excess blank lines
addpath(genpath('../common'));  % include global library
startup;                        % set defaults


% Initialize variables and import sensor data
%-------------------------------------------------------------------------%
fprintf(1,'\nStarting Clock analysis\n');
fprintf(1,'================================== \n');


% load the file
[y,Fs] = audioread('clock.m4a');

% number of samples
m = length(y);

% length of recording in number of seconds
numSec = m/Fs;

% create timeseries
t = linspace(0,numSec,m)';

% plot
figure;
plot(t,y);
xlim([0 numSec]);

% find peaks
figure;
findpeaks(y,Fs,'MinPeakDistance',0.15);
[pks,locs] = findpeaks(y,Fs,'MinPeakDistance',0.15);

% find the interval (# peaks/sec)
interval = (length(pks)-1)/numSec;

% loss
freq = 5; % Hz
loss = ((interval-freq)*3600*24)/freq;

% compute & plot FFT
[domFreq,domFreqMag] = getFFT(t,y,'clock');

% zoom plot of FFT
getFFT(t,y,'clock XLIM');
h = gca;
xlim(h,[0 500]);

% dock
dock_all_figures;

% stats
fprintf(1,'\n');
fprintf(1,'test duration: %5.3f sec\n',numSec);
fprintf(1,'interval:      %6.4f Hz\n',interval);
fprintf(1,'gain/loss:     %5.3f sec/day\n',loss);
fprintf(1,'\n');
fprintf(1,'================================== \n');
fprintf(1,'Finished \n');














