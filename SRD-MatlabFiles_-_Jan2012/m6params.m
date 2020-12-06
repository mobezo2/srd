% This is the data generation script to be used 
% for generating signals to be processed by an M6 Receiver.
% This an 'ideal' set of parameters with no added impairments.

% Message Generation
m=['This is the first frame which you probably shouldn'  ...
   '''t able to decode perfectly unless you "cheat" and' ...
   ' give your receiver the initial points.  Now we''re' ...
   ' into the fourth frame. You might be able to decod'  ...
   'e this one, and now the fifth.  The next frame is '  ...
   'where your receiver should definitely be operating'  ...
   'without errors.  You might want to re-test your re'  ...
   'ceiver by using different initial parameters, and '  ...
   'different stepsizes to see what the effect is.  It'  ...
   '''s probably helpful to plot the time history of th' ...
   'e adaptive parameter elements, too, so you can see'  ...
   ' if they''re taking too long to converge, if they s' ...
   'eem unstable, etc.  This easy test vector has no i'  ...
   'mpairments, i.e. no carrier frequency offset, a si'  ...
   'mple unity gain channel, no broadband noise, no na'  ...
   'rrowband interferers, no adjacent users, no baud t'  ...
   'iming clock offset, no phase noise.  So, the algor'  ...
   'ithms in your receiver should settle fairly quickl'  ...
   'y, and remain constant... If your receiver has mad'  ...
   'e it this far with no errors, and performs error-f'  ...
   'ree even when you change the initial parameter val'  ...
   'ues, Good job!!  Now it''s time to add impairments!'];

% Frame parameters
frameParams.userDataLength=100;
frameParams.preamble='A0Oh well whatever Nevermind';
frameParams.chanCodingFlag=1;
frameParams.bitEncodingFlag=1;

% Channel parameters, Adjacent Users, Interference
chanParams.c1=[1 0 0];
chanParams.c2=[1 0 0];
chanParams.randomWalkVariance=0;
chanParams.SNR=Inf;
chanParams.adjacentUser1Power=-Inf;
chanParams.adjacentUser1f_if=2e6-204e3;
chanParams.adjacentUser1Chan=[1 0 0];
chanParams.adjacentUser2Power=-Inf;
chanParams.adjacentUser2f_if=2e6+204e3;
chanParams.adjacentUser2Chan=[1 0 0];
chanParams.NBIfreq=1.9e6;
chanParams.NBIPower=-Inf;

% RF Parameters
rfParams.f_if_err=0;
rfParams.T_t_err=0;
rfParams.phaseNoiseVariance=0;
rfParams.SRRCLength=4;
rfParams.SRRCrolloff=0.3;
rfParams.f_s=850e3;
rfParams.T_t=6.4e-6;
rfParams.f_if=2e6;

% call transmitter
[r s]=BigTransmitter(m, frameParams, rfParams, chanParams);

