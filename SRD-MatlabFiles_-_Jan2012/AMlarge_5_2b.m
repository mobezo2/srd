% AMlarge.m: large carrier AM demodulated with "envelope"
pkg load signal
time=0.33; Ts=1/10000;              % sampling interval & time
t=0:Ts:time; lent=length(t);        % define a time vector
fm=20; fc=1000; 
phase = [0.1, 0.5, pi/3, pi/2, pi];
g = [10, -10, 100, -100, 250, -250, 900, -900];

for idx = 1:length(g )
c=cos(2*pi*(fc+g(idx))*t);   % define carrier at freq fc
w=10/lent*[1:lent]+cos(2*pi*fm*t);  % create "message" > -1

v=c.*w+c;                           % modulate w/ large carrier
fbe=[0 0.05 0.1 1];                 % LPF design
damps=[1 1 0 0]; fl=100; 
b=remez(fl,fbe,damps);              % impulse response of LPF
envv=(pi/2)*filter(b,1,abs(v));     % find envelope

% generate the figure
title_cust = sprintf("envelope phase shift == %d", g(idx));
figure(idx)

figure(idx)
subplot(4,1,1), plot(t,w)
ylabel('amplitude'); title('(a) message signal');
axis([0,0.08, -1,4])
subplot(4,1,2), plot(t,c)
ylabel('amplitude'); title('(b) carrier');
axis([0,0.08, -1.5,1.5])
subplot(4,1,3), plot(t,v)
ylabel('amplitude'); title('(c) modulated signal');
axis([0,0.08, -3,4])
subplot(4,1,4), plot(t,envv)
ylabel('amplitude'); title('(d) output of envelope detector');
axis([0,0.08, -1,4])
xlabel('seconds');
title(title_cust)

end


