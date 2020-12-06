% AM.m suppressed carrier AM with freq and phase offset
pkg load signal
time=1.0; Ts=1/1000;               % sampling interval & time
t=Ts:Ts:time; lent=length(t);       % define a time vector

x=randn(1,time/Ts+1);              % generate noise signal
freqs1=[0 0.0025 0.0026 0.0031 0.015 1];

amps=[1 1 1 0 0 0];
b=remez(1000,freqs1,amps);         % specify the LP filter
w1=filter(b,1,x);               % do the filtering


axis([-20,20, 0,50])

fm1=3; 
fm2=2;
fc1=164; 
fc2=154;
co=cos(2*pi*fc1*t);   % carrier at freq fc
si=sin(2*pi*fc2*t);
m1=5/lent*(1:lent)+cos(2*pi*fm1*t);   % create "message on quadrature 1"
m2=5/lent*(1:lent)+cos(2*pi*fm2*t);   % create "message"
v1=co.*m1;                             % modulate with carrier
v2=si.*m2;  
v = v1.+v2

plotspec(v,Ts)

axis([-300,300, 0,1000])

