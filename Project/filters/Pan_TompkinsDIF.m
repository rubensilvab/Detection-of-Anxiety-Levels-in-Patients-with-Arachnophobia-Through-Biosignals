function [y2,y5]=Pan_TompkinsDIF(x)
%filtro diferenciador
numd=(1/8)*[2 1 0 -1 -2]; 
dend=1;
%filtro deslizante
N=15;
numde=ones(1,N)/N;
dende=1;
%filtro passa baixo
IIR_filter1=Passa_Baixo_ecg;
[numpb,denpb]=tf(IIR_filter1);
%filtro passa alto
IIR_filter2=Passa_Alto_ecg_ord100;
[numpa,denpa]=tf(IIR_filter1);
% saidas 
y1=filtfilt(numpb,denpb,x);
y2=filtfilt(numpa,denpa,y1); % sinal filtrado 
y3=filtfilt(numd,dend,y2);
y4=y3.^2;
y5=filtfilt(numde,dende,y4);