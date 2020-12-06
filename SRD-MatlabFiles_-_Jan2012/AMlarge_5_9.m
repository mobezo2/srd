% AMlarge.m: large carrier AM demodulated with "envelope"
pkg load signal
time=0.33; Ts=1/10000;              % sampling interval & time
t=0:Ts:time; lent=length(t);        % define a time vector
fm=200; fc=1000; c=cos(2*pi*fc*t);   % define carrier at freq fc
w=10/lent*[1:lent]+cos(2*pi*fm*t);  % create "message" > -1
%w=0.3*cos(2*pi*fm*t);  % create "message" > -1
v=c.*w+c;                           % modulate w/ large carrier

square = sqrt(v.^2)


freqs=[0 0.29 0.3 0.45 0.50 1];
amps=[0 0 1 1 0 0];
b=remez(100,freqs,amps);         % BP filter

envv=(pi/2)*filter(b,1,square);     % find envelope

% generate the figure
figure(1)
plotspec(c,Ts)
ylabel('amplitude'); title('(c) carrier');


figure(2)
plotspec(square,Ts)
ylabel('amplitude'); title('squared received signal');

figure(3)
plotspec(v,Ts)
ylabel('amplitude'); title('(v) received signal');


figure(4)
plotspec(w,Ts)
ylabel('amplitude'); title('(m) message signal');

figure(5)
plotspec(envv,Ts)
ylabel('amplitude'); title('(m) filtered signal');