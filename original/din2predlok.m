function varargout = din2predlok(varargin)
% DIN2PREDLOK M-file for din2predlok.fig
%      DIN2PREDLOK, by itself, creates a new DIN2PREDLOK or raises the existing
%      singleton*.
%
%      H = DIN2PREDLOK returns the handle to a new DIN2PREDLOK or the handle to
%      the existing singleton*.
%
%      DIN2PREDLOK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIN2PREDLOK.M with the given input arguments.
%
%      DIN2PREDLOK('Property','Value',...) creates a new DIN2PREDLOK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before din2predlok_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to din2predlok_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help din2predlok

% Last Modified by GUIDE v2.5 18-Feb-2005 10:50:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @din2predlok_OpeningFcn, ...
                   'gui_OutputFcn',  @din2predlok_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin & isstr(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before din2predlok is made visible.
function din2predlok_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to din2predlok (see VARARGIN)

% Choose default command line output for din2predlok
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes din2predlok wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.but_I,'Value',1)
ttt(1)=10;
csvwrite('rta.dat',ttt);
set(handles.text_htxt,'Visible','Off')
set(handles.text_h,'Visible','Off')
set(handles.slid_h,'Visible','Off')

% --- Outputs from this function are returned to the command line.
function varargout = din2predlok_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function text_r_Callback(hObject, eventdata, handles)
% hObject    handle to text_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = str2double(get(handles.text_r,'String'));
if  isempty(val) | (val < get(handles.slid_r,'Min')) | (val > get(handles.slid_r,'Max')),
	old_val = get(handles.slid_r,'Value');
	set(handles.text_r,'String',old_val)
else
	set(handles.slid_r,'Value',val)
end

% --- Executes during object creation, after setting all properties.
function slid_r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on slider movement.
function slid_r_Callback(hObject, eventdata, handles)
% hObject    handle to slid_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_r,'Value');
set(handles.text_r,'String',slid_val);

% --- Executes during object creation, after setting all properties.
function slid_n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on slider movement.
function slid_n_Callback(hObject, eventdata, handles)
% hObject    handle to slid_N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_n,'Value');
set(handles.text_n,'String',slid_val);

% --- Executes during object creation, after setting all properties.
function slid_t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on slider movement.
function slid_t_Callback(hObject, eventdata, handles)
% hObject    handle to slid_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_t,'Value');
set(handles.text_t,'String',slid_val);



function text_n_Callback(hObject, eventdata, handles)
% hObject    handle to text_N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_N as text
%        str2double(get(hObject,'String')) returns contents of text_N as a double
val = str2double(get(handles.text_n,'String'));
if  isempty(val) | (val < get(handles.slid_n,'Min')) | (val > get(handles.slid_n,'Max')),
	old_val = get(handles.slid_n,'Value');
	set(handles.text_n,'String',old_val)
else
	set(handles.slid_n,'Value',val)
end



function text_t_Callback(h, eventdata, handles)
% hObject    handle to text_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_t as text
%        str2double(get(hObject,'String')) returns contents of text_t as a double

val = str2double(get(h,'String'));
if  isempty(val) | (val < get(handles.slid_t,'Min')) | (val > get(handles.slid_t,'Max')),
	old_val = get(handles.slid_t,'Value');
	set(h,'String',old_val)
else
	set(handles.slid_t,'Value',val)
end


% --- Executes on button press in but_t.
function but_t_Callback(hObject, eventdata, handles)
% hObject    handle to but_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n(1)=get(handles.slid_n,'Value');
p(1)=get(handles.slid_p,'Value');
tmax=get(handles.slid_t,'Value');

r=get(handles.slid_r,'Value');
K=get(handles.slid_K,'Value');
g=get(handles.slid_g,'Value');
D=get(handles.slid_D,'Value');
q=get(handles.slid_q,'Value');

C=get(handles.slid_C,'Value');
h=get(handles.slid_h,'Value');
tipo=csvread('rta.dat');

t(1)=0; %instante inicial

params=csvread('params.dat');
metodo=params(1);
h=params(2);
hmax=h;
tol=params(3);
adap=params(4);
error_max=params(5);
notaval=0;
error_abs=0;
pasos=tmax/h; %numero de pasos

