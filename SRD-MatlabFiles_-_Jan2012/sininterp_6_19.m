% sininterp.m: demonstrate interpolation/reconstruction using sin
f=20; Ts=1/100; time=20;       % sampling interval and time 
t=Ts:Ts:time;                  % time vector
w=sin(2*pi*f*t);               % w(t) = a sine wave of f Hertz

over_start = 10
over_increment = 70
over_max = 250

%over_vals = [10, 30, 70, 90, 130]

intfac_vals = [2, 3, 5, 10]

%max_idx = length(over_vals)
max_idx = length(intfac_vals)

for idx = 1:max_idx
  
%over=over_vals(idx);                      % # of data points in smoothing 
over=20; 
%intfac=intfac_vals(idx);                     % how many interpolated points 
%intfac = 10
tnow=10.2/Ts:1/intfac:10.4/Ts; % interpolate from 10 to 10.5 sec
wsmooth=zeros(size(tnow));     % save smoothed data here
for i=1:length(tnow)           % and loop for next point
  wsmooth(i)=interpsinc(w,tnow(i),over);
end                
figure(idx)
title_string = sprintf(" over = %d ", over)           
plot(Ts*tnow,wsmooth,'b')            % original=red & interpolated=blue
hold on, plot(Ts*tnow,w(round(tnow)),'r')
xlabel('time')
ylabel('amplitude')
hold off
title(title_string);
% P=1; beta=0;                       % constants for sinc interpolation
% s=srrc(over,beta,P,tau);           % generate sinc pulse
end