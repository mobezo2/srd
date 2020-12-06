% AMlarge.m: large carrier AM demodulated with "envelope"
pkg load signal
time=0.33; Ts=1/10000;              % sampling interval & time
t=0:Ts:time; lent=length(t);        % define a time vector
fm=20; fc=1000; c=cos(2*pi*fc*t);   % define carrier at freq fc
phase = [0.1, 0.5, pi/3, pi/2, pi];


for idx = 1:length(phase)

w=10/lent*[1:lent]+cos(2*pi*fm*t+phase(idx));  % create "message" > -1

v=c.*w+c;                           % modulate w/ large carrier
fbe=[0 0.05 0.1 1];                 % LPF design
damps=[1 1 0 0]; fl=100; 
b=remez(fl,fbe,damps);              % impulse response of LPF
envv=(pi/2)*filter(b,1,abs(v));     % find envelope

% generate the figure
title_cust = sprintf("envelope phase shift == %d", phase(idx));
figure(idx)
plotspec(envv,Ts)
ylabel('amplitude'); title(title_cust);

end


