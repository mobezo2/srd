% pllsd.m: phase tracking minimizing SD
clear
Ts=1/10000; time=1; t=0:Ts:time-Ts;    % time interval & vector
fc=100;   % carrier freq. and phase
phoff=-0.8; 
%phoff = (pi)*t;                  
%phoff = cos(2*pi*(fc/10)*t);
foffset = 1.0

rp=cos(4*pi*fc*t+2*phoff);             % simplified rec signal
mu=1/length(t);                               % algorithm stepsize
theta=zeros(1,length(t)); theta(1)=-0.4;  % initialize estimates
fl=25; h=ones(1,fl)/fl;                % averaging coefficients
z=zeros(1,fl);                 % buffer for avg
f0=fc*foffset;  
for k=1:length(t)-1                    % run algorithm
  filtin=(rp(k)-cos(4*pi*f0*t(k)+2*theta(k)))*sin(4*pi*f0*t(k)+2*theta(k));
  z=[filtin];                 % z contains past inputs
  theta(k+1)=theta(k)-mu*z'; % update = z convolve h
end
dummy = 0
plot(t,theta)                             % plot estimated phase
titleText = sprintf("Phase Tracking mu = %f, phase = %f", mu, dummy);
title(titleText)
xlabel('time'); ylabel('phase offset')
