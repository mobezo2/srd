pkg load statistics

Tstart = 0;
Tend=3;                     % length of time
Tspan = Tend - Tstart;
Ts=1/1000;       
x = 3*randn(1,Tspan/Ts)
alphabet = [-3, -1, 1, 3]

y = quantalph(x, alphabet);

counts = hist(y, length(alphabet))

plotspec(y, Ts)