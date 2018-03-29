function varargout = newgui(varargin)
%      BACKGAMMON, by itself, creates a new BACKGAMMON or raises the existing
%      singleton*.
%
%      H = BACKGAMMON returns the handle to a new BACKGAMMON or the handle to
%      the existing singleton*.
%
%      BACKGAMMON('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BACKGAMMON.M with the given input arguments.
%
%      BACKGAMMON('Property','Value',...) creates a new BACKGAMMON or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Backgammon_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Backgammon_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Backgammon

% Last Modified by GUIDE v2.5 21-Jun-2017 20:12:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Backgammon_OpeningFcn, ...
                   'gui_OutputFcn',  @Backgammon_OutputFcn, ...
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

%% End initialization code - DO NOT EDIT
%
% --- Executes just before Backgammon is made visible.
function Backgammon_OpeningFcn(hObject, eventdata, handles, varargin)


% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Backgammon (see VARARGIN)
handles.YdownMid=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,14.5];
handles.YupMid=[29,28,27,26,25,24,23,22,21,20,19,18,17,16,15.5];
handles.Snumber=0;
handles.Fnumber=0;
handles.FinP=29;
handles.Scounter=8;
handles.CheckWinner=0;
handles.FinCounter=0;
handles.counter=0; %licznik wyborów pól
handles.x=13/6;
handles.top=[30 30 18];
handles.bottom=[0 0 12];
handles.black=[0 0 0];
handles.white=[1 1 1];
handles.ax=handles.axes1
handles.plot1=patch([0 30 30 0],[0 0 30 30],[0 0.5 0]);
hold on
%pasek po srodku
handles.plot2=patch([13 15 15 13],[0 0 30 30],[0.7 0.1 0]);
%baza
handles.plot3=patch([28 30 30 28],[0 0 30 30],[0.7 0.1 0]);
%kwadrat
handles.plot4=patch([13 15 15 13],[14 14 16 16],[0 0 0]);

handles.Tplot12=patch([0 handles.x handles.x/2],handles.bottom,handles.white);
handles.P12=handles.x/2;
handles.Tplot11=patch([handles.x handles.x*2 handles.x*1.5],handles.bottom,handles.black);
handles.P11=handles.x*1.5;
handles.Tplot10=patch([handles.x*2 handles.x*3 handles.x*2.5],handles.bottom,handles.white);
handles.P10=handles.x*2.5;
handles.Tplot9=patch([handles.x*3 handles.x*4 handles.x*3.5],handles.bottom,handles.black);
handles.P9=handles.x*3.5;
handles.Tplot8=patch([handles.x*4 handles.x*5 handles.x*4.5],handles.bottom,handles.white);
handles.P8=handles.x*4.5;
handles.Tplot7=patch([handles.x*5 handles.x*6 handles.x*5.5],handles.bottom,handles.black);
handles.P7=handles.x*5.5;
handles.Tplot13=patch([0 handles.x handles.x/2],handles.top,handles.black);
handles.P13=handles.x/2;
handles.Tplot14=patch([handles.x handles.x*2 handles.x*1.5],handles.top,handles.white);
handles.P14=handles.x*1.5;
handles.Tplot15=patch([handles.x*2 handles.x*3 handles.x*2.5],handles.top,handles.black);
handles.P15=handles.x*2.5;
handles.Tplot16=patch([handles.x*3 handles.x*4 handles.x*3.5],handles.top,handles.white);
handles.P16=handles.x*3.5;
handles.Tplot17=patch([handles.x*4 handles.x*5 handles.x*4.5],handles.top,handles.black);
handles.P17=handles.x*4.5;
handles.Tplot18=patch([handles.x*5 handles.x*6 handles.x*5.5],handles.top,handles.white);
handles.P18=handles.x*5.5;
handles.Tplot6=patch([15 handles.x+15 handles.x/2+15],handles.bottom,handles.white);
handles.P6=handles.x/2+15;
handles.Tplot5=patch([handles.x+15 handles.x*2+15 handles.x*1.5+15],handles.bottom,handles.black);
handles.P5=handles.x*1.5+15;
handles.Tplot4=patch([handles.x*2+15 handles.x*3+15 handles.x*2.5+15],handles.bottom,handles.white);
handles.P4=handles.x*2.5+15;
handles.Tplot3=patch([handles.x*3+15 handles.x*4+15 handles.x*3.5+15],handles.bottom,handles.black);
handles.P3=handles.x*3.5+15;
handles.Tplot2=patch([handles.x*4+15 handles.x*5+15 handles.x*4.5+15],handles.bottom,handles.white);
handles.P2=handles.x*4.5+15;
handles.Tplot1=patch([handles.x*5+15 handles.x*6+15 handles.x*5.5+15],handles.bottom,handles.black);
handles.P1=handles.x*5.5+15;
handles.Tplot19=patch([15 handles.x+15 handles.x/2+15],handles.top,handles.black);
handles.P19=handles.x/2+15;
handles.Tplot20=patch([handles.x+15 handles.x*2+15 handles.x*1.5+15],handles.top,handles.white);
handles.P20=handles.x*1.5+15;
handles.Tplot21=patch([handles.x*2+15 handles.x*3+15 handles.x*2.5+15],handles.top,handles.black);
handles.P21=handles.x*2.5+15;
handles.Tplot22=patch([handles.x*3+15 handles.x*4+15 handles.x*3.5+15],handles.top,handles.white);
handles.P22=handles.x*3.5+15;
handles.Tplot23=patch([handles.x*4+15 handles.x*5+15 handles.x*4.5+15],handles.top,handles.black);
handles.P23=handles.x*4.5+15;
handles.Tplot24=patch([handles.x*5+15 handles.x*6+15 handles.x*5.5+15],handles.top,handles.white);
handles.P24=handles.x*5.5+15;
%handles.ax=gca;
set(handles.ax,'xtick',[]);
set(handles.ax,'ytick',[]);
set(handles.axes2,'xtick',[]);
set(handles.axes3,'xtick',[]);
set(handles.axes2,'ytick',[]);
set(handles.axes3,'ytick',[]);
%Pionki
[handles.a, handles.b]=pol2cart(0:pi/100:2*pi,1);
%Pionki bia³e 
handles.WhiteCounter1=patch( handles.a+handles.x/2, handles.b+1,handles.white);
handles.WhiteCounter2=patch([handles.a+handles.x/2], [handles.b+2],handles.white);
handles.WhiteCounter3=patch([handles.a+handles.x/2], [handles.b+3],handles.white);
handles.WhiteCounter4=patch([handles.a+handles.x/2], [handles.b+4],handles.white);
handles.WhiteCounter5=patch([handles.a+handles.x/2], [handles.b+5],handles.white);

handles.WhiteCounter6=patch([handles.a+handles.x*5.5+15], [handles.b+1],handles.white);
handles.WhiteCounter7=patch([handles.a+handles.x*5.5+15], [handles.b+2],handles.white);

handles.WhiteCounter8=patch([handles.a+handles.x*4.5], [handles.b+29],handles.white);
handles.WhiteCounter9=patch([handles.a+handles.x*4.5], [handles.b+28],handles.white);
handles.WhiteCounter10=patch([handles.a+handles.x*4.5], [handles.b+27],handles.white);

handles.WhiteCounter11=patch([handles.a+handles.x/2+15], [handles.b+29],handles.white);
handles.WhiteCounter12=patch([handles.a+handles.x/2+15], [handles.b+28],handles.white);
handles.WhiteCounter13=patch([handles.a+handles.x/2+15], [handles.b+27],handles.white);
handles.WhiteCounter14=patch([handles.a+handles.x/2+15], [handles.b+26],handles.white);
handles.WhiteCounter15=patch([handles.a+handles.x/2+15], [handles.b+25],handles.white);
%Pionki czarne
handles.almblack=[0.2 0.2 0.2];
handles.BlackCounter1=patch([handles.a+handles.x*4.5], [handles.b+1],handles.almblack);
handles.BlackCounter2=patch([handles.a+handles.x*4.5], [handles.b+2],handles.almblack);
handles.BlackCounter3=patch([handles.a+handles.x*4.5], [handles.b+3],handles.almblack);

handles.BlackCounter4=patch([handles.a+handles.x/2+15], [handles.b+1],handles.almblack);
handles.BlackCounter5=patch([handles.a+handles.x/2+15], [handles.b+2],handles.almblack);
handles.BlackCounter6=patch([handles.a+handles.x/2+15], [handles.b+3],handles.almblack);
handles.BlackCounter7=patch([handles.a+handles.x/2+15], [handles.b+4],handles.almblack);
handles.BlackCounter8=patch([handles.a+handles.x/2+15], [handles.b+5],handles.almblack);

handles.BlackCounter9=patch([handles.a+handles.x/2], [handles.b+29],handles.almblack);
handles.BlackCounter10=patch([handles.a+handles.x/2], [handles.b+28],handles.almblack);
handles.BlackCounter11=patch([handles.a+handles.x/2], [handles.b+27],handles.almblack);
handles.BlackCounter12=patch([handles.a+handles.x/2], [handles.b+26],handles.almblack);
handles.BlackCounter13=patch([handles.a+handles.x/2], [handles.b+25],handles.almblack);

handles.BlackCounter14=patch([handles.a+handles.x*5.5+15], [handles.b+29],handles.almblack);
handles.BlackCounter15=patch([handles.a+handles.x*5.5+15], [handles.b+28],handles.almblack);
% Choose default command line output for Backgammon
handles.Blacks=[handles.BlackCounter1,handles.BlackCounter2,handles.BlackCounter3,handles.BlackCounter4,handles.BlackCounter5,handles.BlackCounter6,handles.BlackCounter7,handles.BlackCounter8,handles.BlackCounter9,handles.BlackCounter10,handles.BlackCounter11,handles.BlackCounter12,handles.BlackCounter13,handles.BlackCounter14,handles.BlackCounter15];
handles.Whites=[handles.WhiteCounter1,handles.WhiteCounter2,handles.WhiteCounter3,handles.WhiteCounter4,handles.WhiteCounter5,handles.WhiteCounter6,handles.WhiteCounter7,handles.WhiteCounter8,handles.WhiteCounter9,handles.WhiteCounter10,handles.WhiteCounter11,handles.WhiteCounter12,handles.WhiteCounter13,handles.WhiteCounter14,handles.WhiteCounter15];
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Backgammon wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Backgammon_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.diff = abs(handles.Snumber-handles.Fnumber)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)

% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~(handles.FinCounter)
switch handles.Scounter
    case 0 %Pole z ktorego zaczyna pionek pierwszy raz
        handles.Snumber=1;
        handles.Scounter=handles.Scounter+1;%licznik wyborow pol gracza sie zwieksza o ten wykonany
        handles.SmidX=handles.P1;
        handles.SmidY=handles.YdownMid;
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.SmidX,handles.SmidY);
    case 1 %Pole na ktorym konczy pionek za pierwszym ruchem
        handles.Fnumber=1;
        handles.Scounter=handles.Scounter+1;
        handles.FmidX=handles.P1;
        handles.FmidY=handles.YdownMid;
        handles.diff = abs(handles.Snumber-handles.Fnumber);
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff,handles.A,handles.modu,handles.Fnumber,handles.Snumber,handles.Blacks,handles.Whites,handles.FmidX,handles.FmidY,handles.SmidX,handles.SmidY,handles.YdownMid,handles.YupMid,handles.Scounter);
        if handles.Scounter==2
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 3 ruchy')
            else
                set(handles.text5,'String','Pozosta³ 1 ruch')
            end
        end
    case 2 %Pole z ktorego pionek zaczyna ruch drugi raz
        handles.S1number=1;
        handles.Scounter=handles.Scounter+1;
        handles.S1midX=handles.P1;
        handles.S1midY=handles.YdownMid;
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S1midX,handles.S1midY);
    case 3 %Pole na ktorym konczy pionek za drugim ruchem
        handles.F1number=1;
        handles.Scounter=handles.Scounter+1;
        handles.F1midX=handles.P1;
        handles.F1midY=handles.YdownMid;
        handles.diff1 = abs(handles.S1number-handles.F1number);
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff1,handles.A,handles.modu,handles.F1number,handles.S1number,handles.Blacks,handles.Whites,handles.F1midX,handles.F1midY,handles.S1midX,handles.S1midY,handles.YdownMid,handles.YupMid,handles.Scounter);
        if handles.Scounter==4
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 2 ruchy')
            else
                set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
        end
    case 4 %Gdy wyrzucimy dubel mozemy poruszac pionkami cztery razy
      if handles.FirstDice==handles.SecondDice  
        handles.S11number=1
        handles.Scounter=handles.Scounter+1
        handles.S11midX=handles.P1
        handles.S11midY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S11midX,handles.S11midY)
      end
    case 5
       if handles.FirstDice==handles.SecondDice
            handles.F11number=1
            handles.Scounter=handles.Scounter+1
            handles.F11midX=handles.P1
            handles.F11midY=handles.YdownMid
            handles.diff11 = abs(handles.S11number-handles.F11number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff11,handles.B,handles.modu,handles.F11number,handles.S11number,handles.Blacks,handles.Whites,handles.F11midX,handles.F11midY,handles.S11midX,handles.S11midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==6
                set(handles.text5,'String','Pozosta³ 1 ruch')  
            end
       end 
    case 6
        if handles.FirstDice==handles.SecondDice  
            handles.S111number=1
            handles.Scounter=handles.Scounter+1
            handles.S111midX=handles.P1
            handles.S111midY=handles.YdownMid
            handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S111midX,handles.S111midY)
        end
      case 7
       if handles.FirstDice==handles.SecondDice
            handles.F111number=1
            handles.Scounter=handles.Scounter+1
            handles.F111midX=handles.P1
            handles.F111midY=handles.YdownMid
            handles.diff111 = abs(handles.S111number-handles.F111number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff111,handles.B,handles.modu,handles.F111number,handles.S111number,handles.Blacks,handles.Whites,handles.F111midX,handles.F111midY,handles.S111midX,handles.S111midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==8
                set(handles.text5,'String','Pozosta³o 0 ruchów')  
            end
       end       
end
end
        



guidata(hObject, handles);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~(handles.FinCounter)
switch handles.Scounter
    case 0 %Pole z ktorego zaczyna pionek pierwszy raz
        handles.Snumber=2
        handles.Scounter=handles.Scounter+1 %licznik wyborow pol gracza sie zwieksza o ten wykonany
        handles.SmidX=handles.P2 
        handles.SmidY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.SmidX,handles.SmidY)
    case 1 %Pole na ktorym konczy pionek za pierwszym ruchem
        handles.Fnumber=2
        handles.Scounter=handles.Scounter+1
        handles.FmidX=handles.P2
        handles.FmidY=handles.YdownMid
        handles.diff = abs(handles.Snumber-handles.Fnumber)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff,handles.A,handles.modu,handles.Fnumber,handles.Snumber,handles.Blacks,handles.Whites,handles.FmidX,handles.FmidY,handles.SmidX,handles.SmidY,handles.YdownMid,handles.YupMid,handles.Scounter)    
        if handles.Scounter==2
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 3 ruchy')
            else
                set(handles.text5,'String','Pozosta³ 1 ruch')
            end
        end
    case 2 %Pole z ktorego pionek zaczyna ruch drugi raz
        handles.S1number=2
        handles.Scounter=handles.Scounter+1
        handles.S1midX=handles.P2
        handles.S1midY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S1midX,handles.S1midY)
    case 3 %Pole na ktorym konczy pionek za drugim ruchem
        handles.F1number=2
        handles.Scounter=handles.Scounter+1
        handles.F1midX=handles.P2
        handles.F1midY=handles.YdownMid
        handles.diff1 = abs(handles.S1number-handles.F1number)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff1,handles.A,handles.modu,handles.F1number,handles.S1number,handles.Blacks,handles.Whites,handles.F1midX,handles.F1midY,handles.S1midX,handles.S1midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
        if handles.Scounter==4
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 2 ruchy')
            else
                set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
        end
    case 4 %Gdy wyrzucimy dubel mozemy poruszac pionkami cztery razy
      if handles.FirstDice==handles.SecondDice  
        handles.S11number=2
        handles.Scounter=handles.Scounter+1
        handles.S11midX=handles.P2
        handles.S11midY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S11midX,handles.S11midY)
      end
    case 5
       if handles.FirstDice==handles.SecondDice
            handles.F11number=2
            handles.Scounter=handles.Scounter+1
            handles.F11midX=handles.P2
            handles.F11midY=handles.YdownMid
            handles.diff11 = abs(handles.S11number-handles.F11number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff11,handles.B,handles.modu,handles.F11number,handles.S11number,handles.Blacks,handles.Whites,handles.F11midX,handles.F11midY,handles.S11midX,handles.S11midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==6
                set(handles.text5,'String','Pozosta³ 1 ruch')  
            end
       end 
    case 6
        if handles.FirstDice==handles.SecondDice  
            handles.S111number=2
            handles.Scounter=handles.Scounter+1
            handles.S111midX=handles.P2
            handles.S111midY=handles.YdownMid
            handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S111midX,handles.S111midY)
        end
      case 7
       if handles.FirstDice==handles.SecondDice
            handles.F111number=2
            handles.Scounter=handles.Scounter+1
            handles.F111midX=handles.P2
            handles.F111midY=handles.YdownMid
            handles.diff111 = abs(handles.S111number-handles.F111number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff111,handles.B,handles.modu,handles.F111number,handles.S111number,handles.Blacks,handles.Whites,handles.F111midX,handles.F111midY,handles.S111midX,handles.S111midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==8
                set(handles.text5,'String','Pozosta³o 0 ruchów')  
            end
       end       
end
end
guidata(hObject, handles);
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~(handles.FinCounter)
switch handles.Scounter
    case 0 %Pole z ktorego zaczyna pionek pierwszy raz
        handles.Snumber=3
        handles.Scounter=handles.Scounter+1 %licznik wyborow pol gracza sie zwieksza o ten wykonany
        handles.SmidX=handles.P3 
        handles.SmidY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.SmidX,handles.SmidY)
    case 1 %Pole na ktorym konczy pionek za pierwszym ruchem
        handles.Fnumber=3
        handles.Scounter=handles.Scounter+1
        handles.FmidX=handles.P3
        handles.FmidY=handles.YdownMid
        handles.diff = abs(handles.Snumber-handles.Fnumber)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff,handles.A,handles.modu,handles.Fnumber,handles.Snumber,handles.Blacks,handles.Whites,handles.FmidX,handles.FmidY,handles.SmidX,handles.SmidY,handles.YdownMid,handles.YupMid,handles.Scounter)
        if handles.Scounter==2
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 3 ruchy')
            else
                set(handles.text5,'String','Pozosta³ 1 ruch')
            end
        end
    case 2 %Pole z ktorego pionek zaczyna ruch drugi raz
        handles.S1number=3
        handles.Scounter=handles.Scounter+1
        handles.S1midX=handles.P3
        handles.S1midY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S1midX,handles.S1midY)
    case 3 %Pole na ktorym konczy pionek za drugim ruchem
        handles.F1number=3
        handles.Scounter=handles.Scounter+1
        handles.F1midX=handles.P3
        handles.F1midY=handles.YdownMid
        handles.diff1 = abs(handles.S1number-handles.F1number)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff1,handles.A,handles.modu,handles.F1number,handles.S1number,handles.Blacks,handles.Whites,handles.F1midX,handles.F1midY,handles.S1midX,handles.S1midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
        if handles.Scounter==4
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 2 ruchy')
            else
                set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
        end
    case 4 %Gdy wyrzucimy dubel mozemy poruszac pionkami cztery razy
      if handles.FirstDice==handles.SecondDice  
        handles.S11number=3
        handles.Scounter=handles.Scounter+1
        handles.S11midX=handles.P3
        handles.S11midY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S11midX,handles.S11midY)
      end
    case 5
       if handles.FirstDice==handles.SecondDice
            handles.F11number=3
            handles.Scounter=handles.Scounter+1
            handles.F11midX=handles.P3
            handles.F11midY=handles.YdownMid
            handles.diff11 = abs(handles.S11number-handles.F11number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff11,handles.B,handles.modu,handles.F11number,handles.S11number,handles.Blacks,handles.Whites,handles.F11midX,handles.F11midY,handles.S11midX,handles.S11midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
        if handles.Scounter==6
            set(handles.text5,'String','Pozosta³ 1 ruch')  
        end
       end 
    case 6
        if handles.FirstDice==handles.SecondDice  
            handles.S111number=3
            handles.Scounter=handles.Scounter+1
            handles.S111midX=handles.P3
            handles.S111midY=handles.YdownMid
            handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S111midX,handles.S111midY)
        end
      case 7
       if handles.FirstDice==handles.SecondDice
            handles.F111number=3
            handles.Scounter=handles.Scounter+1
            handles.F111midX=handles.P3
            handles.F111midY=handles.YdownMid
            handles.diff111 = abs(handles.S111number-handles.F111number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff111,handles.B,handles.modu,handles.F111number,handles.S111number,handles.Blacks,handles.Whites,handles.F111midX,handles.F111midY,handles.S111midX,handles.S111midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==8
            	set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
       end       
end
end
guidata(hObject, handles);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~(handles.FinCounter)
switch handles.Scounter
    case 0 %Pole z ktorego zaczyna pionek pierwszy raz
        handles.Snumber=4
        handles.Scounter=handles.Scounter+1 %licznik wyborow pol gracza sie zwieksza o ten wykonany
        handles.SmidX=handles.P4 
        handles.SmidY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.SmidX,handles.SmidY)
    case 1 %Pole na ktorym konczy pionek za pierwszym ruchem
        handles.Fnumber=4
        handles.Scounter=handles.Scounter+1
        handles.FmidX=handles.P4
        handles.FmidY=handles.YdownMid
        handles.diff = abs(handles.Snumber-handles.Fnumber)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff,handles.A,handles.modu,handles.Fnumber,handles.Snumber,handles.Blacks,handles.Whites,handles.FmidX,handles.FmidY,handles.SmidX,handles.SmidY,handles.YdownMid,handles.YupMid,handles.Scounter)    
        if handles.Scounter==2
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 3 ruchy')
            else
                set(handles.text5,'String','Pozosta³ 1 ruch')
            end
        end
    case 2 %Pole z ktorego pionek zaczyna ruch drugi raz
        handles.S1number=4
        handles.Scounter=handles.Scounter+1
        handles.S1midX=handles.P4
        handles.S1midY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S1midX,handles.S1midY)
    case 3 %Pole na ktorym konczy pionek za drugim ruchem
        handles.F1number=4
        handles.Scounter=handles.Scounter+1
        handles.F1midX=handles.P4
        handles.F1midY=handles.YdownMid
        handles.diff1 = abs(handles.S1number-handles.F1number)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff1,handles.A,handles.modu,handles.F1number,handles.S1number,handles.Blacks,handles.Whites,handles.F1midX,handles.F1midY,handles.S1midX,handles.S1midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
        if handles.Scounter==4
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 2 ruchy')
            else
                set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
        end
    case 4 %Gdy wyrzucimy dubel mozemy poruszac pionkami cztery razy
      if handles.FirstDice==handles.SecondDice  
        handles.S11number=4
        handles.Scounter=handles.Scounter+1
        handles.S11midX=handles.P4
        handles.S11midY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S11midX,handles.S11midY)
      end
    case 5
       if handles.FirstDice==handles.SecondDice
            handles.F11number=4
            handles.Scounter=handles.Scounter+1
            handles.F11midX=handles.P4
            handles.F11midY=handles.YdownMid
            handles.diff11 = abs(handles.S11number-handles.F11number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff11,handles.B,handles.modu,handles.F11number,handles.S11number,handles.Blacks,handles.Whites,handles.F11midX,handles.F11midY,handles.S11midX,handles.S11midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==6
                set(handles.text5,'String','Pozosta³ 1 ruch')  
            end
       end 
    case 6
        if handles.FirstDice==handles.SecondDice  
            handles.S111number=4
            handles.Scounter=handles.Scounter+1
            handles.S111midX=handles.P4
            handles.S111midY=handles.YdownMid
            handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S111midX,handles.S111midY)
        end
      case 7
       if handles.FirstDice==handles.SecondDice
            handles.F111number=4
            handles.Scounter=handles.Scounter+1
            handles.F111midX=handles.P4
            handles.F111midY=handles.YdownMid
            handles.diff111 = abs(handles.S111number-handles.F111number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff111,handles.B,handles.modu,handles.F111number,handles.S111number,handles.Blacks,handles.Whites,handles.F111midX,handles.F111midY,handles.S111midX,handles.S111midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==8
                set(handles.text5,'String','Pozosta³o 0 ruchów')  
            end
       end       
end
end
guidata(hObject, handles);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~(handles.FinCounter)
switch handles.Scounter
    case 0 %Pole z ktorego zaczyna pionek pierwszy raz
        handles.Snumber=5
        handles.Scounter=handles.Scounter+1 %licznik wyborow pol gracza sie zwieksza o ten wykonany
        handles.SmidX=handles.P5 
        handles.SmidY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.SmidX,handles.SmidY)
    case 1 %Pole na ktorym konczy pionek za pierwszym ruchem
        handles.Fnumber=5
        handles.Scounter=handles.Scounter+1
        handles.FmidX=handles.P5
        handles.FmidY=handles.YdownMid
        handles.diff = abs(handles.Snumber-handles.Fnumber)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff,handles.A,handles.modu,handles.Fnumber,handles.Snumber,handles.Blacks,handles.Whites,handles.FmidX,handles.FmidY,handles.SmidX,handles.SmidY,handles.YdownMid,handles.YupMid,handles.Scounter)    
        if handles.Scounter==2
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 3 ruchy')
            else
                set(handles.text5,'String','Pozosta³ 1 ruch')
            end
        end
    case 2 %Pole z ktorego pionek zaczyna ruch drugi raz
        handles.S1number=5
        handles.Scounter=handles.Scounter+1
        handles.S1midX=handles.P5
        handles.S1midY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S1midX,handles.S1midY)
    case 3 %Pole na ktorym konczy pionek za drugim ruchem
        handles.F1number=5
        handles.Scounter=handles.Scounter+1
        handles.F1midX=handles.P5
        handles.F1midY=handles.YdownMid
        handles.diff1 = abs(handles.S1number-handles.F1number)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff1,handles.A,handles.modu,handles.F1number,handles.S1number,handles.Blacks,handles.Whites,handles.F1midX,handles.F1midY,handles.S1midX,handles.S1midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
        if handles.Scounter==4
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 2 ruchy')
            else
                set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
        end
    case 4 %Gdy wyrzucimy dubel mozemy poruszac pionkami cztery razy
      if handles.FirstDice==handles.SecondDice  
        handles.S11number=5
        handles.Scounter=handles.Scounter+1
        handles.S11midX=handles.P5
        handles.S11midY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S11midX,handles.S11midY)
      end
    case 5
       if handles.FirstDice==handles.SecondDice
            handles.F11number=5
            handles.Scounter=handles.Scounter+1
            handles.F11midX=handles.P5
            handles.F11midY=handles.YdownMid
            handles.diff11 = abs(handles.S11number-handles.F11number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff11,handles.B,handles.modu,handles.F11number,handles.S11number,handles.Blacks,handles.Whites,handles.F11midX,handles.F11midY,handles.S11midX,handles.S11midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==6
                set(handles.text5,'String','Pozosta³ 1 ruch')  
            end
       end 
    case 6
        if handles.FirstDice==handles.SecondDice  
            handles.S111number=5
            handles.Scounter=handles.Scounter+1
            handles.S111midX=handles.P5
            handles.S111midY=handles.YdownMid
            handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S111midX,handles.S111midY)
        end
      case 7
       if handles.FirstDice==handles.SecondDice
            handles.F111number=5
            handles.Scounter=handles.Scounter+1
            handles.F111midX=handles.P5
            handles.F111midY=handles.YdownMid
            handles.diff111 = abs(handles.S111number-handles.F111number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff111,handles.B,handles.modu,handles.F111number,handles.S111number,handles.Blacks,handles.Whites,handles.F111midX,handles.F111midY,handles.S111midX,handles.S111midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==8
                set(handles.text5,'String','Pozosta³o 0 ruchów')  
            end
       end       
end 
end
guidata(hObject, handles);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~(handles.FinCounter)
switch handles.Scounter
    case 0 %Pole z ktorego zaczyna pionek pierwszy raz
        handles.Snumber=6
        handles.Scounter=handles.Scounter+1 %licznik wyborow pol gracza sie zwieksza o ten wykonany
        handles.SmidX=handles.P6 
        handles.SmidY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.SmidX,handles.SmidY)
    case 1 %Pole na ktorym konczy pionek za pierwszym ruchem
        handles.Fnumber=6
        handles.Scounter=handles.Scounter+1
        handles.FmidX=handles.P6
        handles.FmidY=handles.YdownMid
        handles.diff = abs(handles.Snumber-handles.Fnumber)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff,handles.A,handles.modu,handles.Fnumber,handles.Snumber,handles.Blacks,handles.Whites,handles.FmidX,handles.FmidY,handles.SmidX,handles.SmidY,handles.YdownMid,handles.YupMid,handles.Scounter)    
        if handles.Scounter==2
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 3 ruchy')
            else
                set(handles.text5,'String','Pozosta³ 1 ruch')
            end
        end
    case 2 %Pole z ktorego pionek zaczyna ruch drugi raz
        handles.S1number=6
        handles.Scounter=handles.Scounter+1
        handles.S1midX=handles.P6
        handles.S1midY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S1midX,handles.S1midY)
    case 3 %Pole na ktorym konczy pionek za drugim ruchem
        handles.F1number=6
        handles.Scounter=handles.Scounter+1
        handles.F1midX=handles.P6
        handles.F1midY=handles.YdownMid
        handles.diff1 = abs(handles.S1number-handles.F1number)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff1,handles.A,handles.modu,handles.F1number,handles.S1number,handles.Blacks,handles.Whites,handles.F1midX,handles.F1midY,handles.S1midX,handles.S1midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
        if handles.Scounter==4
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 2 ruchy')
            else
                set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
        end
    case 4 %Gdy wyrzucimy dubel mozemy poruszac pionkami cztery razy
      if handles.FirstDice==handles.SecondDice  
        handles.S11number=6
        handles.Scounter=handles.Scounter+1
        handles.S11midX=handles.P6
        handles.S11midY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S11midX,handles.S11midY)
      end
    case 5
       if handles.FirstDice==handles.SecondDice
            handles.F11number=6
            handles.Scounter=handles.Scounter+1
            handles.F11midX=handles.P6
            handles.F11midY=handles.YdownMid
            handles.diff11 = abs(handles.S11number-handles.F11number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff11,handles.B,handles.modu,handles.F11number,handles.S11number,handles.Blacks,handles.Whites,handles.F11midX,handles.F11midY,handles.S11midX,handles.S11midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==6
                set(handles.text5,'String','Pozosta³ 1 ruch')  
            end
       end 
    case 6
        if handles.FirstDice==handles.SecondDice  
            handles.S111number=6
            handles.Scounter=handles.Scounter+1
            handles.S111midX=handles.P6
            handles.S111midY=handles.YdownMid
            handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S111midX,handles.S111midY)
        end
      case 7
       if handles.FirstDice==handles.SecondDice
            handles.F111number=6
            handles.Scounter=handles.Scounter+1
            handles.F111midX=handles.P6
            handles.F111midY=handles.YdownMid
            handles.diff111 = abs(handles.S111number-handles.F111number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff111,handles.B,handles.modu,handles.F111number,handles.S111number,handles.Blacks,handles.Whites,handles.F111midX,handles.F111midY,handles.S111midX,handles.S111midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==8
                set(handles.text5,'String','Pozosta³o 0 ruchów')  
            end
       end       
end
end
guidata(hObject, handles);
% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~(handles.FinCounter)
switch handles.Scounter
    case 0 %Pole z ktorego zaczyna pionek pierwszy raz
        handles.Snumber=7
        handles.Scounter=handles.Scounter+1 %licznik wyborow pol gracza sie zwieksza o ten wykonany
        handles.SmidX=handles.P7 
        handles.SmidY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.SmidX,handles.SmidY)
    case 1 %Pole na ktorym konczy pionek za pierwszym ruchem
        handles.Fnumber=7
        handles.Scounter=handles.Scounter+1
        handles.FmidX=handles.P7
        handles.FmidY=handles.YdownMid
        handles.diff = abs(handles.Snumber-handles.Fnumber)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff,handles.A,handles.modu,handles.Fnumber,handles.Snumber,handles.Blacks,handles.Whites,handles.FmidX,handles.FmidY,handles.SmidX,handles.SmidY,handles.YdownMid,handles.YupMid,handles.Scounter)    
        if handles.Scounter==2
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 3 ruchy')
            else
                set(handles.text5,'String','Pozosta³ 1 ruch')
            end
        end
    case 2 %Pole z ktorego pionek zaczyna ruch drugi raz
        handles.S1number=7
        handles.Scounter=handles.Scounter+1
        handles.S1midX=handles.P7
        handles.S1midY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S1midX,handles.S1midY)
    case 3 %Pole na ktorym konczy pionek za drugim ruchem
        handles.F1number=7
        handles.Scounter=handles.Scounter+1
        handles.F1midX=handles.P7
        handles.F1midY=handles.YdownMid
        handles.diff1 = abs(handles.S1number-handles.F1number)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff1,handles.A,handles.modu,handles.F1number,handles.S1number,handles.Blacks,handles.Whites,handles.F1midX,handles.F1midY,handles.S1midX,handles.S1midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
        if handles.Scounter==4
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 2 ruchy')
            else
                set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
        end
    case 4 %Gdy wyrzucimy dubel mozemy poruszac pionkami cztery razy
      if handles.FirstDice==handles.SecondDice  
        handles.S11number=7
        handles.Scounter=handles.Scounter+1
        handles.S11midX=handles.P7
        handles.S11midY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S11midX,handles.S11midY)
      end
    case 5
       if handles.FirstDice==handles.SecondDice
            handles.F11number=7
            handles.Scounter=handles.Scounter+1
            handles.F11midX=handles.P7
            handles.F11midY=handles.YdownMid
            handles.diff11 = abs(handles.S11number-handles.F11number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff11,handles.B,handles.modu,handles.F11number,handles.S11number,handles.Blacks,handles.Whites,handles.F11midX,handles.F11midY,handles.S11midX,handles.S11midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==6
                set(handles.text5,'String','Pozosta³ 1 ruch')  
            end
       end 
    case 6
        if handles.FirstDice==handles.SecondDice  
            handles.S111number=7
            handles.Scounter=handles.Scounter+1
            handles.S111midX=handles.P7
            handles.S111midY=handles.YdownMid
            handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S111midX,handles.S111midY)
        end
      case 7
       if handles.FirstDice==handles.SecondDice
            handles.F111number=7
            handles.Scounter=handles.Scounter+1
            handles.F111midX=handles.P7
            handles.F111midY=handles.YdownMid
            handles.diff111 = abs(handles.S111number-handles.F111number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff111,handles.B,handles.modu,handles.F111number,handles.S111number,handles.Blacks,handles.Whites,handles.F111midX,handles.F111midY,handles.S111midX,handles.S111midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==8
                set(handles.text5,'String','Pozosta³o 0 ruchów')  
            end
       end       
end
end
guidata(hObject, handles);
% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~(handles.FinCounter)
switch handles.Scounter
    case 0 %Pole z ktorego zaczyna pionek pierwszy raz
        handles.Snumber=8
        handles.Scounter=handles.Scounter+1 %licznik wyborow pol gracza sie zwieksza o ten wykonany
        handles.SmidX=handles.P8 
        handles.SmidY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.SmidX,handles.SmidY)
    case 1 %Pole na ktorym konczy pionek za pierwszym ruchem
        handles.Fnumber=8
        handles.Scounter=handles.Scounter+1
        handles.FmidX=handles.P8
        handles.FmidY=handles.YdownMid
        handles.diff = abs(handles.Snumber-handles.Fnumber)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff,handles.A,handles.modu,handles.Fnumber,handles.Snumber,handles.Blacks,handles.Whites,handles.FmidX,handles.FmidY,handles.SmidX,handles.SmidY,handles.YdownMid,handles.YupMid,handles.Scounter)    
        if handles.Scounter==2
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 3 ruchy')
            else
                set(handles.text5,'String','Pozosta³ 1 ruch')
            end
        end
    case 2 %Pole z ktorego pionek zaczyna ruch drugi raz
        handles.S1number=8
        handles.Scounter=handles.Scounter+1
        handles.S1midX=handles.P8
        handles.S1midY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S1midX,handles.S1midY)
    case 3 %Pole na ktorym konczy pionek za drugim ruchem
        handles.F1number=8
        handles.Scounter=handles.Scounter+1
        handles.F1midX=handles.P8
        handles.F1midY=handles.YdownMid
        handles.diff1 = abs(handles.S1number-handles.F1number)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff1,handles.A,handles.modu,handles.F1number,handles.S1number,handles.Blacks,handles.Whites,handles.F1midX,handles.F1midY,handles.S1midX,handles.S1midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
        if handles.Scounter==4
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 2 ruchy')
            else
                set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
        end
    case 4 %Gdy wyrzucimy dubel mozemy poruszac pionkami cztery razy
      if handles.FirstDice==handles.SecondDice  
        handles.S11number=8
        handles.Scounter=handles.Scounter+1
        handles.S11midX=handles.P8
        handles.S11midY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S11midX,handles.S11midY)
      end
    case 5
       if handles.FirstDice==handles.SecondDice
            handles.F11number=8
            handles.Scounter=handles.Scounter+1
            handles.F11midX=handles.P8
            handles.F11midY=handles.YdownMid
            handles.diff11 = abs(handles.S11number-handles.F11number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff11,handles.B,handles.modu,handles.F11number,handles.S11number,handles.Blacks,handles.Whites,handles.F11midX,handles.F11midY,handles.S11midX,handles.S11midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==6
                set(handles.text5,'String','Pozosta³ 1 ruch')  
            end
       end 
    case 6
        if handles.FirstDice==handles.SecondDice  
            handles.S111number=8
            handles.Scounter=handles.Scounter+1
            handles.S111midX=handles.P8
            handles.S111midY=handles.YdownMid
            handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S111midX,handles.S111midY)
        end
      case 7
       if handles.FirstDice==handles.SecondDice
            handles.F111number=8
            handles.Scounter=handles.Scounter+1
            handles.F111midX=handles.P8
            handles.F111midY=handles.YdownMid
            handles.diff111 = abs(handles.S111number-handles.F111number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff111,handles.B,handles.modu,handles.F111number,handles.S111number,handles.Blacks,handles.Whites,handles.F111midX,handles.F111midY,handles.S111midX,handles.S111midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==8
                set(handles.text5,'String','Pozosta³o 0 ruchów')  
            end
       end       
end 
end
guidata(hObject, handles);
% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~(handles.FinCounter)
switch handles.Scounter
    case 0 %Pole z ktorego zaczyna pionek pierwszy raz
        handles.Snumber=9
        handles.Scounter=handles.Scounter+1 %licznik wyborow pol gracza sie zwieksza o ten wykonany
        handles.SmidX=handles.P9 
        handles.SmidY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.SmidX,handles.SmidY)
    case 1 %Pole na ktorym konczy pionek za pierwszym ruchem
        handles.Fnumber=9
        handles.Scounter=handles.Scounter+1
        handles.FmidX=handles.P9
        handles.FmidY=handles.YdownMid
        handles.diff = abs(handles.Snumber-handles.Fnumber)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff,handles.A,handles.modu,handles.Fnumber,handles.Snumber,handles.Blacks,handles.Whites,handles.FmidX,handles.FmidY,handles.SmidX,handles.SmidY,handles.YdownMid,handles.YupMid,handles.Scounter)    
        if handles.Scounter==2
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 3 ruchy')
            else
                set(handles.text5,'String','Pozosta³ 1 ruch')
            end
        end
    case 2 %Pole z ktorego pionek zaczyna ruch drugi raz
        handles.S1number=9
        handles.Scounter=handles.Scounter+1
        handles.S1midX=handles.P9
        handles.S1midY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S1midX,handles.S1midY)
    case 3 %Pole na ktorym konczy pionek za drugim ruchem
        handles.F1number=9
        handles.Scounter=handles.Scounter+1
        handles.F1midX=handles.P9
        handles.F1midY=handles.YdownMid
        handles.diff1 = abs(handles.S1number-handles.F1number)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff1,handles.A,handles.modu,handles.F1number,handles.S1number,handles.Blacks,handles.Whites,handles.F1midX,handles.F1midY,handles.S1midX,handles.S1midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
        if handles.Scounter==4
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 2 ruchy')
            else
                set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
        end
    case 4 %Gdy wyrzucimy dubel mozemy poruszac pionkami cztery razy
      if handles.FirstDice==handles.SecondDice  
        handles.S11number=9
        handles.Scounter=handles.Scounter+1
        handles.S11midX=handles.P9
        handles.S11midY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S11midX,handles.S11midY)
      end
    case 5
       if handles.FirstDice==handles.SecondDice
            handles.F11number=9
            handles.Scounter=handles.Scounter+1
            handles.F11midX=handles.P9
            handles.F11midY=handles.YdownMid
            handles.diff11 = abs(handles.S11number-handles.F11number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff11,handles.B,handles.modu,handles.F11number,handles.S11number,handles.Blacks,handles.Whites,handles.F11midX,handles.F11midY,handles.S11midX,handles.S11midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==6
                set(handles.text5,'String','Pozosta³ 1 ruch')  
            end
       end 
    case 6
        if handles.FirstDice==handles.SecondDice  
            handles.S111number=9
            handles.Scounter=handles.Scounter+1
            handles.S111midX=handles.P9
            handles.S111midY=handles.YdownMid
            handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S111midX,handles.S111midY)
        end
      case 7
       if handles.FirstDice==handles.SecondDice
            handles.F111number=9
            handles.Scounter=handles.Scounter+1
            handles.F111midX=handles.P9
            handles.F111midY=handles.YdownMid
            handles.diff111 = abs(handles.S111number-handles.F111number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff111,handles.B,handles.modu,handles.F111number,handles.S111number,handles.Blacks,handles.Whites,handles.F111midX,handles.F111midY,handles.S111midX,handles.S111midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==8
                set(handles.text5,'String','Pozosta³o 0 ruchów')  
            end
       end       
end
end
guidata(hObject, handles);
% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~(handles.FinCounter)
switch handles.Scounter
    case 0 %Pole z ktorego zaczyna pionek pierwszy raz
        handles.Snumber=10
        handles.Scounter=handles.Scounter+1 %licznik wyborow pol gracza sie zwieksza o ten wykonany
        handles.SmidX=handles.P10 
        handles.SmidY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.SmidX,handles.SmidY)
    case 1 %Pole na ktorym konczy pionek za pierwszym ruchem
        handles.Fnumber=10
        handles.Scounter=handles.Scounter+1
        handles.FmidX=handles.P10
        handles.FmidY=handles.YdownMid
        handles.diff = abs(handles.Snumber-handles.Fnumber)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff,handles.A,handles.modu,handles.Fnumber,handles.Snumber,handles.Blacks,handles.Whites,handles.FmidX,handles.FmidY,handles.SmidX,handles.SmidY,handles.YdownMid,handles.YupMid,handles.Scounter)    
        if handles.Scounter==2
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 3 ruchy')
            else
                set(handles.text5,'String','Pozosta³ 1 ruch')
            end
        end
    case 2 %Pole z ktorego pionek zaczyna ruch drugi raz
        handles.S1number=10
        handles.Scounter=handles.Scounter+1
        handles.S1midX=handles.P10
        handles.S1midY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S1midX,handles.S1midY)
    case 3 %Pole na ktorym konczy pionek za drugim ruchem
        handles.F1number=10
        handles.Scounter=handles.Scounter+1
        handles.F1midX=handles.P10
        handles.F1midY=handles.YdownMid
        handles.diff1 = abs(handles.S1number-handles.F1number)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff1,handles.A,handles.modu,handles.F1number,handles.S1number,handles.Blacks,handles.Whites,handles.F1midX,handles.F1midY,handles.S1midX,handles.S1midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
        if handles.Scounter==4
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 2 ruchy')
            else
                set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
        end
    case 4 %Gdy wyrzucimy dubel mozemy poruszac pionkami cztery razy
      if handles.FirstDice==handles.SecondDice  
        handles.S11number=10
        handles.Scounter=handles.Scounter+1
        handles.S11midX=handles.P10
        handles.S11midY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S11midX,handles.S11midY)
      end
    case 5
       if handles.FirstDice==handles.SecondDice
            handles.F11number=10
            handles.Scounter=handles.Scounter+1
            handles.F11midX=handles.P10
            handles.F11midY=handles.YdownMid
            handles.diff11 = abs(handles.S11number-handles.F11number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff11,handles.B,handles.modu,handles.F11number,handles.S11number,handles.Blacks,handles.Whites,handles.F11midX,handles.F11midY,handles.S11midX,handles.S11midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==6
                set(handles.text5,'String','Pozosta³ 1 ruch')  
            end
       end 
    case 6
        if handles.FirstDice==handles.SecondDice  
            handles.S111number=10
            handles.Scounter=handles.Scounter+1
            handles.S111midX=handles.P10
            handles.S111midY=handles.YdownMid
            handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S111midX,handles.S111midY)
        end
      case 7
       if handles.FirstDice==handles.SecondDice
            handles.F111number=10
            handles.Scounter=handles.Scounter+1
            handles.F111midX=handles.P10
            handles.F111midY=handles.YdownMid
            handles.diff111 = abs(handles.S111number-handles.F111number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff111,handles.B,handles.modu,handles.F111number,handles.S111number,handles.Blacks,handles.Whites,handles.F111midX,handles.F111midY,handles.S111midX,handles.S111midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==8
                set(handles.text5,'String','Pozosta³o 0 ruchów')  
            end
       end       
end
end
guidata(hObject, handles);
% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~(handles.FinCounter)
switch handles.Scounter
    case 0 %Pole z ktorego zaczyna pionek pierwszy raz
        handles.Snumber=11
        handles.Scounter=handles.Scounter+1 %licznik wyborow pol gracza sie zwieksza o ten wykonany
        handles.SmidX=handles.P11 
        handles.SmidY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.SmidX,handles.SmidY)
    case 1 %Pole na ktorym konczy pionek za pierwszym ruchem
        handles.Fnumber=11
        handles.Scounter=handles.Scounter+1
        handles.FmidX=handles.P11
        handles.FmidY=handles.YdownMid
        handles.diff = abs(handles.Snumber-handles.Fnumber)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff,handles.A,handles.modu,handles.Fnumber,handles.Snumber,handles.Blacks,handles.Whites,handles.FmidX,handles.FmidY,handles.SmidX,handles.SmidY,handles.YdownMid,handles.YupMid,handles.Scounter)    
        if handles.Scounter==2
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 3 ruchy')
            else
                set(handles.text5,'String','Pozosta³ 1 ruch')
            end
        end
    case 2 %Pole z ktorego pionek zaczyna ruch drugi raz
        handles.S1number=11
        handles.Scounter=handles.Scounter+1
        handles.S1midX=handles.P11
        handles.S1midY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S1midX,handles.S1midY)
    case 3 %Pole na ktorym konczy pionek za drugim ruchem
        handles.F1number=11
        handles.Scounter=handles.Scounter+1
        handles.F1midX=handles.P11
        handles.F1midY=handles.YdownMid
        handles.diff1 = abs(handles.S1number-handles.F1number)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff1,handles.A,handles.modu,handles.F1number,handles.S1number,handles.Blacks,handles.Whites,handles.F1midX,handles.F1midY,handles.S1midX,handles.S1midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
        if handles.Scounter==4
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 2 ruchy')
            else
                set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
        end
    case 4 %Gdy wyrzucimy dubel mozemy poruszac pionkami cztery razy
      if handles.FirstDice==handles.SecondDice  
        handles.S11number=11
        handles.Scounter=handles.Scounter+1
        handles.S11midX=handles.P11
        handles.S11midY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S11midX,handles.S11midY)
      end
    case 5
       if handles.FirstDice==handles.SecondDice
            handles.F11number=11
            handles.Scounter=handles.Scounter+1
            handles.F11midX=handles.P11
            handles.F11midY=handles.YdownMid
            handles.diff11 = abs(handles.S11number-handles.F11number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff11,handles.B,handles.modu,handles.F11number,handles.S11number,handles.Blacks,handles.Whites,handles.F11midX,handles.F11midY,handles.S11midX,handles.S11midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==6
                set(handles.text5,'String','Pozosta³ 1 ruch')  
            end
       end 
    case 6
        if handles.FirstDice==handles.SecondDice  
            handles.S111number=11
            handles.Scounter=handles.Scounter+1
            handles.S111midX=handles.P11
            handles.S111midY=handles.YdownMid
            handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S111midX,handles.S111midY)
        end
      case 7
       if handles.FirstDice==handles.SecondDice
            handles.F111number=11
            handles.Scounter=handles.Scounter+1
            handles.F111midX=handles.P11
            handles.F111midY=handles.YdownMid
            handles.diff111 = abs(handles.S111number-handles.F111number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff111,handles.B,handles.modu,handles.F111number,handles.S111number,handles.Blacks,handles.Whites,handles.F111midX,handles.F111midY,handles.S111midX,handles.S111midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==8
                set(handles.text5,'String','Pozosta³o 0 ruchów')  
            end
       end       
end
end
guidata(hObject, handles);
% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
if ~(handles.FinCounter)
switch handles.Scounter
    case 0 %Pole z ktorego zaczyna pionek pierwszy raz
        handles.Snumber=12
        handles.Scounter=handles.Scounter+1 %licznik wyborow pol gracza sie zwieksza o ten wykonany
        handles.SmidX=handles.P12 
        handles.SmidY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.SmidX,handles.SmidY)
    case 1 %Pole na ktorym konczy pionek za pierwszym ruchem
        handles.Fnumber=12
        handles.Scounter=handles.Scounter+1
        handles.FmidX=handles.P12
        handles.FmidY=handles.YdownMid
        handles.diff = abs(handles.Snumber-handles.Fnumber)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff,handles.A,handles.modu,handles.Fnumber,handles.Snumber,handles.Blacks,handles.Whites,handles.FmidX,handles.FmidY,handles.SmidX,handles.SmidY,handles.YdownMid,handles.YupMid,handles.Scounter)    
        if handles.Scounter==2
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 3 ruchy')
            else
                set(handles.text5,'String','Pozosta³ 1 ruch')
            end
        end
    case 2 %Pole z ktorego pionek zaczyna ruch drugi raz
        handles.S1number=12
        handles.Scounter=handles.Scounter+1
        handles.S1midX=handles.P12
        handles.S1midY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S1midX,handles.S1midY)
    case 3 %Pole na ktorym konczy pionek za drugim ruchem
        handles.F1number=12
        handles.Scounter=handles.Scounter+1
        handles.F1midX=handles.P12
        handles.F1midY=handles.YdownMid
        handles.diff1 = abs(handles.S1number-handles.F1number)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff1,handles.A,handles.modu,handles.F1number,handles.S1number,handles.Blacks,handles.Whites,handles.F1midX,handles.F1midY,handles.S1midX,handles.S1midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
        if handles.Scounter==4
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 2 ruchy')
            else
                set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
        end
    case 4 %Gdy wyrzucimy dubel mozemy poruszac pionkami cztery razy
      if handles.FirstDice==handles.SecondDice  
        handles.S11number=12
        handles.Scounter=handles.Scounter+1
        handles.S11midX=handles.P12
        handles.S11midY=handles.YdownMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S11midX,handles.S11midY)
      end
    case 5
       if handles.FirstDice==handles.SecondDice
            handles.F11number=12
            handles.Scounter=handles.Scounter+1
            handles.F11midX=handles.P12
            handles.F11midY=handles.YdownMid
            handles.diff11 = abs(handles.S11number-handles.F11number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff11,handles.B,handles.modu,handles.F11number,handles.S11number,handles.Blacks,handles.Whites,handles.F11midX,handles.F11midY,handles.S11midX,handles.S11midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==6
                set(handles.text5,'String','Pozosta³ 1 ruch')  
            end
       end 
    case 6
        if handles.FirstDice==handles.SecondDice  
            handles.S111number=12
            handles.Scounter=handles.Scounter+1
            handles.S111midX=handles.P12
            handles.S111midY=handles.YdownMid
            handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S111midX,handles.S111midY)
        end
      case 7
       if handles.FirstDice==handles.SecondDice
            handles.F111number=12
            handles.Scounter=handles.Scounter+1
            handles.F111midX=handles.P12
            handles.F111midY=handles.YdownMid
            handles.diff111 = abs(handles.S111number-handles.F111number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff111,handles.B,handles.modu,handles.F111number,handles.S111number,handles.Blacks,handles.Whites,handles.F111midX,handles.F111midY,handles.S111midX,handles.S111midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==8
                set(handles.text5,'String','Pozosta³o 0 ruchów')  
            end
       end       
end
end
guidata(hObject, handles);
% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~(handles.FinCounter)
switch handles.Scounter
    case 0 %Pole z ktorego zaczyna pionek pierwszy raz
        handles.Snumber=24
        handles.Scounter=handles.Scounter+1 %licznik wyborow pol gracza sie zwieksza o ten wykonany
        handles.SmidX=handles.P24 
        handles.SmidY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.SmidX,handles.SmidY)
    case 1 %Pole na ktorym konczy pionek za pierwszym ruchem
        handles.Fnumber=24
        handles.Scounter=handles.Scounter+1
        handles.FmidX=handles.P24
        handles.FmidY=handles.YupMid
        handles.diff = abs(handles.Snumber-handles.Fnumber)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff,handles.A,handles.modu,handles.Fnumber,handles.Snumber,handles.Blacks,handles.Whites,handles.FmidX,handles.FmidY,handles.SmidX,handles.SmidY,handles.YdownMid,handles.YupMid,handles.Scounter)    
        if handles.Scounter==2
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 3 ruchy')
            else
                set(handles.text5,'String','Pozosta³ 1 ruch')
            end
        end
    case 2 %Pole z ktorego pionek zaczyna ruch drugi raz
        handles.S1number=24
        handles.Scounter=handles.Scounter+1
        handles.S1midX=handles.P24
        handles.S1midY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S1midX,handles.S1midY)
    case 3 %Pole na ktorym konczy pionek za drugim ruchem
        handles.F1number=24
        handles.Scounter=handles.Scounter+1
        handles.F1midX=handles.P24
        handles.F1midY=handles.YupMid
        handles.diff1 = abs(handles.S1number-handles.F1number)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff1,handles.A,handles.modu,handles.F1number,handles.S1number,handles.Blacks,handles.Whites,handles.F1midX,handles.F1midY,handles.S1midX,handles.S1midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
        if handles.Scounter==4
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 2 ruchy')
            else
                set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
        end
    case 4 %Gdy wyrzucimy dubel mozemy poruszac pionkami cztery razy
      if handles.FirstDice==handles.SecondDice  
        handles.S11number=24
        handles.Scounter=handles.Scounter+1
        handles.S11midX=handles.P24
        handles.S11midY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S11midX,handles.S11midY)
      end
    case 5
       if handles.FirstDice==handles.SecondDice
            handles.F11number=24
            handles.Scounter=handles.Scounter+1
            handles.F11midX=handles.P24
            handles.F11midY=handles.YupMid
            handles.diff11 = abs(handles.S11number-handles.F11number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff11,handles.B,handles.modu,handles.F11number,handles.S11number,handles.Blacks,handles.Whites,handles.F11midX,handles.F11midY,handles.S11midX,handles.S11midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==6
                set(handles.text5,'String','Pozosta³ 1 ruch')  
            end
       end 
    case 6
        if handles.FirstDice==handles.SecondDice  
            handles.S111number=24
            handles.Scounter=handles.Scounter+1
            handles.S111midX=handles.P24
            handles.S111midY=handles.YupMid
            handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S111midX,handles.S111midY)
        end
      case 7
       if handles.FirstDice==handles.SecondDice
            handles.F111number=24
            handles.Scounter=handles.Scounter+1
            handles.F111midX=handles.P24
            handles.F111midY=handles.YupMid
            handles.diff111 = abs(handles.S111number-handles.F111number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff111,handles.B,handles.modu,handles.F111number,handles.S111number,handles.Blacks,handles.Whites,handles.F111midX,handles.F111midY,handles.S111midX,handles.S111midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==8
                set(handles.text5,'String','Pozosta³o 0 ruchów')  
            end
       end       
end 
end
guidata(hObject, handles);
% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~(handles.FinCounter)
switch handles.Scounter
    case 0 %Pole z ktorego zaczyna pionek pierwszy raz
        handles.Snumber=23
        handles.Scounter=handles.Scounter+1 %licznik wyborow pol gracza sie zwieksza o ten wykonany
        handles.SmidX=handles.P23 
        handles.SmidY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.SmidX,handles.SmidY)
    case 1 %Pole na ktorym konczy pionek za pierwszym ruchem
        handles.Fnumber=23
        handles.Scounter=handles.Scounter+1
        handles.FmidX=handles.P23
        handles.FmidY=handles.YupMid
        handles.diff = abs(handles.Snumber-handles.Fnumber)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff,handles.A,handles.modu,handles.Fnumber,handles.Snumber,handles.Blacks,handles.Whites,handles.FmidX,handles.FmidY,handles.SmidX,handles.SmidY,handles.YdownMid,handles.YupMid,handles.Scounter)    
        if handles.Scounter==2
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 3 ruchy')
            else
                set(handles.text5,'String','Pozosta³ 1 ruch')
            end
        end
    case 2 %Pole z ktorego pionek zaczyna ruch drugi raz
        handles.S1number=23
        handles.Scounter=handles.Scounter+1
        handles.S1midX=handles.P23
        handles.S1midY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S1midX,handles.S1midY)
    case 3 %Pole na ktorym konczy pionek za drugim ruchem
        handles.F1number=23
        handles.Scounter=handles.Scounter+1
        handles.F1midX=handles.P23
        handles.F1midY=handles.YupMid
        handles.diff1 = abs(handles.S1number-handles.F1number)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff1,handles.A,handles.modu,handles.F1number,handles.S1number,handles.Blacks,handles.Whites,handles.F1midX,handles.F1midY,handles.S1midX,handles.S1midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
        if handles.Scounter==4
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 2 ruchy')
            else
                set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
        end
    case 4 %Gdy wyrzucimy dubel mozemy poruszac pionkami cztery razy
      if handles.FirstDice==handles.SecondDice  
        handles.S11number=23
        handles.Scounter=handles.Scounter+1
        handles.S11midX=handles.P23
        handles.S11midY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S11midX,handles.S11midY)
      end
    case 5
       if handles.FirstDice==handles.SecondDice
            handles.F11number=23
            handles.Scounter=handles.Scounter+1
            handles.F11midX=handles.P23
            handles.F11midY=handles.YupMid
            handles.diff11 = abs(handles.S11number-handles.F11number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff11,handles.B,handles.modu,handles.F11number,handles.S11number,handles.Blacks,handles.Whites,handles.F11midX,handles.F11midY,handles.S11midX,handles.S11midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==6
                set(handles.text5,'String','Pozosta³ 1 ruch')  
            end
       end 
    case 6
        if handles.FirstDice==handles.SecondDice  
            handles.S111number=23
            handles.Scounter=handles.Scounter+1
            handles.S111midX=handles.P23
            handles.S111midY=handles.YupMid
            handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S111midX,handles.S111midY)
        end
      case 7
       if handles.FirstDice==handles.SecondDice
            handles.F111number=23
            handles.Scounter=handles.Scounter+1
            handles.F111midX=handles.P23
            handles.F111midY=handles.YupMid
            handles.diff111 = abs(handles.S111number-handles.F111number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff111,handles.B,handles.modu,handles.F111number,handles.S111number,handles.Blacks,handles.Whites,handles.F111midX,handles.F111midY,handles.S111midX,handles.S111midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==8
                set(handles.text5,'String','Pozosta³o 0 ruchów')  
            end
       end       
end
end
guidata(hObject, handles);
% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~(handles.FinCounter)
switch handles.Scounter
    case 0 %Pole z ktorego zaczyna pionek pierwszy raz
        handles.Snumber=22
        handles.Scounter=handles.Scounter+1 %licznik wyborow pol gracza sie zwieksza o ten wykonany
        handles.SmidX=handles.P22 
        handles.SmidY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.SmidX,handles.SmidY)
    case 1 %Pole na ktorym konczy pionek za pierwszym ruchem
        handles.Fnumber=22
        handles.Scounter=handles.Scounter+1
        handles.FmidX=handles.P22
        handles.FmidY=handles.YupMid
        handles.diff = abs(handles.Snumber-handles.Fnumber)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff,handles.A,handles.modu,handles.Fnumber,handles.Snumber,handles.Blacks,handles.Whites,handles.FmidX,handles.FmidY,handles.SmidX,handles.SmidY,handles.YdownMid,handles.YupMid,handles.Scounter)    
        if handles.Scounter==2
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 3 ruchy')
            else
                set(handles.text5,'String','Pozosta³ 1 ruch')
            end
        end
    case 2 %Pole z ktorego pionek zaczyna ruch drugi raz
        handles.S1number=22
        handles.Scounter=handles.Scounter+1
        handles.S1midX=handles.P22
        handles.S1midY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S1midX,handles.S1midY)
    case 3 %Pole na ktorym konczy pionek za drugim ruchem
        handles.F1number=22
        handles.Scounter=handles.Scounter+1
        handles.F1midX=handles.P22
        handles.F1midY=handles.YupMid
        handles.diff1 = abs(handles.S1number-handles.F1number)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff1,handles.A,handles.modu,handles.F1number,handles.S1number,handles.Blacks,handles.Whites,handles.F1midX,handles.F1midY,handles.S1midX,handles.S1midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
        if handles.Scounter==4
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 2 ruchy')
            else
                set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
        end
    case 4 %Gdy wyrzucimy dubel mozemy poruszac pionkami cztery razy
      if handles.FirstDice==handles.SecondDice  
        handles.S11number=22
        handles.Scounter=handles.Scounter+1
        handles.S11midX=handles.P22
        handles.S11midY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S11midX,handles.S11midY)
      end
    case 5
       if handles.FirstDice==handles.SecondDice
            handles.F11number=22
            handles.Scounter=handles.Scounter+1
            handles.F11midX=handles.P22
            handles.F11midY=handles.YupMid
            handles.diff11 = abs(handles.S11number-handles.F11number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff11,handles.B,handles.modu,handles.F11number,handles.S11number,handles.Blacks,handles.Whites,handles.F11midX,handles.F11midY,handles.S11midX,handles.S11midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==6
                set(handles.text5,'String','Pozosta³ 1 ruch')  
            end
       end 
    case 6
        if handles.FirstDice==handles.SecondDice  
            handles.S111number=22
            handles.Scounter=handles.Scounter+1
            handles.S111midX=handles.P22
            handles.S111midY=handles.YupMid
            handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S111midX,handles.S111midY)
        end
      case 7
       if handles.FirstDice==handles.SecondDice
            handles.F111number=22
            handles.Scounter=handles.Scounter+1
            handles.F111midX=handles.P22
            handles.F111midY=handles.YupMid
            handles.diff111 = abs(handles.S111number-handles.F111number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff111,handles.B,handles.modu,handles.F111number,handles.S111number,handles.Blacks,handles.Whites,handles.F111midX,handles.F111midY,handles.S111midX,handles.S111midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==8
                set(handles.text5,'String','Pozosta³o 0 ruchów')  
            end
       end       
end
end
guidata(hObject, handles);
% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~(handles.FinCounter)
switch handles.Scounter
    case 0 %Pole z ktorego zaczyna pionek pierwszy raz
        handles.Snumber=21
        handles.Scounter=handles.Scounter+1 %licznik wyborow pol gracza sie zwieksza o ten wykonany
        handles.SmidX=handles.P21 
        handles.SmidY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.SmidX,handles.SmidY)
    case 1 %Pole na ktorym konczy pionek za pierwszym ruchem
        handles.Fnumber=21
        handles.Scounter=handles.Scounter+1
        handles.FmidX=handles.P21
        handles.FmidY=handles.YupMid
        handles.diff = abs(handles.Snumber-handles.Fnumber)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff,handles.A,handles.modu,handles.Fnumber,handles.Snumber,handles.Blacks,handles.Whites,handles.FmidX,handles.FmidY,handles.SmidX,handles.SmidY,handles.YdownMid,handles.YupMid,handles.Scounter)    
        if handles.Scounter==2
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 3 ruchy')
            else
                set(handles.text5,'String','Pozosta³ 1 ruch')
            end
        end
    case 2 %Pole z ktorego pionek zaczyna ruch drugi raz
        handles.S1number=21
        handles.Scounter=handles.Scounter+1
        handles.S1midX=handles.P21
        handles.S1midY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S1midX,handles.S1midY)
    case 3 %Pole na ktorym konczy pionek za drugim ruchem
        handles.F1number=21
        handles.Scounter=handles.Scounter+1
        handles.F1midX=handles.P21
        handles.F1midY=handles.YupMid
        handles.diff1 = abs(handles.S1number-handles.F1number)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff1,handles.A,handles.modu,handles.F1number,handles.S1number,handles.Blacks,handles.Whites,handles.F1midX,handles.F1midY,handles.S1midX,handles.S1midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
        if handles.Scounter==4
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 2 ruchy')
            else
                set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
        end
    case 4 %Gdy wyrzucimy dubel mozemy poruszac pionkami cztery razy
      if handles.FirstDice==handles.SecondDice  
        handles.S11number=21
        handles.Scounter=handles.Scounter+1
        handles.S11midX=handles.P21
        handles.S11midY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S11midX,handles.S11midY)
      end
    case 5
       if handles.FirstDice==handles.SecondDice
            handles.F11number=21
            handles.Scounter=handles.Scounter+1
            handles.F11midX=handles.P21
            handles.F11midY=handles.YupMid
            handles.diff11 = abs(handles.S11number-handles.F11number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff11,handles.B,handles.modu,handles.F11number,handles.S11number,handles.Blacks,handles.Whites,handles.F11midX,handles.F11midY,handles.S11midX,handles.S11midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==6
                set(handles.text5,'String','Pozosta³ 1 ruch')  
            end
       end 
    case 6
        if handles.FirstDice==handles.SecondDice  
            handles.S111number=21
            handles.Scounter=handles.Scounter+1
            handles.S111midX=handles.P21
            handles.S111midY=handles.YupMid
            handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S111midX,handles.S111midY)
        end
      case 7
       if handles.FirstDice==handles.SecondDice
            handles.F111number=21
            handles.Scounter=handles.Scounter+1
            handles.F111midX=handles.P21
            handles.F111midY=handles.YupMid
            handles.diff111 = abs(handles.S111number-handles.F111number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff111,handles.B,handles.modu,handles.F111number,handles.S111number,handles.Blacks,handles.Whites,handles.F111midX,handles.F111midY,handles.S111midX,handles.S111midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==8
                set(handles.text5,'String','Pozosta³o 0 ruchów')  
            end
       end       
end
end
guidata(hObject, handles);
% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~(handles.FinCounter)
switch handles.Scounter
    case 0 %Pole z ktorego zaczyna pionek pierwszy raz
        handles.Snumber=20
        handles.Scounter=handles.Scounter+1 %licznik wyborow pol gracza sie zwieksza o ten wykonany
        handles.SmidX=handles.P20 
        handles.SmidY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.SmidX,handles.SmidY)
    case 1 %Pole na ktorym konczy pionek za pierwszym ruchem
        handles.Fnumber=20
        handles.Scounter=handles.Scounter+1
        handles.FmidX=handles.P20
        handles.FmidY=handles.YupMid
        handles.diff = abs(handles.Snumber-handles.Fnumber)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff,handles.A,handles.modu,handles.Fnumber,handles.Snumber,handles.Blacks,handles.Whites,handles.FmidX,handles.FmidY,handles.SmidX,handles.SmidY,handles.YdownMid,handles.YupMid,handles.Scounter)    
        if handles.Scounter==2
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 3 ruchy')
            else
                set(handles.text5,'String','Pozosta³ 1 ruch')
            end
        end
    case 2 %Pole z ktorego pionek zaczyna ruch drugi raz
        handles.S1number=20
        handles.Scounter=handles.Scounter+1
        handles.S1midX=handles.P20
        handles.S1midY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S1midX,handles.S1midY)
    case 3 %Pole na ktorym konczy pionek za drugim ruchem
        handles.F1number=20
        handles.Scounter=handles.Scounter+1
        handles.F1midX=handles.P20
        handles.F1midY=handles.YupMid
        handles.diff1 = abs(handles.S1number-handles.F1number)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff1,handles.A,handles.modu,handles.F1number,handles.S1number,handles.Blacks,handles.Whites,handles.F1midX,handles.F1midY,handles.S1midX,handles.S1midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
        if handles.Scounter==4
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 2 ruchy')
            else
                set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
        end
    case 4 %Gdy wyrzucimy dubel mozemy poruszac pionkami cztery razy
      if handles.FirstDice==handles.SecondDice  
        handles.S11number=20
        handles.Scounter=handles.Scounter+1
        handles.S11midX=handles.P20
        handles.S11midY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S11midX,handles.S11midY)
      end
    case 5
       if handles.FirstDice==handles.SecondDice
            handles.F11number=20
            handles.Scounter=handles.Scounter+1
            handles.F11midX=handles.P20
            handles.F11midY=handles.YupMid
            handles.diff11 = abs(handles.S11number-handles.F11number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff11,handles.B,handles.modu,handles.F11number,handles.S11number,handles.Blacks,handles.Whites,handles.F11midX,handles.F11midY,handles.S11midX,handles.S11midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==6
                set(handles.text5,'String','Pozosta³ 1 ruch')  
            end
       end 
    case 6
        if handles.FirstDice==handles.SecondDice  
            handles.S111number=20
            handles.Scounter=handles.Scounter+1
            handles.S111midX=handles.P20
            handles.S111midY=handles.YupMid
            handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S111midX,handles.S111midY)
        end
      case 7
       if handles.FirstDice==handles.SecondDice
            handles.F111number=20
            handles.Scounter=handles.Scounter+1
            handles.F111midX=handles.P20
            handles.F111midY=handles.YupMid
            handles.diff111 = abs(handles.S111number-handles.F111number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff111,handles.B,handles.modu,handles.F111number,handles.S111number,handles.Blacks,handles.Whites,handles.F111midX,handles.F111midY,handles.S111midX,handles.S111midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==8
                set(handles.text5,'String','Pozosta³o 0 ruchów')  
            end
       end       
end
end
guidata(hObject, handles);
% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~(handles.FinCounter)
switch handles.Scounter
    case 0 %Pole z ktorego zaczyna pionek pierwszy raz
        handles.Snumber=19
        handles.Scounter=handles.Scounter+1 %licznik wyborow pol gracza sie zwieksza o ten wykonany
        handles.SmidX=handles.P19 
        handles.SmidY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.SmidX,handles.SmidY)
    case 1 %Pole na ktorym konczy pionek za pierwszym ruchem
        handles.Fnumber=19
        handles.Scounter=handles.Scounter+1
        handles.FmidX=handles.P19
        handles.FmidY=handles.YupMid
        handles.diff = abs(handles.Snumber-handles.Fnumber)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff,handles.A,handles.modu,handles.Fnumber,handles.Snumber,handles.Blacks,handles.Whites,handles.FmidX,handles.FmidY,handles.SmidX,handles.SmidY,handles.YdownMid,handles.YupMid,handles.Scounter)    
        if handles.Scounter==2
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 3 ruchy')
            else
                set(handles.text5,'String','Pozosta³ 1 ruch')
            end
        end
    case 2 %Pole z ktorego pionek zaczyna ruch drugi raz
        handles.S1number=19
        handles.Scounter=handles.Scounter+1
        handles.S1midX=handles.P19
        handles.S1midY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S1midX,handles.S1midY)
    case 3 %Pole na ktorym konczy pionek za drugim ruchem
        handles.F1number=19
        handles.Scounter=handles.Scounter+1
        handles.F1midX=handles.P19
        handles.F1midY=handles.YupMid
        handles.diff1 = abs(handles.S1number-handles.F1number)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff1,handles.A,handles.modu,handles.F1number,handles.S1number,handles.Blacks,handles.Whites,handles.F1midX,handles.F1midY,handles.S1midX,handles.S1midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
        if handles.Scounter==4
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 2 ruchy')
            else
                set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
        end
    case 4 %Gdy wyrzucimy dubel mozemy poruszac pionkami cztery razy
      if handles.FirstDice==handles.SecondDice  
        handles.S11number=19
        handles.Scounter=handles.Scounter+1
        handles.S11midX=handles.P19
        handles.S11midY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S11midX,handles.S11midY)
      end
    case 5
       if handles.FirstDice==handles.SecondDice
            handles.F11number=19
            handles.Scounter=handles.Scounter+1
            handles.F11midX=handles.P19
            handles.F11midY=handles.YupMid
            handles.diff11 = abs(handles.S11number-handles.F11number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff11,handles.B,handles.modu,handles.F11number,handles.S11number,handles.Blacks,handles.Whites,handles.F11midX,handles.F11midY,handles.S11midX,handles.S11midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==6
                set(handles.text5,'String','Pozosta³ 1 ruch')  
            end
       end 
    case 6
        if handles.FirstDice==handles.SecondDice  
            handles.S111number=19
            handles.Scounter=handles.Scounter+1
            handles.S111midX=handles.P19
            handles.S111midY=handles.YupMid
            handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S111midX,handles.S111midY)
        end
      case 7
       if handles.FirstDice==handles.SecondDice
            handles.F111number=19
            handles.Scounter=handles.Scounter+1
            handles.F111midX=handles.P19
            handles.F111midY=handles.YupMid
            handles.diff111 = abs(handles.S111number-handles.F111number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff111,handles.B,handles.modu,handles.F111number,handles.S111number,handles.Blacks,handles.Whites,handles.F111midX,handles.F111midY,handles.S111midX,handles.S111midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==8
                set(handles.text5,'String','Pozosta³o 0 ruchów')  
            end
       end       
end
end
guidata(hObject, handles);
% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~(handles.FinCounter)
switch handles.Scounter
    case 0 %Pole z ktorego zaczyna pionek pierwszy raz
        handles.Snumber=18
        handles.Scounter=handles.Scounter+1 %licznik wyborow pol gracza sie zwieksza o ten wykonany
        handles.SmidX=handles.P18 
        handles.SmidY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.SmidX,handles.SmidY)
    case 1 %Pole na ktorym konczy pionek za pierwszym ruchem
        handles.Fnumber=18
        handles.Scounter=handles.Scounter+1
        handles.FmidX=handles.P18
        handles.FmidY=handles.YupMid
        handles.diff = abs(handles.Snumber-handles.Fnumber)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff,handles.A,handles.modu,handles.Fnumber,handles.Snumber,handles.Blacks,handles.Whites,handles.FmidX,handles.FmidY,handles.SmidX,handles.SmidY,handles.YdownMid,handles.YupMid,handles.Scounter)    
        if handles.Scounter==2
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 3 ruchy')
            else
                set(handles.text5,'String','Pozosta³ 1 ruch')
            end
        end
    case 2 %Pole z ktorego pionek zaczyna ruch drugi raz
        handles.S1number=18
        handles.Scounter=handles.Scounter+1
        handles.S1midX=handles.P18
        handles.S1midY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S1midX,handles.S1midY)
    case 3 %Pole na ktorym konczy pionek za drugim ruchem
        handles.F1number=18
        handles.Scounter=handles.Scounter+1
        handles.F1midX=handles.P18
        handles.F1midY=handles.YupMid
        handles.diff1 = abs(handles.S1number-handles.F1number)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff1,handles.A,handles.modu,handles.F1number,handles.S1number,handles.Blacks,handles.Whites,handles.F1midX,handles.F1midY,handles.S1midX,handles.S1midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
        if handles.Scounter==4
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 2 ruchy')
            else
                set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
        end
    case 4 %Gdy wyrzucimy dubel mozemy poruszac pionkami cztery razy
      if handles.FirstDice==handles.SecondDice  
        handles.S11number=18
        handles.Scounter=handles.Scounter+1
        handles.S11midX=handles.P18
        handles.S11midY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S11midX,handles.S11midY)
      end
    case 5
       if handles.FirstDice==handles.SecondDice
            handles.F11number=18
            handles.Scounter=handles.Scounter+1
            handles.F11midX=handles.P18
            handles.F11midY=handles.YupMid
            handles.diff11 = abs(handles.S11number-handles.F11number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff11,handles.B,handles.modu,handles.F11number,handles.S11number,handles.Blacks,handles.Whites,handles.F11midX,handles.F11midY,handles.S11midX,handles.S11midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==6
                set(handles.text5,'String','Pozosta³ 1 ruch')  
            end
       end 
    case 6
        if handles.FirstDice==handles.SecondDice  
            handles.S111number=18
            handles.Scounter=handles.Scounter+1
            handles.S111midX=handles.P18
            handles.S111midY=handles.YupMid
            handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S111midX,handles.S111midY)
        end
      case 7
       if handles.FirstDice==handles.SecondDice
            handles.F111number=18
            handles.Scounter=handles.Scounter+1
            handles.F111midX=handles.P18
            handles.F111midY=handles.YupMid
            handles.diff111 = abs(handles.S111number-handles.F111number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff111,handles.B,handles.modu,handles.F111number,handles.S111number,handles.Blacks,handles.Whites,handles.F111midX,handles.F111midY,handles.S111midX,handles.S111midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==8
                set(handles.text5,'String','Pozosta³o 0 ruchów')  
            end
       end       
end
end
guidata(hObject, handles);
% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~(handles.FinCounter)
switch handles.Scounter
    case 0 %Pole z ktorego zaczyna pionek pierwszy raz
        handles.Snumber=17
        handles.Scounter=handles.Scounter+1 %licznik wyborow pol gracza sie zwieksza o ten wykonany
        handles.SmidX=handles.P17 
        handles.SmidY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.SmidX,handles.SmidY)
    case 1 %Pole na ktorym konczy pionek za pierwszym ruchem
        handles.Fnumber=17
        handles.Scounter=handles.Scounter+1
        handles.FmidX=handles.P17
        handles.FmidY=handles.YupMid
        handles.diff = abs(handles.Snumber-handles.Fnumber)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff,handles.A,handles.modu,handles.Fnumber,handles.Snumber,handles.Blacks,handles.Whites,handles.FmidX,handles.FmidY,handles.SmidX,handles.SmidY,handles.YdownMid,handles.YupMid,handles.Scounter)    
        if handles.Scounter==2
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 3 ruchy')
            else
                set(handles.text5,'String','Pozosta³ 1 ruch')
            end
        end
    case 2 %Pole z ktorego pionek zaczyna ruch drugi raz
        handles.S1number=17
        handles.Scounter=handles.Scounter+1
        handles.S1midX=handles.P17
        handles.S1midY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S1midX,handles.S1midY)
    case 3 %Pole na ktorym konczy pionek za drugim ruchem
        handles.F1number=17
        handles.Scounter=handles.Scounter+1
        handles.F1midX=handles.P17
        handles.F1midY=handles.YupMid
        handles.diff1 = abs(handles.S1number-handles.F1number)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff1,handles.A,handles.modu,handles.F1number,handles.S1number,handles.Blacks,handles.Whites,handles.F1midX,handles.F1midY,handles.S1midX,handles.S1midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
        if handles.Scounter==4
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 2 ruchy')
            else
                set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
        end
    case 4 %Gdy wyrzucimy dubel mozemy poruszac pionkami cztery razy
      if handles.FirstDice==handles.SecondDice  
        handles.S11number=17
        handles.Scounter=handles.Scounter+1
        handles.S11midX=handles.P17
        handles.S11midY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S11midX,handles.S11midY)
      end
    case 5
       if handles.FirstDice==handles.SecondDice
            handles.F11number=17
            handles.Scounter=handles.Scounter+1
            handles.F11midX=handles.P17
            handles.F11midY=handles.YupMid
            handles.diff11 = abs(handles.S11number-handles.F11number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff11,handles.B,handles.modu,handles.F11number,handles.S11number,handles.Blacks,handles.Whites,handles.F11midX,handles.F11midY,handles.S11midX,handles.S11midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==6
                set(handles.text5,'String','Pozosta³ 1 ruch')  
            end
       end 
    case 6
        if handles.FirstDice==handles.SecondDice  
            handles.S111number=17
            handles.Scounter=handles.Scounter+1
            handles.S111midX=handles.P17
            handles.S111midY=handles.YupMid
            handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S111midX,handles.S111midY)
        end
      case 7
       if handles.FirstDice==handles.SecondDice
            handles.F111number=17
            handles.Scounter=handles.Scounter+1
            handles.F111midX=handles.P17
            handles.F111midY=handles.YupMid
            handles.diff111 = abs(handles.S111number-handles.F111number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff111,handles.B,handles.modu,handles.F111number,handles.S111number,handles.Blacks,handles.Whites,handles.F111midX,handles.F111midY,handles.S111midX,handles.S111midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==8
                set(handles.text5,'String','Pozosta³o 0 ruchów')  
            end
       end       
end
end
guidata(hObject, handles);
% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~(handles.FinCounter)
switch handles.Scounter
    case 0 %Pole z ktorego zaczyna pionek pierwszy raz
        handles.Snumber=16
        handles.Scounter=handles.Scounter+1 %licznik wyborow pol gracza sie zwieksza o ten wykonany
        handles.SmidX=handles.P16 
        handles.SmidY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.SmidX,handles.SmidY)
    case 1 %Pole na ktorym konczy pionek za pierwszym ruchem
        handles.Fnumber=16
        handles.Scounter=handles.Scounter+1
        handles.FmidX=handles.P16
        handles.FmidY=handles.YupMid
        handles.diff = abs(handles.Snumber-handles.Fnumber)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff,handles.A,handles.modu,handles.Fnumber,handles.Snumber,handles.Blacks,handles.Whites,handles.FmidX,handles.FmidY,handles.SmidX,handles.SmidY,handles.YdownMid,handles.YupMid,handles.Scounter)    
        if handles.Scounter==2
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 3 ruchy')
            else
                set(handles.text5,'String','Pozosta³ 1 ruch')
            end
        end
    case 2 %Pole z ktorego pionek zaczyna ruch drugi raz
        handles.S1number=16
        handles.Scounter=handles.Scounter+1
        handles.S1midX=handles.P16
        handles.S1midY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S1midX,handles.S1midY)
    case 3 %Pole na ktorym konczy pionek za drugim ruchem
        handles.F1number=16
        handles.Scounter=handles.Scounter+1
        handles.F1midX=handles.P16
        handles.F1midY=handles.YupMid
        handles.diff1 = abs(handles.S1number-handles.F1number)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff1,handles.A,handles.modu,handles.F1number,handles.S1number,handles.Blacks,handles.Whites,handles.F1midX,handles.F1midY,handles.S1midX,handles.S1midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
        if handles.Scounter==4
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 2 ruchy')
            else
                set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
        end
    case 4 %Gdy wyrzucimy dubel mozemy poruszac pionkami cztery razy
      if handles.FirstDice==handles.SecondDice  
        handles.S11number=16
        handles.Scounter=handles.Scounter+1
        handles.S11midX=handles.P16
        handles.S11midY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S11midX,handles.S11midY)
      end
    case 5
       if handles.FirstDice==handles.SecondDice
            handles.F11number=16
            handles.Scounter=handles.Scounter+1
            handles.F11midX=handles.P16
            handles.F11midY=handles.YupMid
            handles.diff11 = abs(handles.S11number-handles.F11number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff11,handles.B,handles.modu,handles.F11number,handles.S11number,handles.Blacks,handles.Whites,handles.F11midX,handles.F11midY,handles.S11midX,handles.S11midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==6
                set(handles.text5,'String','Pozosta³ 1 ruch')  
            end
       end 
    case 6
        if handles.FirstDice==handles.SecondDice  
            handles.S111number=16
            handles.Scounter=handles.Scounter+1
            handles.S111midX=handles.P16
            handles.S111midY=handles.YupMid
            handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S111midX,handles.S111midY)
        end
      case 7
       if handles.FirstDice==handles.SecondDice
            handles.F111number=16
            handles.Scounter=handles.Scounter+1
            handles.F111midX=handles.P16
            handles.F111midY=handles.YupMid
            handles.diff111 = abs(handles.S111number-handles.F111number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff111,handles.B,handles.modu,handles.F111number,handles.S111number,handles.Blacks,handles.Whites,handles.F111midX,handles.F111midY,handles.S111midX,handles.S111midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==8
                set(handles.text5,'String','Pozosta³o 0 ruchów')  
            end
       end       
end
end
guidata(hObject, handles);
% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~(handles.FinCounter)
switch handles.Scounter
    case 0 %Pole z ktorego zaczyna pionek pierwszy raz
        handles.Snumber=15
        handles.Scounter=handles.Scounter+1 %licznik wyborow pol gracza sie zwieksza o ten wykonany
        handles.SmidX=handles.P15 
        handles.SmidY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.SmidX,handles.SmidY)
    case 1 %Pole na ktorym konczy pionek za pierwszym ruchem
        handles.Fnumber=15
        handles.Scounter=handles.Scounter+1
        handles.FmidX=handles.P15
        handles.FmidY=handles.YupMid
        handles.diff = abs(handles.Snumber-handles.Fnumber)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff,handles.A,handles.modu,handles.Fnumber,handles.Snumber,handles.Blacks,handles.Whites,handles.FmidX,handles.FmidY,handles.SmidX,handles.SmidY,handles.YdownMid,handles.YupMid,handles.Scounter)    
        if handles.Scounter==2
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 3 ruchy')
            else
                set(handles.text5,'String','Pozosta³ 1 ruch')
            end
        end
    case 2 %Pole z ktorego pionek zaczyna ruch drugi raz
        handles.S1number=15
        handles.Scounter=handles.Scounter+1
        handles.S1midX=handles.P15
        handles.S1midY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S1midX,handles.S1midY)
    case 3 %Pole na ktorym konczy pionek za drugim ruchem
        handles.F1number=15
        handles.Scounter=handles.Scounter+1
        handles.F1midX=handles.P15
        handles.F1midY=handles.YupMid
        handles.diff1 = abs(handles.S1number-handles.F1number)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff1,handles.A,handles.modu,handles.F1number,handles.S1number,handles.Blacks,handles.Whites,handles.F1midX,handles.F1midY,handles.S1midX,handles.S1midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
        if handles.Scounter==4
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 2 ruchy')
            else
                set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
        end
    case 4 %Gdy wyrzucimy dubel mozemy poruszac pionkami cztery razy
      if handles.FirstDice==handles.SecondDice  
        handles.S11number=15
        handles.Scounter=handles.Scounter+1
        handles.S11midX=handles.P15
        handles.S11midY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S11midX,handles.S11midY)
      end
    case 5
       if handles.FirstDice==handles.SecondDice
            handles.F11number=15
            handles.Scounter=handles.Scounter+1
            handles.F11midX=handles.P15
            handles.F11midY=handles.YupMid
            handles.diff11 = abs(handles.S11number-handles.F11number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff11,handles.B,handles.modu,handles.F11number,handles.S11number,handles.Blacks,handles.Whites,handles.F11midX,handles.F11midY,handles.S11midX,handles.S11midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==6
                set(handles.text5,'String','Pozosta³ 1 ruch')  
            end
       end 
    case 6
        if handles.FirstDice==handles.SecondDice  
            handles.S111number=15
            handles.Scounter=handles.Scounter+1
            handles.S111midX=handles.P15
            handles.S111midY=handles.YupMid
            handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S111midX,handles.S111midY)
        end
      case 7
       if handles.FirstDice==handles.SecondDice
            handles.F111number=15
            handles.Scounter=handles.Scounter+1
            handles.F111midX=handles.P15
            handles.F111midY=handles.YupMid
            handles.diff111 = abs(handles.S111number-handles.F111number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff111,handles.B,handles.modu,handles.F111number,handles.S111number,handles.Blacks,handles.Whites,handles.F111midX,handles.F111midY,handles.S111midX,handles.S111midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==8
                set(handles.text5,'String','Pozosta³o 0 ruchów')  
            end
       end       
end
end
guidata(hObject, handles);
% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~(handles.FinCounter)
switch handles.Scounter
    case 0 %Pole z ktorego zaczyna pionek pierwszy raz
        handles.Snumber=14
        handles.Scounter=handles.Scounter+1 %licznik wyborow pol gracza sie zwieksza o ten wykonany
        handles.SmidX=handles.P14 
        handles.SmidY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.SmidX,handles.SmidY)
    case 1 %Pole na ktorym konczy pionek za pierwszym ruchem
        handles.Fnumber=14
        handles.Scounter=handles.Scounter+1
        handles.FmidX=handles.P14
        handles.FmidY=handles.YupMid
        handles.diff = abs(handles.Snumber-handles.Fnumber)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff,handles.A,handles.modu,handles.Fnumber,handles.Snumber,handles.Blacks,handles.Whites,handles.FmidX,handles.FmidY,handles.SmidX,handles.SmidY,handles.YdownMid,handles.YupMid,handles.Scounter)    
        if handles.Scounter==2
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 3 ruchy')
            else
                set(handles.text5,'String','Pozosta³ 1 ruch')
            end
        end
    case 2 %Pole z ktorego pionek zaczyna ruch drugi raz
        handles.S1number=14
        handles.Scounter=handles.Scounter+1
        handles.S1midX=handles.P14
        handles.S1midY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S1midX,handles.S1midY)
    case 3 %Pole na ktorym konczy pionek za drugim ruchem
        handles.F1number=14
        handles.Scounter=handles.Scounter+1
        handles.F1midX=handles.P14
        handles.F1midY=handles.YupMid
        handles.diff1 = abs(handles.S1number-handles.F1number)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff1,handles.A,handles.modu,handles.F1number,handles.S1number,handles.Blacks,handles.Whites,handles.F1midX,handles.F1midY,handles.S1midX,handles.S1midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
        if handles.Scounter==4
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 2 ruchy')
            else
                set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
        end
    case 4 %Gdy wyrzucimy dubel mozemy poruszac pionkami cztery razy
      if handles.FirstDice==handles.SecondDice  
        handles.S11number=14
        handles.Scounter=handles.Scounter+1
        handles.S11midX=handles.P14
        handles.S11midY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S11midX,handles.S11midY)
      end
    case 5
       if handles.FirstDice==handles.SecondDice
            handles.F11number=14
            handles.Scounter=handles.Scounter+1
            handles.F11midX=handles.P14
            handles.F11midY=handles.YupMid
            handles.diff11 = abs(handles.S11number-handles.F11number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff11,handles.B,handles.modu,handles.F11number,handles.S11number,handles.Blacks,handles.Whites,handles.F11midX,handles.F11midY,handles.S11midX,handles.S11midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==6
                set(handles.text5,'String','Pozosta³ 1 ruch')  
            end
       end 
    case 6
        if handles.FirstDice==handles.SecondDice  
            handles.S111number=14
            handles.Scounter=handles.Scounter+1
            handles.S111midX=handles.P14
            handles.S111midY=handles.YupMid
            handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S111midX,handles.S111midY)
        end
      case 7
       if handles.FirstDice==handles.SecondDice
            handles.F111number=14
            handles.Scounter=handles.Scounter+1
            handles.F111midX=handles.P14
            handles.F111midY=handles.YupMid
            handles.diff111 = abs(handles.S111number-handles.F111number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff111,handles.B,handles.modu,handles.F111number,handles.S111number,handles.Blacks,handles.Whites,handles.F111midX,handles.F111midY,handles.S111midX,handles.S111midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==8
                set(handles.text5,'String','Pozosta³o 0 ruchów')  
            end
       end       
end
end
guidata(hObject, handles);
% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~(handles.FinCounter)
switch handles.Scounter
    case 0 %Pole z ktorego zaczyna pionek pierwszy raz
        handles.Snumber=13
        handles.Scounter=handles.Scounter+1 %licznik wyborow pol gracza sie zwieksza o ten wykonany
        handles.SmidX=handles.P13 
        handles.SmidY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.SmidX,handles.SmidY)
    case 1 %Pole na ktorym konczy pionek za pierwszym ruchem
        handles.Fnumber=13
        handles.Scounter=handles.Scounter+1
        handles.FmidX=handles.P13
        handles.FmidY=handles.YupMid
        handles.diff = abs(handles.Snumber-handles.Fnumber)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff,handles.A,handles.modu,handles.Fnumber,handles.Snumber,handles.Blacks,handles.Whites,handles.FmidX,handles.FmidY,handles.SmidX,handles.SmidY,handles.YdownMid,handles.YupMid,handles.Scounter)    
        if handles.Scounter==2
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 3 ruchy')
            else
                set(handles.text5,'String','Pozosta³ 1 ruch')
            end
        end
    case 2 %Pole z ktorego pionek zaczyna ruch drugi raz
        handles.S1number=13
        handles.Scounter=handles.Scounter+1
        handles.S1midX=handles.P13
        handles.S1midY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S1midX,handles.S1midY)
    case 3 %Pole na ktorym konczy pionek za drugim ruchem
        handles.F1number=13
        handles.Scounter=handles.Scounter+1
        handles.F1midX=handles.P13
        handles.F1midY=handles.YupMid
        handles.diff1 = abs(handles.S1number-handles.F1number)
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff1,handles.A,handles.modu,handles.F1number,handles.S1number,handles.Blacks,handles.Whites,handles.F1midX,handles.F1midY,handles.S1midX,handles.S1midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
        if handles.Scounter==4
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 2 ruchy')
            else
                set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
        end
    case 4 %Gdy wyrzucimy dubel mozemy poruszac pionkami cztery razy
      if handles.FirstDice==handles.SecondDice  
        handles.S11number=13
        handles.Scounter=handles.Scounter+1
        handles.S11midX=handles.P13
        handles.S11midY=handles.YupMid
        handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S11midX,handles.S11midY)
      end
    case 5
       if handles.FirstDice==handles.SecondDice
            handles.F11number=13
            handles.Scounter=handles.Scounter+1
            handles.F11midX=handles.P13
            handles.F11midY=handles.YupMid
            handles.diff11 = abs(handles.S11number-handles.F11number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff11,handles.B,handles.modu,handles.F11number,handles.S11number,handles.Blacks,handles.Whites,handles.F11midX,handles.F11midY,handles.S11midX,handles.S11midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==6
                set(handles.text5,'String','Pozosta³ 1 ruch')  
            end
       end 
    case 6
        if handles.FirstDice==handles.SecondDice  
            handles.S111number=13
            handles.Scounter=handles.Scounter+1
            handles.S111midX=handles.P13
            handles.S111midY=handles.YupMid
            handles.Scounter=CheckArea(hObject,handles.modu,handles.Whites,handles.Blacks,handles.Scounter,handles.S111midX,handles.S111midY)
        end
      case 7
       if handles.FirstDice==handles.SecondDice
            handles.F111number=13
            handles.Scounter=handles.Scounter+1
            handles.F111midX=handles.P13
            handles.F111midY=handles.YupMid
            handles.diff111 = abs(handles.S111number-handles.F111number)
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=MoveCounter(hObject,handles.diff111,handles.B,handles.modu,handles.F111number,handles.S111number,handles.Blacks,handles.Whites,handles.F111midX,handles.F111midY,handles.S111midX,handles.S111midY,handles.YdownMid,handles.YupMid,handles.Scounter) 
            if handles.Scounter==8
                set(handles.text5,'String','Pozosta³o 0 ruchów')  
            end
       end       
end
end
guidata(hObject, handles);
% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)%META CZARNE
% hObject    handle to pushbutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~(handles.FinCounter)
switch handles.Scounter
case 1 %Pole na ktorym konczy pionek za pierwszym ruchem
        handles.Fnumber=0;
        handles.Scounter=handles.Scounter+1;
        handles.FmidX=handles.FinP;
        handles.FmidY=handles.YdownMid;
        handles.diff = abs(handles.Snumber-handles.Fnumber);
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=FinalMove(hObject, handles.Whites, handles.Blacks,handles.modu,handles.A,handles.diff,handles.Fnumber,handles.Snumber,handles.YupMid,handles.YdownMid,handles.SmidX,handles.SmidY,handles.FmidX,handles.FmidY,handles.Scounter);
        handles.CheckWinner=CheckWinner(handles.modu,handles.Whites,handles.Blacks);
        if handles.CheckWinner
            handles.FinCounter=1;
            set(handles.text2,'String','Koniec gry: Czarne wygrywaj¹');
        else
        if handles.Scounter==2
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 3 ruchy')
            else
                set(handles.text5,'String','Pozosta³ 1 ruch')
            end
        end
        end