switch metodo
    case 1  %Forward
        if adap==1;
            k=1;
            while t(k)<tmax;
                ok=1;
                if ok==1;
                    t(k+1)=t(k)+h;
                    n(k+1)=n(k)+h*din2predlok_f(t(k),r,n(k),K,q,p(k),tipo,C,h);
                    p(k+1)=p(k)+h*din2predlok_g(t(k),g,p(k),D,n(k),tipo,C,h);
                    %for error estimation
                    na=n(k)+h/2*h*din2predlok_f(t(k),r,n(k),K,q,p(k),tipo,C,h);
                    pa=p(k)+h/2*din2predlok_g(t(k),g,p(k),D,n(k),tipo,C,h);
                    nb=na+h/2*din2predlok_f(t(k),r,na,K,q,pa,tipo,C,h);
                    pb=pa+h/2*din2predlok_g(t(k),g,pa,D,na,tipo,C,h);
                    error_now=abs(nb-n(k+1))+abs(pb-p(k+1));
                    if error_now>error_max*h/tmax
                        ok=0;
                        h=h/2;
                    else
                        error_abs=error_abs+error_now;
                        if error_now<1/4*error_max*h/tmax & h<hmax;
                            h=2*h;
                        end
                        k=k+1;
                    end
                end
            end
        else
            for k=1:pasos
                t(k+1)=t(k)+h;
                n(k+1)=n(k)+h*din2predlok_f(t(k),r,n(k),K,q,p(k),tipo,C,h);
                p(k+1)=p(k)+h*din2predlok_g(t(k),g,p(k),D,n(k),tipo,C,h);
                %for error estimation
                na=n(k)+h/2*h*din2predlok_f(t(k),r,n(k),K,q,p(k),tipo,C,h);
                pa=p(k)+h/2*din2predlok_g(t(k),g,p(k),D,n(k),tipo,C,h);
                nb=na+h/2*din2predlok_f(t(k),r,na,K,q,pa,tipo,C,h);
                pb=pa+h/2*din2predlok_g(t(k),g,pa,D,na,tipo,C,h);
                error_abs=error_abs+(abs(nb-n(k+1))+abs(pb-p(k+1)));
            end
        end
    case 2  %Backward
        notaval=1;
    case 3  %RK4
        if adap==1;
            k=1;
            while t(k)<tmax;
                ok=1;  
                if ok==1;
                    t(k+1)=t(k)+h;
                    delta1(1)=h*din2predlok_f(t(k),r,n(k),K,q,p(k),tipo,C,h);
                    delta2(1)=h*din2predlok_g(t(k),g,p(k),D,n(k),tipo,C,h);
                    delta1(2)=h*din2predlok_f(t(k)+h/2,r,n(k)+delta1(1)/2,K,q,p(k)+delta2(1)/2,tipo,C,h);
                    delta2(2)=h*din2predlok_g(t(k)+h/2,g,p(k)+delta2(1)/2,D,n(k)+delta1(1)/2,tipo,C,h);
                    delta1(3)=h*din2predlok_f(t(k)+h/2,r,n(k)+delta1(2)/2,K,q,p(k)+delta2(2)/2,tipo,C,h);
                    delta2(3)=h*din2predlok_g(t(k)+h/2,g,p(k)+delta2(2)/2,D,n(k)+delta1(2)/2,tipo,C,h);
                    delta1(4)=h*din2predlok_f(t(k)+h,r,n(k)+delta1(3),K,q,p(k)+delta2(3),tipo,C,h);
                    delta2(4)=h*din2predlok_g(t(k)+h,g,p(k)+delta2(3),D,n(k)+delta1(3),tipo,C,h);                 
                    n(k+1)=n(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    p(k+1)=p(k)+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
                    %for error estimation
                    h=h/2;           
                    delta1(1)=h*din2predlok_f(t(k),r,n(k),K,q,p(k),tipo,C,h);
                    delta2(1)=h*din2predlok_g(t(k),g,p(k),D,n(k),tipo,C,h);
                    delta1(2)=h*din2predlok_f(t(k)+h/2,r,n(k)+delta1(1)/2,K,q,p(k)+delta2(1)/2,tipo,C,h);
                    delta2(2)=h*din2predlok_g(t(k)+h/2,g,p(k)+delta2(1)/2,D,n(k)+delta1(1)/2,tipo,C,h);
                    delta1(3)=h*din2predlok_f(t(k)+h/2,r,n(k)+delta1(2)/2,K,q,p(k)+delta2(2)/2,tipo,C,h);
                    delta2(3)=h*din2predlok_g(t(k)+h/2,g,p(k)+delta2(2)/2,D,n(k)+delta1(2)/2,tipo,C,h);
                    delta1(4)=h*din2predlok_f(t(k)+h,r,n(k)+delta1(3),K,q,p(k)+delta2(3),tipo,C,h);
                    delta2(4)=h*din2predlok_g(t(k)+h,g,p(k)+delta2(3),D,n(k)+delta1(3),tipo,C,h);          
                    na=n(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    pa=p(k)+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
                    delta1(1)=h*din2predlok_f(t(k),r,na,K,q,pa,tipo,C,h);
                    delta2(1)=h*din2predlok_g(t(k),g,pa,D,na,tipo,C,h);
                    delta1(2)=h*din2predlok_f(t(k)+h/2,r,na+delta1(1)/2,K,q,pa+delta2(1)/2,tipo,C,h);
                    delta2(2)=h*din2predlok_g(t(k)+h/2,g,pa+delta2(1)/2,D,na+delta1(1)/2,tipo,C,h);
                    delta1(3)=h*din2predlok_f(t(k)+h/2,r,na+delta1(2)/2,K,q,pa+delta2(2)/2,tipo,C,h);
                    delta2(3)=h*din2predlok_g(t(k)+h/2,g,pa+delta2(2)/2,D,na+delta1(2)/2,tipo,C,h);
                    delta1(4)=h*din2predlok_f(t(k)+h,r,na+delta1(3),K,q,pa+delta2(3),tipo,C,h);
                    delta2(4)=h*din2predlok_g(t(k)+h,g,pa+delta2(3),D,na+delta1(3),tipo,C,h);          
                    nb=na+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    pb=pa+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));            
                    error_now=8/15*(abs(nb-n(k+1))+abs(pb-p(k+1)));    
                    h=h*2;
                    if error_now>error_max*h/tmax
                        ok=0;
                        h=h/2;
                    else
                        error_abs=error_abs+error_now;
                        if error_now<1/4*error_max*h/tmax & h<hmax;
                            h=2*h;
                        end
                        k=k+1;
                    end
                end
            end
        else
            for k=1:pasos
                t(k+1)=t(k)+h;
                    delta1(1)=h*din2predlok_f(t(k),r,n(k),K,q,p(k),tipo,C,h);
                    delta2(1)=h*din2predlok_g(t(k),g,p(k),D,n(k),tipo,C,h);
                    delta1(2)=h*din2predlok_f(t(k)+h/2,r,n(k)+delta1(1)/2,K,q,p(k)+delta2(1)/2,tipo,C,h);
                    delta2(2)=h*din2predlok_g(t(k)+h/2,g,p(k)+delta2(1)/2,D,n(k)+delta1(1)/2,tipo,C,h);
                    delta1(3)=h*din2predlok_f(t(k)+h/2,r,n(k)+delta1(2)/2,K,q,p(k)+delta2(2)/2,tipo,C,h);
                    delta2(3)=h*din2predlok_g(t(k)+h/2,g,p(k)+delta2(2)/2,D,n(k)+delta1(2)/2,tipo,C,h);
                    delta1(4)=h*din2predlok_f(t(k)+h,r,n(k)+delta1(3),K,q,p(k)+delta2(3),tipo,C,h);
                    delta2(4)=h*din2predlok_g(t(k)+h,g,p(k)+delta2(3),D,n(k)+delta1(3),tipo,C,h);                 
                    n(k+1)=n(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    p(k+1)=p(k)+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
                    %for error estimation
                    h=h/2;           
                    delta1(1)=h*din2predlok_f(t(k),r,n(k),K,q,p(k),tipo,C,h);
                    delta2(1)=h*din2predlok_g(t(k),g,p(k),D,n(k),tipo,C,h);
                    delta1(2)=h*din2predlok_f(t(k)+h/2,r,n(k)+delta1(1)/2,K,q,p(k)+delta2(1)/2,tipo,C,h);
                    delta2(2)=h*din2predlok_g(t(k)+h/2,g,p(k)+delta2(1)/2,D,n(k)+delta1(1)/2,tipo,C,h);
                    delta1(3)=h*din2predlok_f(t(k)+h/2,r,n(k)+delta1(2)/2,K,q,p(k)+delta2(2)/2,tipo,C,h);
                    delta2(3)=h*din2predlok_g(t(k)+h/2,g,p(k)+delta2(2)/2,D,n(k)+delta1(2)/2,tipo,C,h);
                    delta1(4)=h*din2predlok_f(t(k)+h,r,n(k)+delta1(3),K,q,p(k)+delta2(3),tipo,C,h);
                    delta2(4)=h*din2predlok_g(t(k)+h,g,p(k)+delta2(3),D,n(k)+delta1(3),tipo,C,h);          
                    na=n(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    pa=p(k)+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
                    delta1(1)=h*din2predlok_f(t(k),r,na,K,q,pa,tipo,C,h);
                    delta2(1)=h*din2predlok_g(t(k),g,pa,D,na,tipo,C,h);
                    delta1(2)=h*din2predlok_f(t(k)+h/2,r,na+delta1(1)/2,K,q,pa+delta2(1)/2,tipo,C,h);
                    delta2(2)=h*din2predlok_g(t(k)+h/2,g,pa+delta2(1)/2,D,na+delta1(1)/2,tipo,C,h);
                    delta1(3)=h*din2predlok_f(t(k)+h/2,r,na+delta1(2)/2,K,q,pa+delta2(2)/2,tipo,C,h);
                    delta2(3)=h*din2predlok_g(t(k)+h/2,g,pa+delta2(2)/2,D,na+delta1(2)/2,tipo,C,h);
                    delta1(4)=h*din2predlok_f(t(k)+h,r,na+delta1(3),K,q,pa+delta2(3),tipo,C,h);
                    delta2(4)=h*din2predlok_g(t(k)+h,g,pa+delta2(3),D,na+delta1(3),tipo,C,h);          
                    nb=na+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    pb=pa+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
                    
                    h=2*h;
                    error_abs=error_abs+8/15*(abs(nb-n(k+1))+abs(pb-p(k+1)));
            end
        end
end

ymax=get(handles.slid_ymax,'Value');
axes(handles.axes1)
plot(t,n,'bx-',t,p,'rx-')
set(handles.axes1,'YLim',[0 ymax])
xlabel('Tiempo')
ylabel('Poblacion')
legend('N','P')

if notaval==0
    muestre=['error estimation (abs)= ',num2str(error_abs)];
    set(handles.text_err,'String',muestre)
else
    set(handles.text_err,'String','Not available (that is... no programe esta opcion)')
end

% --- Executes during object creation, after setting all properties.
function text_r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes during object creation, after setting all properties.
function text_n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes during object creation, after setting all properties.
function text_t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.

function text_q_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function text_q_Callback(hObject, eventdata, handles)
% hObject    handle to text_q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_q as text
%        str2double(get(hObject,'String')) returns contents of text_q as a double
val = str2double(get(handles.text_q,'String'));
if  isempty(val) | (val < get(handles.slid_q,'Min')) | (val > get(handles.slid_q,'Max')),
	old_val = get(handles.slid_q,'Value');
	set(handles.text_q,'String',old_val)
else
	set(handles.slid_q,'Value',val)
end


% --- Executes during object creation, after setting all properties.
function slid_q_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on slider movement.
function slid_q_Callback(hObject, eventdata, handles)
% hObject    handle to slid_q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_q,'Value');
set(handles.text_q,'String',slid_val);


% --- Executes during object creation, after setting all properties.
function text_K_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_K (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function text_K_Callback(hObject, eventdata, handles)
% hObject    handle to text_K (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_K as text
%        str2double(get(hObject,'String')) returns contents of text_K as a double
val = str2double(get(handles.text_K,'String'));
if  isempty(val) | (val < get(handles.slid_K,'Min')) | (val > get(handles.slid_K,'Max')),
	old_val = get(handles.slid_K,'Value');
	set(handles.text_K,'String',old_val)
else
	set(handles.slid_K,'Value',val)
end

% --- Executes during object creation, after setting all properties.
function slid_K_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_K (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on slider movement.
function slid_K_Callback(hObject, eventdata, handles)
% hObject    handle to slid_K (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_K,'Value');
set(handles.text_K,'String',slid_val);


% --- Executes during object creation, after setting all properties.
function text_g_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function text_g_Callback(hObject, eventdata, handles)
% hObject    handle to text_g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_g as text
%        str2double(get(hObject,'String')) returns contents of text_g as a double


% --- Executes during object creation, after setting all properties.
function slid_g_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on slider movement.
function slid_g_Callback(hObject, eventdata, handles)
% hObject    handle to slid_g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_g,'Value');
set(handles.text_g,'String',slid_val);

% --- Executes during object creation, after setting all properties.
function text_D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function text_D_Callback(hObject, eventdata, handles)
% hObject    handle to text_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_D as text
%        str2double(get(hObject,'String')) returns contents of text_D as a double
val = str2double(get(handles.text_D,'String'));
if  isempty(val) | (val < get(handles.slid_D,'Min')) | (val > get(handles.slid_D,'Max')),
	old_val = get(handles.slid_D,'Value');
	set(handles.text_D,'String',old_val)
else
	set(handles.slid_D,'Value',val)
end

% --- Executes during object creation, after setting all properties.
function slid_D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on slider movement.
function slid_D_Callback(hObject, eventdata, handles)
% hObject    handle to slid_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_D,'Value');
set(handles.text_D,'String',slid_val);

% --- Executes during object creation, after setting all properties.
function text_h_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function text_h_Callback(hObject, eventdata, handles)
% hObject    handle to text_h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_h as text
%        str2double(get(hObject,'String')) returns contents of text_h as a double
val = str2double(get(handles.text_h,'String'));
if  isempty(val) | (val < get(handles.slid_h,'Min')) | (val > get(handles.slid_h,'Max')),
	old_val = get(handles.slid_h,'Value');
	set(handles.text_h,'String',old_val)
else
	set(handles.slid_h,'Value',val)
end

% --- Executes during object creation, after setting all properties.
function slid_h_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on slider movement.
function slid_h_Callback(hObject, eventdata, handles)
% hObject    handle to slid_h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_h,'Value');
set(handles.text_h,'String',slid_val);

% --- Executes during object creation, after setting all properties.
function text_p_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function text_p_Callback(hObject, eventdata, handles)
% hObject    handle to text_P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_P as text
%        str2double(get(hObject,'String')) returns contents of text_P as a double
val = str2double(get(handles.text_p,'String'));
if  isempty(val) | (val < get(handles.slid_p,'Min')) | (val > get(handles.slid_p,'Max')),
	old_val = get(handles.slid_p,'Value');
	set(handles.text_p,'String',old_val)
else
	set(handles.slid_p,'Value',val)
end

% --- Executes during object creation, after setting all properties.
function slid_p_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on slider movement.
function slid_p_Callback(hObject, eventdata, handles)
% hObject    handle to slid_P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_p,'Value');
set(handles.text_p,'String',slid_val);


