% convolex.m: example of numerical convolution
pkg load signal;
Ts=1/100; time=10;        % sampling interval and total time
f=10;
t=0:Ts:time;              % create time vector
x=zeros(size(t));
size_t = size(t);
for i=1:150
  x(i)=1;       
end
h=x  

y=conv(h,x);              % do convolution
subplot(4,1,1), plot(t,x) % and plot
subplot(4,1,2), plot(t,h)
subplot(4,1,3), plot(t,y(1:length(t)))

% actual commands used to draw figure:
subplot(3,1,1), plot(t,x)
ylabel('input')
subplot(3,1,2), plot(t,h)
ylabel('impulse response')
subplot(3,1,3), plot(t,y(1:length(t)))
ylabel('output')
xlabel('time in seconds')