case 3 %Pole na ktorym konczy pionek za drugim ruchem
        handles.F1number=0;
        handles.Scounter=handles.Scounter+1;
        handles.F1midX=handles.FinP;
        handles.F1midY=handles.YdownMid;
        handles.diff1 = abs(handles.S1number-handles.F1number);
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=FinalMove(hObject, handles.Whites, handles.Blacks,handles.modu ,handles.A,handles.diff1,handles.F1number,handles.S1number,handles.YupMid,handles.YdownMid,handles.S1midX,handles.S1midY,handles.F1midX,handles.F1midY,handles.Scounter);
        handles.CheckWinner=CheckWinner(handles.modu,handles.Whites,handles.Blacks);
        if handles.CheckWinner
            handles.FinCounter=1;
            set(handles.text2,'String','Koniec gry: Czarne wygrywaj¹');
        else
        if handles.Scounter==4
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 2 ruchy')
            else
                set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
        end
        end
case 5
       if handles.FirstDice==handles.SecondDice
            handles.F11number=0;
            handles.Scounter=handles.Scounter+1;
            handles.F11midX=handles.FinP;
            handles.F11midY=handles.YdownMid;
            handles.diff11 = abs(handles.S11number-handles.F11number);
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=FinalMove(hObject, handles.Whites, handles.Blacks,handles.modu ,handles.B,handles.diff11,handles.F11number,handles.S11number,handles.YupMid,handles.YdownMid,handles.S11midX,handles.S11midY,handles.F11midX,handles.F11midY,handles.Scounter);
            handles.CheckWinner=CheckWinner(handles.modu,handles.Whites,handles.Blacks);
         end 
       if handles.CheckWinner==1
           handles.FinCounter=1;
            set(handles.text2,'String','Koniec gry: Czarne wygrywaj¹');
       else
            if handles.Scounter==6
                set(handles.text5,'String','Pozosta³ 1 ruch')  
            end
       end
