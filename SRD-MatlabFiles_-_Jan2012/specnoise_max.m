% specnoise.m plot the spectrum of a noise signal
Tstart=-1;
Tend=1;                     % length of time
Tspan = Tend - Tstart;
Ts=1/1000;                 % time interval between samples
interval  = rand(1, Tspan/Ts) - 0.5;
prob = sign(interval); % negatives get converted to -1, positives to 1. with a uniform distribution half should be positive and negative
x=sign(prob);         % Ts points of noise for time seconds
plotspec(x,Ts)              % call plotspec to draw spectrum
