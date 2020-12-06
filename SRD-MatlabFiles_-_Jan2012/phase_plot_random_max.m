Tstart = -1;
Tend=1;                     % length of time
Tspan = Tend - Tstart;
Ts=1/1000;                 % time interval between samples
mean = 0;
variance = 3;
f=10; phi = 0;
TstartAdj = -1 + Ts;
t = TstartAdj:Ts:Tend;
x  = rand(1, (Tspan / Ts));
[phase_rand, ssf] = phase_calc_max(x,Ts);              % call plotspec to draw spectrum

subplot(2,1,1), plot (t,x)
xlabel('seconds'); ylabel('amplitude (rand(x)')     % label the axes
subplot(2,1,2), plot(ssf,phase_rand)         % plot magnitude spectrum
xlabel('frequency'); ylabel('Phase (rand(x)')   % label the axes