% --- Executes on button press in but_phase.
function but_phase_Callback(hObject, eventdata, handles)
% hObject    handle to but_phase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n(1)=get(handles.slid_n,'Value');
p(1)=get(handles.slid_p,'Value');
tmax=get(handles.slid_t,'Value');

r=get(handles.slid_r,'Value');
K=get(handles.slid_K,'Value');
g=get(handles.slid_g,'Value');
D=get(handles.slid_D,'Value');
q=get(handles.slid_q,'Value');

C=get(handles.slid_C,'Value');
h=get(handles.slid_h,'Value');
tipo=csvread('rta.dat');

t(1)=0; %instante inicial

params=csvread('params.dat');
metodo=params(1);
h=params(2);
hmax=h;
tol=params(3);
adap=params(4);
error_max=params(5);
notaval=0;
error_abs=0;
pasos=tmax/h; %numero de pasos

switch metodo
    case 1  %Forward
        if adap==1;
            k=1;
            while t(k)<tmax;
                ok=1;
                if ok==1;
                    t(k+1)=t(k)+h;
                    n(k+1)=n(k)+h*din2predlok_f(t(k),r,n(k),K,q,p(k),tipo,C,h);
                    p(k+1)=p(k)+h*din2predlok_g(t(k),g,p(k),D,n(k),tipo,C,h);
                    %for error estimation
                    na=n(k)+h/2*h*din2predlok_f(t(k),r,n(k),K,q,p(k),tipo,C,h);
                    pa=p(k)+h/2*din2predlok_g(t(k),g,p(k),D,n(k),tipo,C,h);
                    nb=na+h/2*din2predlok_f(t(k),r,na,K,q,pa,tipo,C,h);
                    pb=pa+h/2*din2predlok_g(t(k),g,pa,D,na,tipo,C,h);
                    error_now=abs(nb-n(k+1))+abs(pb-p(k+1));
                    if error_now>error_max*h/tmax
                        ok=0;
                        h=h/2;
                    else
                        error_abs=error_abs+error_now;
                        if error_now<1/4*error_max*h/tmax & h<hmax;
                            h=2*h;
                        end
                        k=k+1;
                    end
                end
            end
        else
            for k=1:pasos
                t(k+1)=t(k)+h;
                n(k+1)=n(k)+h*din2predlok_f(t(k),r,n(k),K,q,p(k),tipo,C,h);
                p(k+1)=p(k)+h*din2predlok_g(t(k),g,p(k),D,n(k),tipo,C,h);
                %for error estimation
                na=n(k)+h/2*h*din2predlok_f(t(k),r,n(k),K,q,p(k),tipo,C,h);
                pa=p(k)+h/2*din2predlok_g(t(k),g,p(k),D,n(k),tipo,C,h);
                nb=na+h/2*din2predlok_f(t(k),r,na,K,q,pa,tipo,C,h);
                pb=pa+h/2*din2predlok_g(t(k),g,pa,D,na,tipo,C,h);
                error_abs=error_abs+(abs(nb-n(k+1))+abs(pb-p(k+1)));
            end
        end
    case 2  %Backward
        notaval=1;
    case 3  %RK4
        if adap==1;
            k=1;
            while t(k)<tmax;
                ok=1;  
                if ok==1;
                    t(k+1)=t(k)+h;
                    delta1(1)=h*din2predlok_f(t(k),r,n(k),K,q,p(k),tipo,C,h);
                    delta2(1)=h*din2predlok_g(t(k),g,p(k),D,n(k),tipo,C,h);
                    delta1(2)=h*din2predlok_f(t(k)+h/2,r,n(k)+delta1(1)/2,K,q,p(k)+delta2(1)/2,tipo,C,h);
                    delta2(2)=h*din2predlok_g(t(k)+h/2,g,p(k)+delta2(1)/2,D,n(k)+delta1(1)/2,tipo,C,h);
                    delta1(3)=h*din2predlok_f(t(k)+h/2,r,n(k)+delta1(2)/2,K,q,p(k)+delta2(2)/2,tipo,C,h);
                    delta2(3)=h*din2predlok_g(t(k)+h/2,g,p(k)+delta2(2)/2,D,n(k)+delta1(2)/2,tipo,C,h);
                    delta1(4)=h*din2predlok_f(t(k)+h,r,n(k)+delta1(3),K,q,p(k)+delta2(3),tipo,C,h);
                    delta2(4)=h*din2predlok_g(t(k)+h,g,p(k)+delta2(3),D,n(k)+delta1(3),tipo,C,h);                 
                    n(k+1)=n(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    p(k+1)=p(k)+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
                    %for error estimation
                    h=h/2;           
                    delta1(1)=h*din2predlok_f(t(k),r,n(k),K,q,p(k),tipo,C,h);
                    delta2(1)=h*din2predlok_g(t(k),g,p(k),D,n(k),tipo,C,h);
                    delta1(2)=h*din2predlok_f(t(k)+h/2,r,n(k)+delta1(1)/2,K,q,p(k)+delta2(1)/2,tipo,C,h);
                    delta2(2)=h*din2predlok_g(t(k)+h/2,g,p(k)+delta2(1)/2,D,n(k)+delta1(1)/2,tipo,C,h);
                    delta1(3)=h*din2predlok_f(t(k)+h/2,r,n(k)+delta1(2)/2,K,q,p(k)+delta2(2)/2,tipo,C,h);
                    delta2(3)=h*din2predlok_g(t(k)+h/2,g,p(k)+delta2(2)/2,D,n(k)+delta1(2)/2,tipo,C,h);
                    delta1(4)=h*din2predlok_f(t(k)+h,r,n(k)+delta1(3),K,q,p(k)+delta2(3),tipo,C,h);
                    delta2(4)=h*din2predlok_g(t(k)+h,g,p(k)+delta2(3),D,n(k)+delta1(3),tipo,C,h);          
                    na=n(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    pa=p(k)+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
                    delta1(1)=h*din2predlok_f(t(k),r,na,K,q,pa,tipo,C,h);
                    delta2(1)=h*din2predlok_g(t(k),g,pa,D,na,tipo,C,h);
                    delta1(2)=h*din2predlok_f(t(k)+h/2,r,na+delta1(1)/2,K,q,pa+delta2(1)/2,tipo,C,h);
                    delta2(2)=h*din2predlok_g(t(k)+h/2,g,pa+delta2(1)/2,D,na+delta1(1)/2,tipo,C,h);
                    delta1(3)=h*din2predlok_f(t(k)+h/2,r,na+delta1(2)/2,K,q,pa+delta2(2)/2,tipo,C,h);
                    delta2(3)=h*din2predlok_g(t(k)+h/2,g,pa+delta2(2)/2,D,na+delta1(2)/2,tipo,C,h);
                    delta1(4)=h*din2predlok_f(t(k)+h,r,na+delta1(3),K,q,pa+delta2(3),tipo,C,h);
                    delta2(4)=h*din2predlok_g(t(k)+h,g,pa+delta2(3),D,na+delta1(3),tipo,C,h);          
                    nb=na+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    pb=pa+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));            
                    error_now=8/15*(abs(nb-n(k+1))+abs(pb-p(k+1)));    
                    h=h*2;
                    if error_now>error_max*h/tmax
                        ok=0;
                        h=h/2;
                    else
                        error_abs=error_abs+error_now;
                        if error_now<1/4*error_max*h/tmax & h<hmax;
                            h=2*h;
                        end
                        k=k+1;
                    end
                end
            end
        else
            for k=1:pasos
                t(k+1)=t(k)+h;
                    delta1(1)=h*din2predlok_f(t(k),r,n(k),K,q,p(k),tipo,C,h);
                    delta2(1)=h*din2predlok_g(t(k),g,p(k),D,n(k),tipo,C,h);
                    delta1(2)=h*din2predlok_f(t(k)+h/2,r,n(k)+delta1(1)/2,K,q,p(k)+delta2(1)/2,tipo,C,h);
                    delta2(2)=h*din2predlok_g(t(k)+h/2,g,p(k)+delta2(1)/2,D,n(k)+delta1(1)/2,tipo,C,h);
                    delta1(3)=h*din2predlok_f(t(k)+h/2,r,n(k)+delta1(2)/2,K,q,p(k)+delta2(2)/2,tipo,C,h);
                    delta2(3)=h*din2predlok_g(t(k)+h/2,g,p(k)+delta2(2)/2,D,n(k)+delta1(2)/2,tipo,C,h);
                    delta1(4)=h*din2predlok_f(t(k)+h,r,n(k)+delta1(3),K,q,p(k)+delta2(3),tipo,C,h);
                    delta2(4)=h*din2predlok_g(t(k)+h,g,p(k)+delta2(3),D,n(k)+delta1(3),tipo,C,h);                 
                    n(k+1)=n(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    p(k+1)=p(k)+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
                    %for error estimation
                    h=h/2;           
                    delta1(1)=h*din2predlok_f(t(k),r,n(k),K,q,p(k),tipo,C,h);
                    delta2(1)=h*din2predlok_g(t(k),g,p(k),D,n(k),tipo,C,h);
                    delta1(2)=h*din2predlok_f(t(k)+h/2,r,n(k)+delta1(1)/2,K,q,p(k)+delta2(1)/2,tipo,C,h);
                    delta2(2)=h*din2predlok_g(t(k)+h/2,g,p(k)+delta2(1)/2,D,n(k)+delta1(1)/2,tipo,C,h);
                    delta1(3)=h*din2predlok_f(t(k)+h/2,r,n(k)+delta1(2)/2,K,q,p(k)+delta2(2)/2,tipo,C,h);
                    delta2(3)=h*din2predlok_g(t(k)+h/2,g,p(k)+delta2(2)/2,D,n(k)+delta1(2)/2,tipo,C,h);
                    delta1(4)=h*din2predlok_f(t(k)+h,r,n(k)+delta1(3),K,q,p(k)+delta2(3),tipo,C,h);
                    delta2(4)=h*din2predlok_g(t(k)+h,g,p(k)+delta2(3),D,n(k)+delta1(3),tipo,C,h);          
                    na=n(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    pa=p(k)+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
                    delta1(1)=h*din2predlok_f(t(k),r,na,K,q,pa,tipo,C,h);
                    delta2(1)=h*din2predlok_g(t(k),g,pa,D,na,tipo,C,h);
                    delta1(2)=h*din2predlok_f(t(k)+h/2,r,na+delta1(1)/2,K,q,pa+delta2(1)/2,tipo,C,h);
                    delta2(2)=h*din2predlok_g(t(k)+h/2,g,pa+delta2(1)/2,D,na+delta1(1)/2,tipo,C,h);
                    delta1(3)=h*din2predlok_f(t(k)+h/2,r,na+delta1(2)/2,K,q,pa+delta2(2)/2,tipo,C,h);
                    delta2(3)=h*din2predlok_g(t(k)+h/2,g,pa+delta2(2)/2,D,na+delta1(2)/2,tipo,C,h);
                    delta1(4)=h*din2predlok_f(t(k)+h,r,na+delta1(3),K,q,pa+delta2(3),tipo,C,h);
                    delta2(4)=h*din2predlok_g(t(k)+h,g,pa+delta2(3),D,na+delta1(3),tipo,C,h);          
                    nb=na+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    pb=pa+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
                    
                    h=2*h;
                    error_abs=error_abs+8/15*(abs(nb-n(k+1))+abs(pb-p(k+1)));
            end
        end
end

ymax=get(handles.slid_ymax,'Value');
axes(handles.axes1);
plot(n,p,'kx-')
set(handles.axes1,'XLim',[0 ymax],'YLim',[0 ymax])
xlabel('poblacion N')
ylabel('poblacion P')
legend('Trayectoria')
hold on

switch tipo
    case 10
        iso1x=[D/C,D/C];
        iso1y=[0,ymax];
        line(iso1x,iso1y,'Color',[1 0 0],'LineStyle','--','LineWidth',[2])
        niso=0:ymax;
        piso=-((niso./K).^q-1).*r./C;
        plot(niso,piso,'b--','LineWidth',[2])
    case 20
        iso1x=[D/C*1/(1-h*D),D/C*1/(1-h*D)];
        iso1y=[0,ymax];
        line(iso1x,iso1y,'Color',[1 0 0],'LineStyle','--','LineWidth',[2])
        niso=0:ymax;
        piso=-((niso./K).^q-1).*r./C.*(C.*h.*niso+1);
        plot(niso,piso,'b--','LineWidth',[2])
    case 30
        iso1x=[sqrt(D/C*1/(1-h*D)),sqrt(D/C*1/(1-h*D))];
        iso1y=[0,ymax];
        line(iso1x,iso1y,'Color',[1 0 0],'LineStyle','--','LineWidth',[2])
        niso=0:ymax;
        piso=-((niso./K).^q-1).*r./(C.*niso).*(C.*h.*niso.^2+1);
        plot(niso,piso,'b--','LineWidth',[2])
end
if notaval==0
    muestre=['error estimation (abs)= ',num2str(error_abs)];
    set(handles.text_err,'String',muestre)
else
    set(handles.text_err,'String','Not available (that is... no programe esta opcion)')
end
hold off

function mutual_exclude(off)
set(off,'Value',0)

% --- Executes on button press in but_I.
function but_I_Callback(hObject, eventdata, handles)
% hObject    handle to but_I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of but_I
off = [handles.but_II,handles.but_III];
mutual_exclude(off)
set(handles.but_I,'Value',1)
ttt(1)=10;
csvwrite('rta.dat',ttt);
set(handles.text_htxt,'Visible','Off')
set(handles.text_h,'Visible','Off')
set(handles.slid_h,'Visible','Off')

% --- Executes on button press in but_II.
function but_II_Callback(hObject, eventdata, handles)
% hObject    handle to but_II (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of but_II
off = [handles.but_I,handles.but_III];
mutual_exclude(off)
set(handles.but_II,'Value',1)
ttt(1)=20;
csvwrite('rta.dat',ttt);
set(handles.text_htxt,'Visible','On')
set(handles.text_h,'Visible','On')
set(handles.slid_h,'Visible','On')

% --- Executes on button press in but_III.
function but_III_Callback(hObject, eventdata, handles)
% hObject    handle to but_III (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of but_III
off = [handles.but_I,handles.but_II];
mutual_exclude(off)
set(handles.but_III,'Value',1)
ttt(1)=30;
csvwrite('rta.dat',ttt);
set(handles.text_htxt,'Visible','On')
set(handles.text_h,'Visible','On')
set(handles.slid_h,'Visible','On')

% --- Executes during object creation, after setting all properties.
function text_C_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function text_C_Callback(hObject, eventdata, handles)
% hObject    handle to text_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_C as text
%        str2double(get(hObject,'String')) returns contents of text_C as a double
val = str2double(get(handles.text_C,'String'));
if  isempty(val) | (val < get(handles.slid_C,'Min')) | (val > get(handles.slid_C,'Max')),
	old_val = get(handles.slid_C,'Value');
	set(handles.text_C,'String',old_val)
else
	set(handles.slid_C,'Value',val)
end

% --- Executes during object creation, after setting all properties.
function slid_C_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on slider movement.
function slid_C_Callback(hObject, eventdata, handles)
% hObject    handle to slid_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

slid_val=get(handles.slid_C,'Value');
set(handles.text_C,'String',slid_val);


% --- Executes during object creation, after setting all properties.
function text_err_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_err (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function text_err_Callback(hObject, eventdata, handles)
% hObject    handle to text_err (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_err as text
%        str2double(get(hObject,'String')) returns contents of text_err as a double


% --- Executes during object creation, after setting all properties.



function text_ymax_Callback(hObject, eventdata, handles)
% hObject    handle to text_ymax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_ymax as text
%        str2double(get(hObject,'String')) returns contents of text_ymax as a double
val = str2double(get(handles.text_ymax,'String'));
if  isempty(val) | (val < get(handles.slid_ymax,'Min')) | (val > get(handles.slid_ymax,'Max')),
	old_val = get(handles.slid_ymax,'Value');
	set(handles.text_ymax,'String',old_val)
else
	set(handles.slid_ymax,'Value',val)
end

% --- Executes during object creation, after setting all properties.
function text_ymax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_ymax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on slider movement.
function slid_ymax_Callback(hObject, eventdata, handles)
% hObject    handle to slid_ymax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_ymax,'Value');
set(handles.text_ymax,'String',slid_val);

% --- Executes during object creation, after setting all properties.
function slid_ymax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_ymax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


