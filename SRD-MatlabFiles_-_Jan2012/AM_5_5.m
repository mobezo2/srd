% AM.m suppressed carrier AM with freq and phase offset
pkg load signal
time=0.6; Ts=1/10000;               % sampling interval & time
t=Ts:Ts:time; lent=length(t);       % define a time vector
fm=20; fc=1000; c=cos(2*pi*fc*t);   % carrier at freq fc
w=5/lent*(1:lent)+cos(2*pi*fm*t);   % create "message"
v=c.*w;                             % modulate with carrier
gam=0; phi=0;                       % freq & phase offset
c2=cos(2*pi*(fc+gam)*t+phi);        % create cosine for demod
x=v.*c2;                            % demod received signal
fbe=[0 0.1 0.2 1]; damps=[1 1 0 0]; % LPF design
fl=100; b=remez(fl,fbe,damps);      % impulse response of LPF
m=2*filter(b,1,x);                  % LPF the demodulated signal

% used to plot figure
figure(1), plotspec(w,Ts)
axis([-500,500, 0,8000])
ylabel('amplitude'); title('(a) message signal');

figure(2), plotspec(v,Ts)
% axis([0,0.1, -2.5,2.5])
ylabel('amplitude'); title('(b) message after modulation');

figure(3), plotspec(x,Ts)
axis([-2200,2200, 0,8000])
ylabel('amplitude');
title('(c) demodulated signal');


figure(4), plotspec(m,Ts)
% axis([0,0.1, -1,3])
ylabel('amplitude'); title('(d) recovered message is a LPF applied to (c)');

