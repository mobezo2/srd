% specsquare.m plot the spectrum of a square wave
f=10;                       % "frequency" of square wave
phi = pi/4;
time=10;                     % length of time
Ts=1/1000;                  % time interval between samples
t=Ts:Ts:time;               % create a time vector
x=sin(2*pi*f*t + phi);      % square wave = sign of cos wave
plotspec(x,Ts)              % call plotspec to draw spectrum