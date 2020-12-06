% AM.m suppressed carrier AM with freq and phase offset
pkg load signal
time=1.0; Ts=1/10000;               % sampling interval & time
t=Ts:Ts:time; lent=length(t);       % define a time vector
fm=20; fc=1000; 
co=cos(2*pi*fc*t);   % carrier at freq fc
si=sin(2*pi*fc*t);
m1=5/lent*(1:lent)+cos(2*pi*fm*t);   % create "message on quadrature 1"
m2=5/lent*(1:lent)+cos(2*pi*fm*t);   % create "message"
v1=co.*m1;                             % modulate with carrier
v2=si.*m2;                             % modulate with carrier

for idx = 1:p1
gam=10; phi=0;                       % freq & phase offset
co2=cos(2*pi*(fc+gam)*t+phi);    5    % create cosine for demod
si2=sin(2*pi*(fc+gam)*t+phi);        % create cosine for demod
x1=v1.*co2;                            % demod received signal
x2=v2.*si2;                            % demod received signal
fbe=[0 0.1 0.2 1]; damps=[1 1 0 0]; % LPF design
fl=100; b=remez(fl,fbe,damps);      % impulse response of LPF
s1=2*filter(b,1,x1);                  % LPF the demodulated signal
s2=2*filter(b,1,x2);                  % LPF the demodulated signal

% used to plot figure
subplot(4,2,1), plot(t,m1)
axis([0,1, -1,10])
ylabel('amplitude'); title('(a) message signal 1');
subplot(4,2,2), plot(t,v1)
axis([0,0.1, -2.5,2.5])
ylabel('amplitude'); title('(b) message signal 1 after modulation');
subplot(4,2,3), plot(t,x1)
axis([0,0.1, -1,3])
ylabel('amplitude');
title('(c) demodulated signal 1');
subplot(4,2,4), plot(t,m1)
axis([0,1, -1,10])
ylabel('amplitude'); title('(d) recovered message 1 is a LPF applied to (c)');

subplot(4,2,5), plot(t,m1)
axis([0,1, -1,10])
ylabel('amplitude'); title('(a) message signal 2');
subplot(4,2,6), plot(t,v1)
axis([0,0.1, -2.5,2.5])
ylabel('amplitude'); title('(b) message signal 2 after modulation');
subplot(4,2,7), plot(t,x1)
axis([0,0.1, -1,3])
ylabel('amplitude');
title('(c) demodulated signal 2');
subplot(4,2,8), plot(t,m1)
axis([0,1, -1,10])
ylabel('amplitude'); title('(d) recovered message 2 is a LPF applied to (c)');

end