case 7
       if handles.FirstDice==handles.SecondDice;
            handles.F111number=0;
            handles.Scounter=handles.Scounter+1;
            handles.F111midX=handles.FinP;
            handles.F111midY=handles.YdownMid;
            handles.diff111 = abs(handles.S111number-handles.F111number);
           [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=FinalMove(hObject, handles.Whites, handles.Blacks,handles.modu ,handles.B,handles.diff111,handles.F111number,handles.S111number,handles.YupMid,handles.YdownMid,handles.S111midX,handles.S111midY,handles.F111midX,handles.F111midY,handles.Scounter);
            handles.CheckWinner=CheckWinner(handles.modu,handles.Whites,handles.Blacks);
       end  
       if handles.CheckWinner==1
           handles.FinCounter=1;
           set(handles.text2,'String','Koniec gry: Czarne wygrywaj¹');
       else
            if handles.Scounter==8
                set(handles.text5,'String','Pozosta³o 0 ruchów')  
            end
        end
end
end
guidata(hObject, handles);
% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)%META BIA£E
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~(handles.FinCounter)
switch handles.Scounter
case 1 %Pole na ktorym konczy pionek za pierwszym ruchem
        handles.Fnumber=25;
        handles.Scounter=handles.Scounter+1;
        handles.FmidX=handles.FinP;
        handles.FmidY=handles.YupMid;
        handles.diff = abs(handles.Snumber-handles.Fnumber);
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=FinalMove(hObject, handles.Whites, handles.Blacks,handles.modu,handles.A,handles.diff,handles.Fnumber,handles.Snumber,handles.YupMid,handles.YdownMid,handles.SmidX,handles.SmidY,handles.FmidX,handles.FmidY,handles.Scounter);
        handles.CheckWinner=CheckWinner(handles.modu,handles.Whites,handles.Blacks);
        if handles.CheckWinner==1
                handles.FinCounter=1;
                set(handles.text2,'String','Koniec gry: Bia³e wygrywaj¹');
        else
        if handles.Scounter==2
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 3 ruchy')
            else
                set(handles.text5,'String','Pozosta³ 1 ruch')
            end
        end
        end
