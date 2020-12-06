% plotspec(x,Ts) plots the spectrum of the signal x
% Ts = time (in seconds) between adjacent samples in x
function plotspec(x,x1, Ts)
N=length(x);                               % length of the signal x
t=Ts*(1:N);                                % define a time vector
ssf=(ceil(-N/2):ceil(N/2)-1)/(Ts*N);       % frequency vector
fx=fft(x(1:N));                            % do DFT/FFT
fxs=fftshift(fx);                          % shift it for plotting
fx1=fft(x1(1:N));                            % do DFT/FFT
fxs1=fftshift(fx1);                          % shift it for plotting

hold ON

subplot(2,1,1), plot(t,x)                  % plot the waveform
subplot(2,1,1), plot(t,x1)                  % plot the waveform

xlabel('seconds'); ylabel('amplitude')     % label the axes
subplot(2,1,2), plot(ssf,abs(fxs))         % plot magnitude spectrum
subplot(2,1,2), plot(ssf,abs(fxs1))         % plot magnitude spectrum
xlabel('frequency'); ylabel('magnitude')   % label the axes

hold of
