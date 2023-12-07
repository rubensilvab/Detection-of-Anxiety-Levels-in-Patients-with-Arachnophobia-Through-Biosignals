function [y2,y5]=Pan_Tompkins(x)
%filtro diferenciador
numd=(1/8)*[2 1 0 -1 -2]; 
dend=1;
%filtro deslizante
N=15;
numde=ones(1,N)/N;
dende=1;
%filtro passa baixo
numpb=[1 zeros(1,5) -2 zeros(1,5) 1];
denpb=[32 -64 32];
%filtro passa alto
numpa=[-1 zeros(1,15) 32 -32 zeros(1,13) 1];
denpa=[32 -32];
% saidas 
y1=filtfilt(numpb,denpb,x);
y2=filtfilt(numpa,denpa,y1); % sinal filtrado 
y3=filtfilt(numd,dend,y2);
y4=y3.^2;
y5=filtfilt(numde,dende,y4);