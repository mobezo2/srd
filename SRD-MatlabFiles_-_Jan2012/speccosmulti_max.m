% speccos.m plot the spectrum of a cosine wave
f1=10; phi1=0;                % specify frequency and phase
f2=18; phi2=0;
f3=33; phi3=0;
time=2;                     % length of time
Ts=1/100;                   % time interval between samples
t=Ts:Ts:time;               % create a time vector
x1=cos(2*pi*f1*t+phi1);        % create cos wave
x2=cos(2*pi*f2*t+phi2);        % create cos wave
x3=cos(2*pi*f3*t+phi3);        % create cos wave
x = x1 + 0.5*x2 + 2*x3;
plotspec(x,Ts)              % draw waveform and spectrum
