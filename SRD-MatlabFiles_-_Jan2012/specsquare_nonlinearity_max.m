% speccos.m plot the spectrum of a cosine wave
f1=50; phi=0;                % specify frequency and phase
f2=150;
f3 = 250
time=2;                     % length of time
Ts=1/1000;                   % time interval between samples
t=Ts:Ts:time;               % create a time vector
x=cos(2*pi*f1*t+phi) + cos(2*pi*f2*t+phi) +  cos(2*pi*f3*t+phi)    % create cos wave
plotspec(x,Ts)              % draw waveform and spectrum