case 3 %Pole na ktorym konczy pionek za drugim ruchem
        handles.F1number=25;
        handles.Scounter=handles.Scounter+1;
        handles.F1midX=handles.FinP;
        handles.F1midY=handles.YupMid;
        handles.diff1 = abs(handles.S1number-handles.F1number);
        [handles.A,handles.Whites,handles.Blacks,handles.Scounter]=FinalMove(hObject, handles.Whites, handles.Blacks,handles.modu ,handles.A,handles.diff1,handles.F1number,handles.S1number,handles.YupMid,handles.YdownMid,handles.S1midX,handles.S1midY,handles.F1midX,handles.F1midY,handles.Scounter);
        handles.CheckWinner=CheckWinner(handles.modu,handles.Whites,handles.Blacks);
        if handles.CheckWinner
            handles.FinCounter=1;
            set(handles.text2,'String','Koniec gry: Bia³e wygrywaj¹');
            
        else
        if handles.Scounter==4
            if handles.FirstDice==handles.SecondDice
                set(handles.text5,'String','Pozosta³o 2 ruchy')
            else
                set(handles.text5,'String','Pozosta³o 0 ruchów')
            end
        end
        end
case 5
       if handles.FirstDice==handles.SecondDice
            handles.F11number=25;
            handles.Scounter=handles.Scounter+1;
            handles.F11midX=handles.FinP;
            handles.F11midY=handles.YupMid;
            handles.diff11 = abs(handles.S11number-handles.F11number);
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=FinalMove(hObject, handles.Whites, handles.Blacks,handles.modu ,handles.B,handles.diff11,handles.F11number,handles.S11number,handles.YupMid,handles.YdownMid,handles.S11midX,handles.S11midY,handles.F11midX,handles.F11midY,handles.Scounter);
       end
       handles.CheckWinner=CheckWinner(handles.modu,handles.Whites,handles.Blacks);
        if handles.CheckWinner
            handles.FinCounter=1;
           set(handles.text2,'String','Koniec gry: Bia³e wygrywaj¹');
        else
            if handles.Scounter==6
                set(handles.text5,'String','Pozosta³ 1 ruch')  
            end
        end
