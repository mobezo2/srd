pkg load signal;


time=1;                     % length of time
Ts=1/10000;                 % time interval between samples
x=randn(1,time/Ts);         % Ts points of noise for time seconds
M=100
rp=hamming(M); 



y=filter(fliplr(rp),1,x);  

freqz(rp)

plotspec(y,Ts)              % call plotspec to draw spectrum