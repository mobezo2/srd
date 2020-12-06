% speccos.m plot the spectrum of a cosine wave
f=5; phi=2*pi;                % specify frequency and phase
time=2;                     % length of time
Ts=1/100;                   % time interval between samples
t=Ts:Ts:time; 
%f = sin(2*pi*t)              % create a time vector
x=cos(2*pi*f.*t + phi*t);        % create cos wave
plotspec(x,Ts)              % draw waveform and spectrum
