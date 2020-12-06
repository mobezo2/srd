% plotspec(x,Ts) plots the spectrum of the signal x
% Ts = time (in seconds) between adjacent samples in x
function plotspec(x,Ts)
N=length(x);                               % length of the signal x
t=Ts*(1:N);                                % define a time vector
ssf=(ceil(-N/2):ceil(N/2)-1)/(Ts*N);       % frequency vector
fx=fft(x(1:N));                            % do DFT/FFT
fxs=fftshift(fx);                          % shift it for plotting
subplot(2,2,1), plot(t,x)                  % plot the waveform
xlabel('seconds'); ylabel('amplitude')     % label the axes
subplot(2,2,2), plot(ssf,abs(fxs))         % plot magnitude spectrum
xlabel('frequency'); ylabel('magnitude')   % label the axes
phase = rad2deg(angle(fxs));         % calculate the phase
subplot(2,2,3), plot(ssf,phase)         % plot magnitude spectrum
xlabel('frequency'); ylabel('phase')   % label the axes