% AM.m suppressed carrier AM with freq and phase offset
pkg load signal
time=0.3; Ts=1/10000;               % sampling interval & time
t=Ts:Ts:time; lent=length(t);       % define a time vector

%phase = [-pi, -pi/2, -pi/3, -pi/6, 0, pi/6, pi/3, pi/2, pi];

phase = [ 0, -pi/2];
phase_length = size(phase);
pl = phase_length(2);

for idx = 1: pl
  
phase_instance = phase(idx)

fm=20; fc=1000; c=cos(2*pi*fc*t);   % carrier at freq fc
w=5/lent*(1:lent)+cos(2*pi*fm*t);   % create "message"
v=c.*w;                             % modulate with carrier
gam=0; phi=phase_instance;                       % freq & phase offset
c2=cos(2*pi*(fc+gam)*t+phi);        % create cosine for demod
x=v.*c2;                            % demod received signal
fbe=[0 0.1 0.2 1]; damps=[1 1 0 0]; % LPF design
fl=100; b=remez(fl,fbe,damps);      % impulse response of LPF
m= 2*filter(b,1,x);                  % LPF the demodulated signal

##% used to plot figure
##figure(idx), 
##plotspec(m, Ts)
##axis([-75,75, 0,4000])
##title_cust = sprintf("(a) message signal %f", phase_instance);
##ylabel('amplitude'); title(title_cust);
##
####title_cust = sprintf("(a)message after modulation %f", phase_instance);
####figure(idx+2), plotspec(v,Ts)
####% axis([0,0.1, -2.5,2.5])
####ylabel('amplitude'); title(title_cust);
####
####
####title_cust = sprintf("(c) demodulated signal %f", phase_instance);
####figure(idx+3), plotspec(x,Ts)
####% axis([0,0.1, -1,3])
####ylabel('amplitude');
####title(title_cust);

title_cust = sprintf("d) recovered message is a LPF applied to (c) %f", phase_instance);
figure(idx) 
plotspec(m, Ts)
%axis([-1500,1500, 0,8000])
ylabel('amplitude'); title(title_cust);

endfor