case 7
       if handles.FirstDice==handles.SecondDice
            handles.F111number=25;
            handles.Scounter=handles.Scounter+1;
            handles.F111midX=handles.FinP;
            handles.F111midY=handles.YupMid;
            handles.diff111 = abs(handles.S111number-handles.F111number);
            [handles.B,handles.Whites,handles.Blacks,handles.Scounter]=FinalMove(hObject, handles.Whites, handles.Blacks,handles.modu ,handles.B,handles.diff111,handles.F111number,handles.S111number,handles.YupMid,handles.YdownMid,handles.S111midX,handles.S11midY,handles.F111midX,handles.F111midY,handles.Scounter);
       end  
       handles.CheckWinner=CheckWinner(handles.modu,handles.Whites,handles.Blacks);
        if handles.CheckWinner
            handles.FinCounter=1;
            set(handles.text2,'String','Koniec gry: Bia³e wygrywaj¹');
        else
            if handles.Scounter==8
                set(handles.text5,'String','Pozosta³o 0 ruchów')  
            end
        end
end
end
guidata(hObject, handles);
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1

%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~(handles.FinCounter)
A=randi(6,1,2);
handles.A=A
handles.B=A
handles.FirstDice=A(1,1)
handles.SecondDice=A(1,2)
if A(1,1)==1
    B = 'kostka/1.png';
