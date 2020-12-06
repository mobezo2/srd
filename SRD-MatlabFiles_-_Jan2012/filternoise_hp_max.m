% filternoise.m filter a noisy signal three ways
pkg load signal % must load signal the first time it is called at runtime
time=3;                          % length of time
Ts=1/10000;                      % time interval between samples
x=randn(1,time/Ts);              % generate noise signal
figure(1),plotspec(x,Ts)         % draw spectrum of input
# Cut off frequencies are fraction of 1/2 Fs
freqs=[0 0.098 0.102 1];
amps=[0 0 1 1];
b=remez(100,freqs,amps);         % specify the HP filter
yhp=filter(b,1,x);               % do the filtering
figure(2),plotspec(yhp,Ts)       % plot the output spectrum


