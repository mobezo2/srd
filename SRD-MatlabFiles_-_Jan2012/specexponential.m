% specsquare.m plot the spectrum of a square wave
f=10;                       % "frequency" of square wave
time=20;                     % length of time
Ts=1/1000;                  % time interval between samples
t=-time:Ts:time;               % create a time vector
x=exp(-t.^2);      % square wave = sign of cos wave
plotspec(x,Ts)              % call plotspec to draw spectrum