Tstart = 0;
Tend=1;                     % length of time
Tspan = Tend - Tstart;
Ts=1/1000;                 % time interval between samples
mean = 0;
variance = 3;
f=10; phi = 0;
t = Tstart:Ts:Tend;
sp = subplot(2,2,1)
x  = cos(2*pi*f*t+phi)
[phase_cos, ssf] = phase_calc_max(x,Ts)              % call plotspec to draw spectrum

subplot(2,3,1), plot (t,x)
xlabel('seconds'); ylabel('amplitude (cos(x)')     % label the axes
subplot(2,3,2), plot(ssf,phase_cos)         % plot magnitude spectrum
xlabel('frequency'); ylabel('Phase (cos(x)')   % label the axes

x  = sin(2*pi*f*t+phi)
[phase_sin, ssf] = phase_calc_max(x,Ts)              % call plotspec to draw spectrum

subplot(2,3,3), plot (t,x)
xlabel('seconds'); ylabel('amplitude (sin(x)')     % label the axes
subplot(2,3,4), plot(ssf,phase_sin)         % plot magnitude spectrum
xlabel('frequency'); ylabel('Phase (sin(x)')   % label the axes

phase_delta = phase_cos - phase_sin

subplot(2,3,5), plot(t,phase_delta)