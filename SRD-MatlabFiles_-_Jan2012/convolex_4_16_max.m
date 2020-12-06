% convolex.m: example of numerical convolution
pkg load signal;
Ts=1/100; time=10;        % sampling interval and total time
f=10;
t=0:Ts:time;              % create time vector
x=zeros(size(t));
size_t = size(t);
x=randn(1,size_t(2));         % Ts points of noise for time seconds
h=sinc(2*pi*f*t);                % define impulse response        
y=conv(h,x);              % do convolution
plotspec(y,Ts)
