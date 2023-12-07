close all
clear all
x=load('ECG3.txt');
u=load('ECG9.txt');

%PACIENTE 9
ecg91=u(:,1);

ecg09=ecg91(17481:23580);%clip sem aranhas 
ecg19=ecg91(34845:40944);%clip 1
ecg49=ecg91(27344:33443);%clip 4
ecg39=ecg91(50045:56144);%clip 3
ecg29=ecg91(42145:48244);%clip 2
ecg89=ecg91(60145:66244); %clip 8
ecg79=ecg91(84345:90444);%clip 7
ecg69=ecg91(68944:75043);%clip 6
ecg59=ecg91(76645:82744); % clip 5
ecg99=ecg91(116745:122844);%clip 9
ecg119=ecg91(100345:106444); %clip 11
ecg109=ecg91(108445:114544);%clip 10
ecg129=ecg91(124528:130627);%clip 12
ecg139=ecg91(141445:147544);%clip 13
ecg149=ecg91(133645:139744);%clip 14
ecg159=ecg91(156745:162844);%clip 15
ecg169=ecg91(149245:155344);%clip 16

ECGs9=[ecg09';ecg19';ecg29';ecg39';ecg49';ecg59';ecg69';ecg79';ecg89';ecg99';ecg109';ecg119';ecg129';ecg139';ecg149';ecg159';ecg169'];
nomes9=[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16]


ecg31=x(:,1); % ECG PACIENTE 3
ecg03=ecg31(36661:42760);%clip sem aranhas % retirei 10 s deste video para ficar 1 min como os outros
ecg43=ecg31(45361:51460);%clip 4
ecg13=ecg31(53261:59360);%clip 1
ecg33=ecg31(60661:66760);%clip 3
ecg23=ecg31(67961:74060);%clip 2
ecg73=ecg31(76161:82260); %clip 7
ecg63=ecg31(83561:89660);%clip 6
ecg53=ecg31(90961:97060);%clip 5
ecg83=ecg31(98261:104360); % clip 8
ecg123=ecg31(113361:119460);%clip 12
ecg93=ecg31(121561:127660); %clip 9
ecg103=ecg31(129161:135260);%clip 10
ecg113=ecg31(137161:143260);%clip 11
ecg153=ecg31(145361:151460);%clip 15
ecg143=ecg31(153061:159160);%clip 14
ecg163=ecg31(160961:167060);%clip 16
ecg133=ecg31(168461:174560);%clip 13
         
ECGs=[ecg03';ecg13';ecg23';ecg33';ecg43';ecg53';ecg63';ecg73';ecg83';ecg93';ecg103';ecg113';ecg123';ecg133';ecg143';ecg153';ecg163']
nomes=[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16];

for e=1:length(ECGs(:,1));% apenas o length da coluna
ecg=ECGs(e,:); % PACIENTE 3
ecg9=ECGs9(e,:); %Paciente 9

N=length(ecg); %igual para todos  
fa=100;    % igual para tdos
t=0:1/fa:(N-1)/fa;  % mesmo para todos

%Basicamente havia valores enormes de voltagem e como no Physionet
%colocavam entre -1.5 mv e 1.5 mv , tudo o que passava disso igualei , acho
%q n altera nada porque a grande maioria estava ja entre esses valores

for i=1:N;
    if ecg(i)>1.5;
        ecg(i)=1.5;
    end
    if ecg(i)<(-1.5);
        ecg(i)=(-1.5);
    end
end
for i=1:N;
    if ecg9(i)>1.5;
        ecg9(i)=1.5;
    end
    if ecg9(i)<(-1.5);
        ecg9(i)=(-1.5);
    end
end

figure()
subplot(2,1,1),plot(t,ecg)% para cada video
title(['ECG original do clip video nº',num2str(e-1),'do Paciente 3']),xlabel('t/s'), ylabel('mV')
subplot(2,1,2),plot(t,ecg9)% para cada video
title(['ECG original do clip video nº',num2str(e-1),'do Paciente 9']),xlabel('t/s'), ylabel('mV')

%Saida paciente 3
[y2(e,:),y5(e,:)]=Pan_TompkinsDIF(ecg); % PARA VER COM FUNÇÃO UTILIZADA NA AULA , TROCAR POR "Pan_Tompkins(ecg)"

%Saida paciente 9
[y29(e,:),y59(e,:)]=Pan_TompkinsDIF(ecg9);% PARA VER COM FUNÇÃO UTILIZADA NA AULA , TROCAR POR "Pan_Tompkins(ecg9)"


%encontrar maximos locais para encontrar os batimentos

[piks,loc]=findpeaks(y5(e,:),'MinPeakDistance',60); % distancia entre picos Paciente 3
[piks9,loc9]=findpeaks(y59(e,:),'MinPeakDistance',50); % distancia entre picos Paciente 9

%Paciente 3
t2=t(loc);
%Paciente 9
t29=t(loc9);

%PACIENTE 3  %DESCOMENTAR PARA VER PLOTS
 figure()
 plot(t,ecg,'b'),hold on,plot(t,150*y5(e,:),'r'),
 legend('Ecg original','Ecg ao passar pelo bloco de filtros(Pan-Tompkins)'),xlabel('t(s)')
 title(['Visulalização da aplicação do filtro para detetar Picos R para o clip video nº',num2str(e-1),'.'])

% % PACIENTE 9  %DESCOMENTAR PARA VER PLOTS
% figure()
%  plot(t,ecg9,'b'),hold on,plot(t,200*y59(e,:),'r'),
%  legend('Ecg original','Ecg ao passar pelo bloco de filtros(Pan-Tompkins)'),xlabel('t(s)')
%  title(['Visulalização da aplicação do filtro para detetar Picos R para o clip video nº ',num2str(e-1),'.'])

 %Visualização da deteçao dos picos R
 
% %Paciente 3 DESCOMENTAR PARA VER
 figure()
 plot(t,y5(e,:)), hold on ,plot(t2,piks,'ro')
 title(['Picos detetados para o Paciente 3 no video nº ',num2str(e-1)]),xlabel('t(s)')
 
% % Paciente 9 DESCOMENTAR PARA VER
%  figure()
%  plot(t,y59(e,:)), hold on ,plot(t29,piks9,'ro')
%  title(['Picos detetados para o Paciente 9 no video nº ',num2str(e-1)]),xlabel('t(s)')


%paciente 3
%HRV
tINT=t2;
hrv=diff(tINT);
HRVmedio(e,:)=mean(hrv);

%Paciente 9

%HRV
tINT9=t29;
hrv9=diff(tINT9);
HRVmedio9(e,:)=mean(hrv9);

%Paciente 3
nbatiments(e,:)=length(piks);
BPMmedio(e,:)=(nbatiments(e,:)*60)/t(end);

%Paciente 9
nbatiments9(e,:)=length(piks9);
BPMmedio9(e,:)=(nbatiments9(e,:)*60)/t(end);
end

% RESULTADOS 

%PACIENTE 3
BPMmax=max(BPMmedio);
BPMmin=min(BPMmedio);
indxmax=find(BPMmedio==BPMmax);
indxmin=find(BPMmedio==BPMmin);
fprintf(['O batimento cardíaco mais acelerado para o paciente 3 verificou-se para o Vídeo clip nº',num2str(nomes(indxmax)),' com um batimento de ',num2str(BPMmax),' BPM\n'])
fprintf(['O batimento cardíaco mais baixo para o paciente 3 verificou-se para o Vídeo clip nº',num2str(nomes(indxmin)),' com um batimento de ',num2str(BPMmin),' BPM\n'])

%PACIENTE 9
BPMmax9=max(BPMmedio9);
BPMmin9=min(BPMmedio9);
indxmax9=find(BPMmedio9==BPMmax9);
indxmin9=find(BPMmedio9==BPMmin9);
fprintf(['O batimento cardíaco mais acelerado para o paciente 9 verificou-se para o Vídeo clip nº',num2str(nomes9(indxmax9)),' com um batimento de ',num2str(BPMmax9),' BPM\n'])
fprintf(['O batimento cardíaco mais baixo para o paciente 9 verificou-se para o Vídeo clip nº',num2str(nomes9(indxmin9)),' com um batimento de ',num2str(BPMmin9),' BPM'])


figure()
subplot(211),stem(nomes9,BPMmedio9),xlabel('nº videoclip'), ylabel('BPM do Paciente 9')
subplot(212),stem(nomes,BPMmedio),xlabel('nº videoclip'), ylabel('BPM do Paciente 3')
