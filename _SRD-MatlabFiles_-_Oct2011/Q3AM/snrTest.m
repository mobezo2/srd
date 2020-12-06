close all; clear all;
specs.v=1;
specs.codingFlag=1;
specs.scrambleFlag=0;
specs.beta=.25;
specs.scramble_flag=0;
specs.OverSamp=4;

b.Costas_Mu1=.001;
b.Costas_Mu2=.0004;
b.Time_mu1=.01; %.05
b.Time_mu2=.002; %.01
b.EqMu=.005;
b.ddEqMu=.001;
b.debugFlag=0;
b.scrambleFlag=0;
b.codingFlag=1;
b.beta=.25;

m.debugFlag=0;
m.ph_off=pi/6; %phase offset
m.f_off=0; %ratio of carrier frequency that offset is
m.t_off=.7;
m.SNR=800; %SNR in DB
m.channel=[1];
m.tNoiseVar=0;
m.bfo=0; %baud frequency offset ratio
m.pNoiseVar=0;
m.TVChan=0;
m.alpha=0;
m.g=.25;
m.c=1;
m.scrambleFlag=0;
m.codingFlag=1;
m.OverSamp=4;

recSigSt=qamTx(m,specs);
[t,v,r,c]=qpskRx(b,recSigSt);

snrDB=[5:1:20];
numIters=2;

for k=1:length(snrDB)
  m.SNR=snrDB(k);
  disp(strcat('On point ',num2str(k),' of ',num2str(length(snrDB))));
  t=zeros(1,numIters);
  v=zeros(1,numIters);
  r=zeros(1,numIters);
  c=zeros(1,numIters);
  for i=1:numIters
    recSigSt=qamTx(m,specs);
    [t(i),v(i),c(i),r(i)]=qpskRx(b,recSigSt)
  end
  
  obsPrE(k)=mean(v);
  prE(k)=mean(t);
  mse(k)=mean(r);
  codSer(k)=mean(c);
end

semilogy(snrDB,prE,'-',snrDB,obsPrE,'o'); title('SER as the SNR inreases');
xlabel('SNR'); ylabel('SER');
legend('Approximate','Measured');
 
