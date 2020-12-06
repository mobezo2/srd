% pulrecsig.m: create pulse shaped received signal
clear;
pkg load signal;
N=5000; M=20; Ts=.0001;   % # symbols, oversampling factor
time=Ts*N*M; t=Ts:Ts:time; % sampling interval & time vector
m=pam(N,4,5);              % 4-level signal of length N
mup=zeros(1,N*M); 
mup(1:M:N*M)=m;            % oversample by integer length M
ps=hamming(M);             % blip pulse of width M
s=filter(ps,1,mup);        % convolve pulse shape with data
fc=1000;                   % carrier freq.
phoff=-0.5;                % phase
c=cos(2*pi*fc*t+phoff);    % construct carrier
rsc=s.*c;                  % modulated signal (small carrier)


r=rsc;                            % suppressed carrier r
q=r.^2;                           % square nonlinearity
%q=abs(r);                           % square nonlinearity
fl=502; ff=[0 .38 .39 .41 .42 1]; % BPF center frequency at .4
fa=[0 0 1 1 0 0];                 % which is twice f_0
h=remez(fl,ff,fa);                % BPF design via firpm
rp=filter(h,1,q);                 % filter gives preprocessed r

mu=.003;                               % algorithm stepsize
theta=zeros(1,length(rsc)); theta(1)=0;  % initialize estimates
fl=25; h=ones(1,fl)/fl;                % averaging coefficients
z=zeros(1,fl); f0=fc;                  % buffer for avg
for k=1:length(t)-1                    % run algorithm
  filtin=(rp(k)-cos(4*pi*f0*t(k)+2*theta(k)))*sin(4*pi*f0*t(k)+2*theta(k));
  z=[z(2:fl), filtin];                 % z contains past inputs
  theta(k+1)=theta(k)-mu*fliplr(h)*z'; % update = z convolve h
end


plot(t,theta)                             % plot estimated phase
title('Phase Tracking via SD cost')
xlabel('time'); ylabel('phase offset')