elseif A(1,1)==2
    B = 'kostka/2.png';
elseif A(1,1)==3
    B = 'kostka/3.png';
elseif A(1,1)==4
    B = 'kostka/4.png';
elseif A(1,1)==5
    B = 'kostka/5.png';
else
    B = 'kostka/6.png';
end
  
 if A(1,2)==1
    C = 'kostka/1.png';
elseif A(1,2)==2
    C = 'kostka/2.png';
elseif A(1,2)==3
    C = 'kostka/3.png';
elseif A(1,2)==4
    C = 'kostka/4.png';
elseif A(1,2)==5
    C = 'kostka/5.png';
else
    C = 'kostka/6.png';
 end
  %handles.I to pierwsza kosc
handles.I = B;
handles.K = C;
axes(handles.axes2);
handles.counter=handles.counter+1
if handles.counter==0
    handles.Scounter=5
end
handles.Scounter=0
handles.modu=mod(handles.counter,2)
imshow(handles.I);
axes(handles.axes3);
imshow(handles.K);
handles.b=('Teraz bia³e')
handles.c=('Teraz czarne')
handles.d=('Brawo, dubel!')
handles.bd=('')
if handles.modu==1
    set(handles.text2,'String',handles.b)
else
    set(handles.text2,'String',handles.c)
end
if handles.FirstDice==handles.SecondDice
    set(handles.text3,'String',handles.d)
    set(handles.text5,'String','Pozosta³o 4 ruchy')
else
    set(handles.text3,'String',handles.bd)
    set(handles.text5,'String','Pozosta³o 2 ruchy')
end
%if handles.counter>=1
 %   if (handles.diff==handles.FirstDice) | (handles.diff==handles.SecondDice)
  %      patch([1 2 0 0],[1 2 3 5],[0 0 0])
   % end
%end
%handles.p=testfunction(handles.WhiteCounter1)
end

guidata(hObject, handles);



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


% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% --- Executes on button press in pushbutton31.
function pushbutton31_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf)
Backgammon



% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text2.
function text2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in pushbutton33.
function pushbutton33_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Zasady



% --- Executes during object creation, after setting all properties.
function text5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
