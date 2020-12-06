% convolex.m: example of numerical convolution
Ts=1/100; time=10;        % sampling interval and total time
t=0:Ts:time;              % create time vector
x=zeros(size(t));
size_t = size(t);
x=randn(1,size_t(2));         % Ts points of noise for time seconds
h=exp(-t);                % define impulse response        
y=conv(h,x);              % do convolution
subplot(3,1,1), plot(t,x) % and plot
subplot(3,1,2), plot(t,h)
subplot(3,1,3), plot(t,y(1:length(t)))

% actual commands used to draw figure:
subplot(3,1,1), plot(t,x)
ylabel('input')
subplot(3,1,2), plot(t,h)
ylabel('impulse response')
subplot(3,1,3), plot(t,y(1:length(t)))
ylabel('output')
xlabel('time in seconds')

