clear all;
close all;
%GSR

%PACIENTE 3

z=load('BitalinoGSR.txt');
GSR=z(:,1);
Ng=length(GSR);


%Paciente 9
z9=load('BitalinoGSR9.txt');
GSR99=z9(:,1);

%Paciente 3
fa=100;

tg=0:1/fa:(Ng-1)/fa;


% Vamos segmentar o BR e o GSR em 1 minuto para cada vídeoclip para o
% paciente 3

GSR0=GSR(36661:42760);
GSR1=GSR(53261:59360);
GSR2=GSR(67961:74060);
GSR3=GSR(67961:74060);
GSR4=GSR(45361:51460);
GSR5=GSR(90861:96960);
GSR6=GSR(83561:89660);
GSR7=GSR(76161:82260);
GSR8=GSR(98258:104357);
GSR9=GSR(121561:127660);
GSR10=GSR(129161:135260);
GSR11=GSR(137161:143260);
GSR12=GSR(113359:119458);
GSR13=GSR(168461:174560);
GSR14=GSR(153061:159160);
GSR15=GSR(145360:151459);
GSR16=GSR(160957:167056);
gsr=[GSR0'; GSR1'; GSR2';GSR3';GSR4'; GSR5'; GSR6';GSR7'; GSR8'; GSR9';GSR10'; GSR11'; GSR12'; GSR13'; GSR14'; GSR15'; GSR16'];    


%vamos fazer o mesmo para o paciente 9

GSR09=GSR99(17481:23580);%clip sem aranhas 
GSR19=GSR99(34845:40944);%clip 1
GSR49=GSR99(27344:33443);%clip 4
GSR39=GSR99(50045:56144);%clip 3
GSR29=GSR99(42145:48244);%clip 2
GSR89=GSR99(60145:66244); %clip 8
GSR79=GSR99(84345:90444);%clip 7
GSR69=GSR99(68944:75043);%clip 6
GSR59=GSR99(76645:82744); % clip 5
GSR999=GSR99(116745:122844);%clip 9
GSR119=GSR99(100345:106444); %clip 11
GSR109=GSR99(108445:114544);%clip 10
GSR129=GSR99(124528:130627);%clip 12
GSR139=GSR99(141445:147544);%clip 13
GSR149=GSR99(133645:139744);%clip 14
GSR159=GSR99(156745:162844);%clip 15
GSR169=GSR99(149245:155344);%clip 16
         
gsr9=[GSR09'; GSR19'; GSR29';GSR39';GSR49'; GSR59'; GSR69';GSR79'; GSR89'; GSR999';GSR109'; GSR119'; GSR129'; GSR139'; GSR149'; GSR159'; GSR169']; 


%Vamos aplicar um filtro passa baixo ao GSR correspondete a cada videoclipe
Ngsr=length(gsr(1,:)); %igual para todos
tgsr=0:1/fa:(Ngsr-1)/fa; %igual para todos

for i=1:length(gsr(:,1))
    gsrr=gsr(i,:);
    gsrr9=gsr9(i,:);
    
    for c=1:Ngsr;
    if gsrr(c)>41;
        gsrr(c)=41;
    end
    if gsrr(c)<(-12.6);
       gsrr(c)=(-12.6);
    end
    end
    
    for e=1:Ngsr;
    if gsrr9(e)>41;
        gsrr9(e)=41;
    end
    if gsrr9(e)<(-12.6);
       gsrr9(e)=(-12.6);
    end
    end
    filtro_passa_baixo = LowPassFilter_Butterworth_ordem2;
    [num,den]= tf(filtro_passa_baixo);
    
    gsr_filtered=filter(num,den,gsrr); % paciente 3
    gsr_filtered9=filter(num,den,gsrr9); %paciente 9

    [piksg,locg]=findpeaks(gsr_filtered);
    [piksg9,locg9]=findpeaks(gsr_filtered9);  % paciente 9
    
    gsr_mean=mean(gsr_filtered);
    gsr_mean9=(gsr_filtered9);
    
    t2=tgsr(locg);
    t29=tgsr(locg9);
    
    %paciente 3
    for k=1:length(t2);
        if piksg(k)<=gsr_mean;
        piksg(k)=NaN;
        end
    end
    %paciente 9
    for rs=1:length(t29);
        if piksg9(rs)<=gsr_mean9;
        piksg9(rs)=NaN;
        end
    end
    
    %paciente 3
    figure()
    subplot(211),plot(tgsr,gsrr), title(['GSR original de videoclipe',num2str(i-1)]),axis tight,xlabel('Time(s)')
    subplot(212),plot(tgsr,gsr_filtered),hold on ,plot(t2,piksg,'ro'),title(['GSR Passa Baixo de videoclipe', num2str(i-1),' do Paciente 3']),axis tight,xlabel('Time(s)')
    
    %paciente 9
    figure()
    subplot(211),plot(tgsr,gsrr9), title(['GSR original de videoclipe',num2str(i-1)]),axis tight,xlabel('Time(s)')
    subplot(212),plot(tgsr,gsr_filtered9),hold on ,plot(t29,piksg9,'ro'),title(['GSR Passa Baixo de videoclipe', num2str(i-1),'do Paciente 9']),axis tight,xlabel('Time(s)')
    
    %PACIENTE 3
    npicosGSR(i,:)=length(piksg);
    GSRMedia(i,:)=mean(piksg,'omitnan');
    GSRnpicos(i,:)=length(piksg);
    
    %PACIENTE 9
    npicosGSR9(i,:)=length(piksg9);
    GSRMedia9(i,:)=mean(piksg9,'omitnan');
    GSRnpicos9(i,:)=length(piksg9);
end

% BR(BREATHING RATE)

%paciente 3
y=load('BitalinoBR.txt');
BR=y(:,1);
Nb=length(BR);
tb=0:1/fa:(Nb-1)/fa;


%Paciente 9
y9=load('BitalinoBR9.txt');
BR99=y9(:,1);

% Paciente 3

BR0=BR(36661:42760);
BR1=BR(53261:59360);
BR2=BR(67961:74060);
BR3=BR(67961:74060);
BR4=BR(45361:51460);
BR5=BR(90861:96960);
BR6=BR(83561:89660);
BR7=BR(76161:82260);
BR8=BR(98258:104357);
BR9=BR(121561:127660);
BR10=BR(129161:135260);
BR11=BR(137161:143260);
BR12=BR(113359:119458);
BR13=BR(168461:174560);
BR14=BR(153061:159160);
BR15=BR(145360:151459);
BR16=BR(160957:167056);
br=[BR0';BR1'; BR2' ;BR3' ;BR4' ;BR5'; BR6'; BR7' ;BR8'; BR9'; BR10'; BR11'; BR12'; BR13'; BR14'; BR15'; BR16']; 


%vamos fazer o mesmo para o paciente 9

BR09=BR99(17481:23580);%clip sem aranhas 
BR19=BR99(34845:40944);%clip 1
BR49=BR99(27345:33444);%clip 4
BR39=BR99(50045:56144);%clip 3
BR29=BR99(42145:48244);%clip 2
BR89=BR99(60145:66244); %clip 8
BR79=BR99(84345:90444);%clip 7
BR69=BR99(68945:75044);%clip 6
BR59=BR99(76645:82744); % clip 5
BR999=BR99(116745:122844);%clip 9
BR119=BR99(100345:106444); %clip 11
BR109=BR99(108445:114544);%clip 10
BR129=BR99(124528:130627);%clip 12
BR139=BR99(141445:147544);%clip 13
BR149=BR99(133645:139744);%clip 14
BR159=BR99(156745:162844);%clip 15
BR169=BR99(149245:155344);%clip 16
         
br9=[BR09'; BR19'; BR29';BR39';BR49'; BR59'; BR69';BR79'; BR89'; BR999';BR109'; BR119'; BR129'; BR139'; BR149'; BR159'; BR169']; 
%Vamos aplicar um filtro passa alto ao BR correspondete a cada videoclipe
Nbr=length(br(1,:)); %igual para todos
tbr=0:1/fa:(Nbr-1)/fa; %igual para todos

for l=1:length(br(:,1))
    brr=br(l,:);%paciente 3
    brr9=br9(l,:); %paciente 9
    
    filtro_passa_banda = BandPass_IIR_Butterworth;
    [num2,den2]= tf(filtro_passa_banda);

    BR_filtrado = filter(num2,den2,brr); %paciente 3
    BR_filtrado9= filter(num2,den2,brr9);  %paciente 9
    
    [piksb,locb]=findpeaks(BR_filtrado); %paciente 3
    [piksb9,locb9]=findpeaks(BR_filtrado9); %paciente 9
    
    br_mean=mean(BR_filtrado); %paciente 3
    br_mean9=mean(BR_filtrado9); %paciente 9
    
    %paciente 3
    t3=tbr(locb);
    for m=1:length(t3);
        if piksb(m)<=br_mean;
        piksb(m)=NaN;
        end
    end
    
    %paciente 9
    t39=tbr(locb9);
    for o=1:length(t39);
        if piksb9(o)<=br_mean9;
        piksb9(o)=NaN;
        end
    end
    
%     figure()                   %DESCOMENTAR PARA VER PLOTS DO PACIENTE 3
%     subplot(211),plot(tbr, brr)
%     axis tight;
%     xlabel('Time in seconds');
%     title(['BR original de videoclipe',num2str(l-1) ,' para o Paciente 3'])
%     subplot(212),plot(tbr, BR_filtrado),hold on ,plot(t3,piksb,'go')
%     axis tight;
%     xlabel('Time in seconds');
%     title(['BR Passa Alto de videoclipe', num2str(l-1)]);
%     
%     figure()                    %DESCOMENTAR PARA VER PLOTS DO PACIENTE 9
%     subplot(211),plot(tbr, brr9)
%     axis tight;
%     xlabel('Time in seconds');
%     title(['BR Paciente 9 original de videoclipe',num2str(l-1)])
%     subplot(212),plot(tbr, BR_filtrado9),hold on ,plot(t39,piksb9,'go')
%     axis tight;
%     xlabel('Time in seconds');
%     title(['BR Paciente 9 Passa Alto de videoclipe', num2str(l-1)]);    
    
    %paciente 3
    npicosBR(l,:)=length(piksb);
    BRNum(l,:)=length(piksb);
    BRMaxsRegistada(l,:)=max(piksb);
    
    %paciente 9
    npicosBR9(l,:)=length(piksb9);
    BRNum9(l,:)=length(piksb9);
    BRMaxsRegistada9(l,:)=max(piksb9);
end
% RESULTADOS

figure()
subplot(211),stem(0:16,BRMaxsRegistada),hold on, yline(BRMaxsRegistada(1),'--','ref.'),ylabel('BR MAX'),title('Paciente 3')
subplot(212),stem(0:16,GSRMedia),hold on, yline(GSRMedia(1),'--','ref.'),ylabel('GRS MAX')
figure()
subplot(211),stem(0:16,BRMaxsRegistada9),hold on, yline(BRMaxsRegistada9(1),'--','ref.'),ylabel('BR MAX'),title('Paciente 9')
subplot(212),stem(0:16,abs(GSRMedia9)),hold on, yline(GSRMedia9(1),'--','ref.'),ylabel('GRS MAX')
