% sininterp.m: demonstrate interpolation/reconstruction using sin
f=20; Ts=1/100; time=20;       % sampling interval and time 
f1 = 2;
f2 = 3;
f3 = 5;
f4 = 8;
f5 = 13;
t=-10:Ts:10;                  % time vector
w1=sin(2*pi*f1*t);               % w(t) = a sine wave of f Hertz
w2=sin(2*pi*f2*t);               % w(t) = a sine wave of f Hertz
w3=sin(2*pi*f3*t);               % w(t) = a sine wave of f Hertz
w4=sin(2*pi*f4*t);               % w(t) = a sine wave of f Hertz
w5=sin(2*pi*f5*t);               % w(t) = a sine wave of f Hertz

w = w1+w2+w3+w4+w5;


over=50;                      % # of data points in smoothing 
intfac=10;                     % how many interpolated points 
tnow=10/Ts:1/intfac:10.5/Ts % interpolate from 10 to 10.5 sec
wsmooth=zeros(size(tnow));     % save smoothed data here
beta = 0.5
for i=1:length(tnow)           % and loop for next point
  wsmooth(i)=interpsinc(w,tnow(i),over,beta);
end                           

plot(Ts*tnow,wsmooth,'b')            % original=red & interpolated=blue
hold on, 
plot(Ts*tnow,w(round(tnow)),'g')
xlabel('time')
ylabel('amplitude')
hold off
% P=1; beta=0;                       % constants for sinc interpolation
% s=srrc(over,beta,P,tau);           % generate sinc pulse
