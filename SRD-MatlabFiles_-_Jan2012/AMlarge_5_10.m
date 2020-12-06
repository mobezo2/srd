% AMlarge.m: large carrier AM demodulated with "envelope"
pkg load signal
time=0.33; Ts=1/10000;              % sampling interval & time

t=0:Ts:time; lent=length(t);        % define a time vector


x=randn(1,time/Ts+1);              % generate noise signal
freqs=[0 0.02 0.022 1];
amps=[1 1 0 0];
b=remez(100,freqs,amps);         % specify the LP filter
w=filter(b,1,x);               % do the filtering

fc=1000; c=cos(2*pi*fc*t);   % carrier at freq fc
v=c.*w;                           % modulate w/ large carrier

square = v.^2

fbe=[0 0.10 0.12 0.27 0.3 1]; damps=[0 0 1 1 0 0]; % LPF design
fl=100; b=remez(fl,fbe,damps);      % impulse response of LPF
v=2*filter(b,1,square);                  % 



gam=0; phi=0;                       % freq & phase offset
c2=cos(2*pi*(fc+gam)*t+phi);        % create cosine for demod
x=v.*c2;                            % demod received signal


fbe=[0 0.1 0.12 0.2 0.22 1]; damps=[0 1 1 0 0 0]; % LPF design
fl=100; b=remez(fl,fbe,damps);      % impulse response of LPF
m=2*filter(b,1,x);                  % LPF the demodulated signal

envv=(pi/2)*filter(b,1,x);     % find envelope

% generate the figure
figure(1)
plotspec(w,Ts)
axis([-500,500, 0, 200])
ylabel('amplitude'); title('(w) message signal');


figure(2)
plotspec(v,Ts)
axis([-2000,2000, 0, 30])
ylabel('amplitude'); title('transmit square modulated signal');

figure(3)
plotspec(x,Ts)
ylabel('amplitude'); title('(x) demod- received signal');




figure(4)
plotspec(envv,Ts)
axis([-1000,1000, 0, 15])
ylabel('amplitude'); title('(m) filtered signal');