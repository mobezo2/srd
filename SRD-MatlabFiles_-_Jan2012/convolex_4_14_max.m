% convolex.m: example of numerical convolution
Ts=1/100; time=1.5;        % sampling interval and total time
t=0:Ts:time;              % create time vector
h=exp(-t);                % define impulse response

pkg load signal % must load signal the first time it is called at runtime

size_t = size(t);
x=randn(1,size_t(2));              % generate noise signal
# Cut off frequencies are fraction of 1/2 Fs
freqs=[0 0.6 0.61 1];
amps=[1 1 0 0];
b=remez(100,freqs,amps);         % specify the LP filter
w1=filter(b,1,x);               % do the filtering
w2=w1;

y=conv(w1,w2);              % do convolution
subplot(3,1,1), plot(t,w1) % and plot
subplot(3,1,2), plot(t,w2)
subplot(3,1,3), plot(t,y(1:length(w2)))

% actual commands used to draw figure:
subplot(3,1,1), plot(t,w1)
ylabel('input')
subplot(3,1,2), plot(t,w2)
ylabel('impulse response')
subplot(3,1,3), plot(t,y(1:length(t)))
ylabel('output')
xlabel('time in seconds')

