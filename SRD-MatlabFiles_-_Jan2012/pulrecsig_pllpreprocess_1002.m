% pulrecsig.m: create pulse shaped received signal
clear;
N=10000; M=19; Ts=.000101;   % # symbols, oversampling factor
time=Ts*N*M; t=Ts:Ts:time; % sampling interval & time vector
m=pam(N,4,5);              % 4-level signal of length N
mup=zeros(1,N*M); 
mup(1:M:N*M)=m;            % oversample by integer length M
ps=hamming(M);             % blip pulse of width M
s=filter(ps,1,mup);        % convolve pulse shape with data
fc=1000
phoff=-1.0       % carrier freq. and phase
c=cos(2*pi*fc*t+phoff);    % construct carrier
rsc=s.*c;                  % modulated signal (small carrier)
rlc=(s+1).*c;              % modulated signal (large carrier)

fftrlc=fft(rlc);                     % spectrum of rlc
[m,imax]=max(abs(fftrlc(1:end/2)));  % index of max peak
ssf=(0:length(t)-1)/(Ts*length(t));  % frequency vector
freqL=ssf(imax);                      % freq at the peak
phaseL=angle(fftrlc(imax)) ;          % phase at the peak

fftrsc=fft(rsc);                     % spectrum of rsc
[m,imax]=max(abs(fftrsc(1:end/2)));  % find frequency of max peak
freqSfft=ssf(imax)                    % freq at the peak
phaseSfft=angle(fftrsc(imax))           % find phase at the peak

% pllpreprocess.m: send received signal through square and BPF
pkg load signal
r=rsc;                            % suppressed carrier r
q=r.^2;                           % square nonlinearity
%q=abs(r);                           % square nonlinearity
fl=502; ff=[0 .38 .39 .41 .42 1]; % BPF center frequency at .4
fa=[0 0 1 1 0 0];                 % which is twice f_0
h=remez(fl,ff,fa);                % BPF design via firpm
rp=filter(h,1,q);                 % filter gives preprocessed r

% pllpreprocess.m: recover "unknown" freq and phase using FFT
fftrBPF=fft(rp);                     % spectrum of rBPF
[m,imax]=max(abs(fftrBPF(1:end/2))); % find freq of max peak
ssf=(0:length(rp))/(Ts*length(rp));  % frequency vector
freqS=ssf(imax)                      % freq at the peak
phasep=angle(fftrBPF(imax));         % phase at the peak
[IR,f]=freqz(h,1,length(rp),1/Ts);   % freq response of filter
[mi,im]=min(abs(f-freqS));           % freq where peak occurs
phaseBPF=angle(IR(im))              % < of BPF at peak freq
phaseS=mod(phasep-phaseBPF,pi)       % estimated angle
