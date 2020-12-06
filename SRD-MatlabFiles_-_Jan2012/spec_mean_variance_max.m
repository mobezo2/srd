% specnoise.m plot the spectrum of a noise signal

% The randn function returns a sample of random numbers from a normal distribution with mean 0 and variance 1. 
% The general theory of random variables states that if x is a random variable whose mean is μx and variance is σ2x, 
% then the random variable, y, defined by y=ax+b,where a and b are constants, has mean μy=aμx+b and variance σ2y=a2σ2x. 
% You can apply this concept to get a sample of normally distributed random numbers with mean 500 and variance 25.

% https://www.mathworks.com/help/matlab/math/random-numbers-with-specific-mean-and-variance.htmlTstart=-1;
Tend=1;                     % length of time
Tspan = Tend - Tstart;
Ts=1/1000;                 % time interval between samples
mean = 0;
variance = 3;
a = sqrt(variance);
b = mean;
x  = a.*randn(1, Tspan/Ts) + b;
plotspec(x,Ts)              % call plotspec to draw spectrum


