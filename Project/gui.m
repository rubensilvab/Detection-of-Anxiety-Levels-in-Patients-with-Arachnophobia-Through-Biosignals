function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 19-Jan-2021 02:02:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in escolhavideo.
function escolhavideo_Callback(hObject, eventdata, handles)
% hObject    handle to escolhavideo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns escolhavideo contents as cell array
%        contents{get(hObject,'Value')} returns selected item from escolhavideo



% --- Executes during object creation, after setting all properties.
function escolhavideo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to escolhavideo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nvideos=get(handles.escolhavideo,'Value');
npaciente=get(handles.escolhapaciente,'Value');

% PACIENTE 3
x=load('ECG3.txt');
ecg31=x(:,1);
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
         
ECGs=[ecg03';ecg13';ecg23';ecg33';ecg43';ecg53';ecg63';ecg73';ecg83';ecg93';ecg103';ecg113';ecg123';ecg133';ecg143';ecg153';ecg163'];
nomes=[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16];

%PACIENTE 9
u=load('ECG9.txt');
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
nomes9=[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16];

for e=1:length(ECGs(:,1))% apenas o length da coluna
ecg=ECGs(e,:);
ecg9=ECGs9(e,:); %Paciente 9

N=length(ecg); %igual para todos  
fa=100;    % igual para tdos
t=0:1/fa:(N-1)/fa; % mesmo para todos

%Basicamente havia valores enormes de voltagem e como no Physoinet
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

%Saida paciente 3
[y2(e,:),y5(e,:)]=Pan_TompkinsDIF(ecg); % Trocar para "Pan_Tompkins(ecg)" para ver o resultado com filtro da aula

%Saida paciente 9
[y29(e,:),y59(e,:)]=Pan_TompkinsDIF(ecg9);% Trocar para "Pan_Tompkins(ecg9)" para ver o resultado com filtro da aula

%encontrar maximos locais para encontrar os batimentos

[piks,loc]=findpeaks(y5(e,:),'MinPeakDistance',60); % distancia entre picos paciente 3
[piks9,loc9]=findpeaks(y59(e,:),'MinPeakDistance',50); % distancia entre picos Paciente 9

%PACIENTE 3

t2=t(loc);
%HRV
tINT=t2;
hrv=diff(tINT);
HRVmedio(e,:)=mean(hrv);
%Batimentos
nbatiments(e,:)=length(piks);
BPMmedio(e,:)=(nbatiments(e,:)*60)/t(end);

%PACIENTE 9
t29=t(loc9);
%HRV
tINT9=t29;
hrv9=diff(tINT9);
HRVmedio9(e,:)=mean(hrv9);
%BPM
nbatiments9(e,:)=length(piks9);
BPMmedio9(e,:)=(nbatiments9(e,:)*60)/t(end);

end

% Skin condutance

%PACIENTE 3
z=load('BitalinoGSR.txt');
GSR=z(:,1);
Ng=length(GSR);

% vamos segmentar os GSR em videoclipes de 1 minuto
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

%PACIENTE 9
z9=load('BitalinoGSR9.txt');
GSR99=z9(:,1);

% vamos segmentar os GSR em videoclipes de 1 minuto
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
for i=1:length(gsr(:,1));
    
    gsrr=gsr(i,:); %PACIENTE 3
    gsrr9=gsr9(i,:); %PACIENTE 9
    
    %eliminar valores descabidos paciente 3
    for c=1:Ngsr;
    if gsrr(c)>41;
        gsrr(c)=41;
    end
    if gsrr(c)<(-12.6);
       gsrr(c)=(-12.6);
    end
    end
    
    %eliminar valores descabidos paciente 9
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
    
    gsr_filtered(i,:) = filter(num,den,gsrr);%paciente 3
    gsr_filtered9(i,:)= filter(num,den,gsrr9);  %paciente 9
    
    [piksg,locg]=findpeaks(gsr_filtered(i,:)); %paciente 3
    [piksg9,locg9]=findpeaks(gsr_filtered9(i,:));  % paciente 9
    
    gsr_mean=mean(gsr_filtered(i,:));%paciente 3
    gsr_mean9=(gsr_filtered9(i,:)); %paciente 9
    
    t2=tgsr(locg);
    t29=tgsr(locg9);
    
    %paciente3
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
    npicosGSR(i,:)=length(piksg);
    GSRMedia(i,:)=mean(piksg,'omitnan');
    GSRMaxsRegistados(i,:)=max(piksg);
    
    %PACIENTE 9
    npicosGSR9(i,:)=length(piksg9);
    GSRMedia9(i,:)=mean(piksg9,'omitnan');
    GSRMaxsRegistados9(i,:)=max(piksg9);
end

%PACIENTE 3
y=load('BitalinoBR.txt');
BR=y(:,1);
Nb=length(BR);
% Vamos segmentar o BR e o GSR em 1 minuto para cada vídeoclip
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

%Paciente 9
y9=load('BitalinoBR9.txt');
BR99=y9(:,1);

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

for l=1:length(br(:,1));
    brr=br(l,:); %PACIENTE 3
    brr9=br9(l,:);%PACIENTE 9
    
    filtro_passa_banda = BandPass_IIR_Butterworth;
    [num2,den2]= tf(filtro_passa_banda);
    
    BR_filtrado(l,:)=filter(num2,den2,brr);
    BR_filtrado9(l,:)=filter(num2,den2,brr9); %paciente 9
    
    [piksb,locb]=findpeaks(BR_filtrado(l,:));
    [piksb9,locb9]=findpeaks(BR_filtrado9(l,:));
    
    br_mean=mean(BR_filtrado(l,:));
    br_mean9=mean(BR_filtrado9(l,:)); %PACIENTE 9
    
    %PACIENTE 6
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
    
    %PACIENTE 6
    npicosBR(l,:)=length(piksb);
    BRMedia(l,:)=mean(piksb,'omitnan');
    BRMaxsRegistada(l,:)=max(piksb);
    
    %paciente 9
    npicosBR9(l,:)=length(piksb9);
    BRMedia9(l,:)=mean(piksb9,'omitnan');
    BRMaxsRegistada9(l,:)=max(piksb9);
end

%para dar gui
if npaciente==1
if nvideos==1
    ind=find(nomes==1)
    plot(handles.axes1,t,ECGs(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio(ind)))
    plot(handles.axes2,tgsr,gsr_filtered(2,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia(2,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados(2,:)))
    plot(handles.axes3,tbr,BR_filtrado(2,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada(2,:)))
    set(handles.texthrv,'string',num2str(HRVmedio(ind)))
    
elseif nvideos==2
    ind=find(nomes==2)
    plot(handles.axes1,t,ECGs(ind,:)),  axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio(ind)))
    plot(handles.axes2,tgsr,gsr_filtered(3,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia(3,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados(3,:)))
    plot(handles.axes3,tbr,BR_filtrado(3,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada(3,:)))
    set(handles.texthrv,'string',num2str(HRVmedio(ind)))
    
elseif nvideos==3
    ind=find(nomes==3)
    plot(handles.axes1,t,ECGs(ind,:)),  axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio(ind)))
    plot(handles.axes2,tgsr,gsr_filtered(4,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia(4,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados(4,:)))
    plot(handles.axes3,tbr,BR_filtrado(4,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada(4,:)))
    set(handles.texthrv,'string',num2str(HRVmedio(ind)))
    
  elseif nvideos==4
    ind=find(nomes==4)
    plot(handles.axes1,t,ECGs(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio(ind)))
    plot(handles.axes2,tgsr,gsr_filtered(5,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia(5,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados(5,:)))
    plot(handles.axes3,tbr,BR_filtrado(5,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada(5,:)))
    set(handles.texthrv,'string',num2str(HRVmedio(ind)))
    
    elseif nvideos==5
    ind=find(nomes==5)
    plot(handles.axes1,t,ECGs(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio(ind)))
    plot(handles.axes2,tgsr,gsr_filtered(6,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia(6,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados(6,:)))
    plot(handles.axes3,tbr,BR_filtrado(6,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada(6,:)))
    set(handles.texthrv,'string',num2str(HRVmedio(ind)))
    
    elseif nvideos==6
    ind=find(nomes==6)
    plot(handles.axes1,t,ECGs(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio(ind)))
    plot(handles.axes2,tgsr,gsr_filtered(7,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia(7,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados(7,:)))
    plot(handles.axes3,tbr,BR_filtrado(7,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada(7,:)))
    set(handles.texthrv,'string',num2str(HRVmedio(ind)))
    
    elseif nvideos==7
    ind=find(nomes==7)
    plot(handles.axes1,t,ECGs(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio(ind)))
    plot(handles.axes2,tgsr,gsr_filtered(8,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia(8,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados(8,:)))
    plot(handles.axes3,tbr,BR_filtrado(8,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada(8,:)))
    set(handles.texthrv,'string',num2str(HRVmedio(ind)))
    
    elseif nvideos==8
    ind=find(nomes==8)
    plot(handles.axes1,t,ECGs(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio(ind)))
    plot(handles.axes2,tgsr,gsr_filtered(9,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia(9,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados(9,:)))
    plot(handles.axes3,tbr,BR_filtrado(9,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada(9,:)))
    set(handles.texthrv,'string',num2str(HRVmedio(ind)))
    
    elseif nvideos==9
    ind=find(nomes==9)
    plot(handles.axes1,t,ECGs(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio(ind)))
    plot(handles.axes2,tgsr,gsr_filtered(10,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia(10,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados(10,:)))
    plot(handles.axes3,tbr,BR_filtrado(10,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada(10,:)))
    set(handles.texthrv,'string',num2str(HRVmedio(ind)))
    
    elseif nvideos==10
    ind=find(nomes==10)
    plot(handles.axes1,t,ECGs(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio(ind)))
    plot(handles.axes2,tgsr,gsr_filtered(11,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia(11,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados(11,:)))
    plot(handles.axes3,tbr,BR_filtrado(11,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada(11,:)))
    set(handles.texthrv,'string',num2str(HRVmedio(ind)))
    
    elseif nvideos==11
    ind=find(nomes==11)
    plot(handles.axes1,t,ECGs(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio(ind)))
    plot(handles.axes2,tgsr,gsr_filtered(12,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia(12,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados(12,:)))
    plot(handles.axes3,tbr,BR_filtrado(12,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada(12,:)))
    set(handles.texthrv,'string',num2str(HRVmedio(ind)))
    
    elseif nvideos==12
    ind=find(nomes==12)
    plot(handles.axes1,t,ECGs(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio(ind)))
    plot(handles.axes2,tgsr,gsr_filtered(13,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia(13,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados(13,:)))
    plot(handles.axes3,tbr,BR_filtrado(13,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada(13,:)))
    set(handles.texthrv,'string',num2str(HRVmedio(ind)))
    
    elseif nvideos==13
    ind=find(nomes==13)
    plot(handles.axes1,t,ECGs(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio(ind)))
    plot(handles.axes2,tgsr,gsr_filtered(14,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia(14,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados(14,:)))
    plot(handles.axes3,tbr,BR_filtrado(14,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada(14,:)))
    set(handles.texthrv,'string',num2str(HRVmedio(ind)))
    
    elseif nvideos==14
    ind=find(nomes==14)
    plot(handles.axes1,t,ECGs(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio(ind)))
    plot(handles.axes2,tgsr,gsr_filtered(15,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia(15,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados(15,:)))
    plot(handles.axes3,tbr,BR_filtrado(15,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada(15,:)))
    set(handles.texthrv,'string',num2str(HRVmedio(ind)))
    
    elseif nvideos==15
    ind=find(nomes==15)
    plot(handles.axes1,t,ECGs(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio(ind)))
    plot(handles.axes2,tgsr,gsr_filtered(16,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia(16,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados(16,:)))
    plot(handles.axes3,tbr,BR_filtrado(16,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada(16,:)))
    set(handles.texthrv,'string',num2str(HRVmedio(ind)))
    
    elseif nvideos==16
    ind=find(nomes==16)
    plot(handles.axes1,t,ECGs(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio(ind)))
    plot(handles.axes2,tgsr,gsr_filtered(17,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia(17,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados(17,:)))
    plot(handles.axes3,tbr,BR_filtrado(17,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada(17,:)))
    set(handles.texthrv,'string',num2str(HRVmedio(ind)))
    
    elseif nvideos==17
    ind=find(nomes==0)
    plot(handles.axes1,t,ECGs(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio(ind)))
    plot(handles.axes2,tgsr,gsr_filtered(1,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia(1,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados(1,:)))
    plot(handles.axes3,tbr,BR_filtrado(1,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada(1,:)))
    set(handles.texthrv,'string',num2str(HRVmedio(ind)))
end
end
if npaciente==2
    if nvideos==1
    ind=find(nomes==1)
    plot(handles.axes1,t,ECGs9(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio9(ind)))
    plot(handles.axes2,tgsr,gsr_filtered9(2,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia9(2,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados9(2,:)))
    plot(handles.axes3,tbr,BR_filtrado9(2,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada9(2,:)))
    set(handles.texthrv,'string',num2str(HRVmedio9(ind)))
    
elseif nvideos==2
    ind=find(nomes==2)
    plot(handles.axes1,t,ECGs9(ind,:)),  axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio9(ind)))
    plot(handles.axes2,tgsr,gsr_filtered9(3,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia9(3,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados9(3,:)))
    plot(handles.axes3,tbr,BR_filtrado9(3,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada9(3,:)))
    set(handles.texthrv,'string',num2str(HRVmedio9(ind)))
    
elseif nvideos==3
    ind=find(nomes==3)
    plot(handles.axes1,t,ECGs9(ind,:)),  axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio9(ind)))
    plot(handles.axes2,tgsr,gsr_filtered9(4,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia9(4,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados9(4,:)))
    plot(handles.axes3,tbr,BR_filtrado9(4,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada9(4,:)))
    set(handles.texthrv,'string',num2str(HRVmedio9(ind)))
    
  elseif nvideos==4
    ind=find(nomes==4)
    plot(handles.axes1,t,ECGs9(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio9(ind)))
    plot(handles.axes2,tgsr,gsr_filtered9(5,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia9(5,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados9(5,:)))
    plot(handles.axes3,tbr,BR_filtrado9(5,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada9(5,:)))
    set(handles.texthrv,'string',num2str(HRVmedio9(ind)))
    
    elseif nvideos==5
    ind=find(nomes==5)
    plot(handles.axes1,t,ECGs9(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio9(ind)))
    plot(handles.axes2,tgsr,gsr_filtered9(6,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia9(6,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados9(6,:)))
    plot(handles.axes3,tbr,BR_filtrado9(6,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada9(6,:)))
    set(handles.texthrv,'string',num2str(HRVmedio9(ind)))
    
    elseif nvideos==6
    ind=find(nomes==6)
    plot(handles.axes1,t,ECGs9(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio9(ind)))
    plot(handles.axes2,tgsr,gsr_filtered9(7,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia9(7,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados9(7,:)))
    plot(handles.axes3,tbr,BR_filtrado9(7,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada9(7,:)))
    set(handles.texthrv,'string',num2str(HRVmedio9(ind)))
    
    elseif nvideos==7
    ind=find(nomes==7)
    plot(handles.axes1,t,ECGs9(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio9(ind)))
    plot(handles.axes2,tgsr,gsr_filtered9(8,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia9(8,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados9(8,:)))
    plot(handles.axes3,tbr,BR_filtrado9(8,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada9(8,:)))
    set(handles.texthrv,'string',num2str(HRVmedio9(ind)))
    
    elseif nvideos==8
    ind=find(nomes==8)
    plot(handles.axes1,t,ECGs9(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio9(ind)))
    plot(handles.axes2,tgsr,gsr_filtered9(9,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia9(9,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados9(9,:)))
    plot(handles.axes3,tbr,BR_filtrado9(9,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada9(9,:)))
    set(handles.texthrv,'string',num2str(HRVmedio9(ind)))
    
    elseif nvideos==9
    ind=find(nomes==9)
    plot(handles.axes1,t,ECGs9(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio9(ind)))
    plot(handles.axes2,tgsr,gsr_filtered9(10,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia9(10,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados9(10,:)))
    plot(handles.axes3,tbr,BR_filtrado9(10,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada9(10,:)))
    set(handles.texthrv,'string',num2str(HRVmedio9(ind)))
    
    elseif nvideos==10
    ind=find(nomes==10)
    plot(handles.axes1,t,ECGs9(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio9(ind)))
    plot(handles.axes2,tgsr,gsr_filtered9(11,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia9(11,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados9(11,:)))
    plot(handles.axes3,tbr,BR_filtrado9(11,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada9(11,:)))
    set(handles.texthrv,'string',num2str(HRVmedio9(ind)))
    
    elseif nvideos==11
    ind=find(nomes==11)
    plot(handles.axes1,t,ECGs9(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio9(ind)))
    plot(handles.axes2,tgsr,gsr_filtered9(12,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia9(12,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados9(12,:)))
    plot(handles.axes3,tbr,BR_filtrado9(12,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada9(12,:)))
    set(handles.texthrv,'string',num2str(HRVmedio9(ind)))
    
    elseif nvideos==12
    ind=find(nomes==12)
    plot(handles.axes1,t,ECGs9(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio9(ind)))
    plot(handles.axes2,tgsr,gsr_filtered9(13,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia9(13,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados9(13,:)))
    plot(handles.axes3,tbr,BR_filtrado9(13,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada9(13,:)))
    set(handles.texthrv,'string',num2str(HRVmedio9(ind)))
    
    elseif nvideos==13
    ind=find(nomes==13)
    plot(handles.axes1,t,ECGs9(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio9(ind)))
    plot(handles.axes2,tgsr,gsr_filtered9(14,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia9(14,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados9(14,:)))
    plot(handles.axes3,tbr,BR_filtrado9(14,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada9(14,:)))
    set(handles.texthrv,'string',num2str(HRVmedio9(ind)))
    
    elseif nvideos==14
    ind=find(nomes==14)
    plot(handles.axes1,t,ECGs9(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio9(ind)))
    plot(handles.axes2,tgsr,gsr_filtered9(15,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia9(15,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados9(15,:)))
    plot(handles.axes3,tbr,BR_filtrado9(15,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada9(15,:)))
    set(handles.texthrv,'string',num2str(HRVmedio9(ind)))
    
    elseif nvideos==15
    ind=find(nomes==15)
    plot(handles.axes1,t,ECGs9(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio9(ind)))
    plot(handles.axes2,tgsr,gsr_filtered9(16,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia9(16,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados9(16,:)))
    plot(handles.axes3,tbr,BR_filtrado9(16,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada9(16,:)))
    set(handles.texthrv,'string',num2str(HRVmedio9(ind)))
    
    elseif nvideos==16
    ind=find(nomes==16)
    plot(handles.axes1,t,ECGs9(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio9(ind)))
    plot(handles.axes2,tgsr,gsr_filtered9(17,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia9(17,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados9(17,:)))
    plot(handles.axes3,tbr,BR_filtrado9(17,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada9(17,:)))
    set(handles.texthrv,'string',num2str(HRVmedio9(ind)))
    
    elseif nvideos==17
    ind=find(nomes==0)
    plot(handles.axes1,t,ECGs9(ind,:)), axis tight,xlabel('t/s'), ylabel('mV')
    set(handles.text1,'string',num2str(BPMmedio9(ind)))
    plot(handles.axes2,tgsr,gsr_filtered9(1,:)), axis tight,xlabel('t/s'), ylabel('uS')
    set(handles.textgsrmed,'string',num2str(GSRMedia9(1,:)))
    set(handles.textgsrmax,'string',num2str(GSRMaxsRegistados9(1,:)))
    plot(handles.axes3,tbr,BR_filtrado9(1,:)), axis tight,xlabel('t/s'), ylabel('%')
    set(handles.textbrmax,'string',num2str(BRMaxsRegistada9(1,:)))
    set(handles.texthrv,'string',num2str(HRVmedio9(ind)))
end
end
function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all
close all


% --- Executes on selection change in escolhapaciente.
function escolhapaciente_Callback(hObject, eventdata, handles)
% hObject    handle to escolhapaciente (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns escolhapaciente contents as cell array
%        contents{get(hObject,'Value')} returns selected item from escolhapaciente


% --- Executes during object creation, after setting all properties.
function escolhapaciente_CreateFcn(hObject, eventdata, handles)
% hObject    handle to escolhapaciente (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
