% AMlarge.m: large carrier AM demodulated with "envelope"
clear;
pkg load signal
time=0.33; Ts=1/10000;              % sampling interval & time
t=0:Ts:time; lent=length(t);        % define a time vector
fm=200; fc=1000; c=cos(2*pi*fc*t);   % define carrier at freq fc
%w=10/lent*[1:lent]+cos(2*pi*fm*t);  % create "message" > -1
w=0.3*cos(2*pi*fm*t);  % create "message" > -1
v=c.*w;                           % modulate w/ large carrier

fsampling = 600
gamma = 0.0;

Tss = 1 / (fsampling + gamma )

foffset = 1 / Tss

ss =  round(Tss / Ts)

% Recommend only making the cutoff delta about 10% greater than the edge to make_absolute_filename
% remez work
cutoff = 0.3
cutoff_delta = 0.2
cutoff_edge = cutoff + cutoff_delta;
cutoff_edge2 = cutoff_edge + cutoff_delta;
cutoff_edge3 = cutoff_edge2 + cutoff_delta;

% 
fbe=[0 cutoff cutoff_edge 1];                 % LPF design
damps=[1 1 0 0]; fl=100; 
b=remez(fl,fbe,damps);              % impulse response of LPF


vk = v(1:ss:end);

ws=zeros(size(w)); ws(1:ss:end)=vk;           % sampled waveform ws(t)
envv=filter(b,1,vk);     % find envelope

% generate the figure
figure(1)
plotspec(w,Ts)
ylabel('amplitude'); title('(s) original signal');



figure(2)
plotspec(ws,Ts)
ylabel('amplitude'); title('(vk) sampled signal');


figure(3)
plotspec(envv,Ts)
ylabel('amplitude'); title('envelope signal');
