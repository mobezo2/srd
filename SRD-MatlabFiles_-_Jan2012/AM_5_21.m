% AM.m suppressed carrier AM with freq and phase offset
pkg load signal
time=1.0; Ts=1/10000;               % sampling interval & time
t=Ts:Ts:time; lent=length(t);       % define a time vector
fm=20; fc=2000; c=cos(2*pi*fc*t);   % carrier at freq fc
w=5/lent*(1:lent)+cos(2*pi*fm*t);   % create "message"
v=c.*w;                             % modulate with carrier
gam=0; phi=0;                       % freq & phase offset
fc1 = (3/4)*fc;
fc2 = (1/4) * fc;
c1=cos(2*pi*(fc1+gam)*t+phi);        % create cosine for demod
c2=cos(2*pi*(fc2+gam)*t+phi);        % create cosine for demod
x1=v.*c1;                            % demod received signal

fbe=[0 0.1 0.2 1]; damps=[1 1 0 0]; % LPF design
fl=100; b=remez(fl,fbe,damps);      % impulse response of LPF
m1=2*filter(b,1,x1);                  % LPF the demodulated signal
x2=m1.*c2;                            % demod received signal
m2=2*filter(b,1,x2);                  % LPF the demodulated signal

% used to plot figure
figure(1);
plotspec(x1,Ts);
ylabel('amplitude'); title('(a) x1 message signal');

figure(2);
plotspec(m1,Ts);

ylabel('amplitude'); title('(b) x1 message after filtering');


figure(3);
plotspec(x2,Ts);
ylabel('amplitude'); title('(a) x1 message signal');

figure(4);
plotspec(m2,Ts);

ylabel('amplitude'); title('(b) x1 message after filtering');


