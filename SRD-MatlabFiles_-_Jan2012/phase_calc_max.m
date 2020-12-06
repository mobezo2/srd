% phase_calc_max(x,Ts) plots the phase of the signal x
% Ts = time (in seconds) between adjacent samples in x
function [phase ssf] = phase_calc_max(x,Ts)
N=length(x);                               % length of the signal x
t=Ts*(1:N);                                % define a time vector
ssf=(ceil(-N/2):ceil(N/2)-1)/(Ts*N);       % frequency vector
fx=fft(x(1:N));                            % do DFT/FFT
fxs=fftshift(fx);                          % shift it for plotting

phase = rad2deg(angle(fxs));         % calculate the phase

return