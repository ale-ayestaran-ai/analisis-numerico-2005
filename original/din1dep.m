function varargout = din1dep(varargin)
% DIN1DEP M-file for din1dep.fig
%      DIN1DEP, by itself, creates a new DIN1DEP or raises the existing
%      singleton*.
%
%      H = DIN1DEP returns the handle to a new DIN1DEP or the handle to
%      the existing singleton*.
%
%      DIN1DEP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIN1DEP.M with the given input arguments.
%
%      DIN1DEP('Property','Value',...) creates a new DIN1DEP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before din1dep_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to din1dep_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help din1dep

% Last Modified by GUIDE v2.5 17-Feb-2005 12:33:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @din1dep_OpeningFcn, ...
                   'gui_OutputFcn',  @din1dep_OutputFcn, ...
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


% --- Executes just before din1dep is made visible.
function din1dep_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to din1dep (see VARARGIN)

% Choose default command line output for din1dep
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes din1dep wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = din1dep_OutputFcn(hObject, eventdata, handles)
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
function slid_ci_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_ci (see GCBO)
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
function slid_ci_Callback(hObject, eventdata, handles)
% hObject    handle to slid_ci (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_ci,'Value');
set(handles.text_ci,'String',slid_val);

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



function text_ci_Callback(hObject, eventdata, handles)
% hObject    handle to text_ci (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_ci as text
%        str2double(get(hObject,'String')) returns contents of text_ci as a double
val = str2double(get(handles.text_ci,'String'));
if  isempty(val) | (val < get(handles.slid_ci,'Min')) | (val > get(handles.slid_ci,'Max')),
	old_val = get(handles.slid_ci,'Value');
	set(handles.text_ci,'String',old_val)
else
	set(handles.slid_ci,'Value',val)
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


% --- Executes on button press in but_graf.
function but_graf_Callback(hObject, eventdata, handles)
% hObject    handle to but_graf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n(1)=get(handles.slid_ci,'Value');
tmax=get(handles.slid_t,'Value');
r=get(handles.slid_r,'Value');
K=get(handles.slid_K,'Value');
tau=get(handles.slid_tau,'Value');

t(1)=0; %instante inicial
params=csvread('params.dat');
metodo=params(1);
h=params(2);
hmax=h;
tol=params(3);
adap=params(4);
error_max=params(5);
error_abs=0;
            
pasos=tmax/h; %numero de pasos
listo=0;
notaval=0;

switch metodo
    case 1  %Forward
        if adap==1;
            notaval=1;
        else
            for k=1:pasos
                t(k+1)=t(k)+h;
                    if t<tau   
                       n(k+1)=n(k)+h*din1dep_f(t(k),r,K,n(k),n(1));
                       %for error estimation
                       na=n(k)+h/2*din1dep_f(t(k),r,K,n(k),n(1));
                       nb=na+h/2*din1dep_f(t(k),r,K,na,n(1));
                       error_abs=error_abs+2*(abs(nb-n(k+1)));
                   else
                       if listo==0;
                           k0=k-1;
                           listo=1;
                       end
                       n(k+1)=n(k)+h*din1dep_f(t(k),r,K,n(k),n(k-k0));
                       %for error estimation
                       na=n(k)+h/2*din1dep_f(t(k),r,K,n(k),n(k-k0));
                       nb=na+h/2*din1dep_f(t(k),r,K,na,n(k-k0));
                       error_abs=error_abs+2*(abs(nb-n(k+1)));
                   end
            end
        end
    case 2  %Backward
        notaval=1;
    case 3  %RK4
        if adap==1;
            notaval=1;
        else
            for k=1:pasos
                t(k+1)=t(k)+h;
                    if t<tau
                        delta1(1)=h*din1dep_f(t(k),r,K,n(k),n(1));
                        delta1(2)=h*din1dep_f(t(k)+h/2,r,K,n(k)+delta1(1)/2,n(1)+delta1(1)/2);
                        delta1(3)=h*din1dep_f(t(k)+h/2,r,K,n(k)+delta1(2)/2,n(1)+delta1(2)/2);
                        delta1(4)=h*din1dep_f(t(k)+h,r,K,n(k)+delta1(3),n(1)+delta1(3));
                        n(k+1)=n(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                        %for error estimation
                        h=h/2;           
                        delta1(1)=h*din1dep_f(t(k),r,K,n(k),n(1));
                        delta1(2)=h*din1dep_f(t(k)+h/2,r,K,n(k)+delta1(1)/2,n(1)+delta1(1)/2);
                        delta1(3)=h*din1dep_f(t(k)+h/2,r,K,n(k)+delta1(2)/2,n(1)+delta1(2)/2);
                        delta1(4)=h*din1dep_f(t(k)+h,r,K,n(k)+delta1(3),n(1)+delta1(3));
                        na=n(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                        delta1(1)=h*din1dep_f(t(k),r,K,na,n(1));
                        delta1(2)=h*din1dep_f(t(k)+h/2,r,K,na+delta1(1)/2,n(1)+delta1(1)/2+na-n(k));
                        delta1(3)=h*din1dep_f(t(k)+h/2,r,K,na+delta1(2)/2,n(1)+delta1(2)/2+na-n(k));
                        delta1(4)=h*din1dep_f(t(k)+h,r,K,na+delta1(3),n(1)+delta1(3)+na-n(k));
                        nb=na+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                        error_abs=error_abs+16/15*(abs(nb-n(k+1)));    
                        h=h*2;
                    else
                        if listo==0;
                           k0=k-1;
                           listo=1;
                        end
                        delta1(1)=h*din1dep_f(t(k),r,K,n(k),n(k-k0));
                        delta1(2)=h*din1dep_f(t(k)+h/2,r,K,n(k)+delta1(1)/2,n(k-k0)+delta1(1)/2);
                        delta1(3)=h*din1dep_f(t(k)+h/2,r,K,n(k)+delta1(2)/2,n(k-k0)+delta1(2)/2);
                        delta1(4)=h*din1dep_f(t(k)+h,r,K,n(k)+delta1(3),n(k-k0)+delta1(3));
                        n(k+1)=n(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                        %for error estimation
                        h=h/2;           
                        delta1(1)=h*din1dep_f(t(k),r,K,n(k),n(k-k0));
                        delta1(2)=h*din1dep_f(t(k)+h/2,r,K,n(k)+delta1(1)/2,n(k-k0)+delta1(1)/2);
                        delta1(3)=h*din1dep_f(t(k)+h/2,r,K,n(k)+delta1(2)/2,n(k-k0)+delta1(2)/2);
                        delta1(4)=h*din1dep_f(t(k)+h,r,K,n(k)+delta1(3),n(k-k0)+delta1(3));
                        na=n(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                        delta1(1)=h*din1dep_f(t(k),r,K,na,n(k-k0));
                        delta1(2)=h*din1dep_f(t(k)+h/2,r,K,na+delta1(1)/2,n(k-k0)+delta1(1)/2+na-n(k));
                        delta1(3)=h*din1dep_f(t(k)+h/2,r,K,na+delta1(2)/2,n(k-k0)+delta1(2)/2+na-n(k));
                        delta1(4)=h*din1dep_f(t(k)+h,r,K,na+delta1(3),n(k-k0)+delta1(3)+na-n(k));
                        nb=na+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                        error_abs=error_abs+16/15*(abs(nb-n(k+1)));    
                        h=h*2;
                    end
            end
        end
end

axes(handles.axes1);
plot(t,n,'bx-')
xlabel('tiempo')
ylabel('poblacion')
legend('N')
set(handles.axes1,'YLim',[0 300])

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
function text_ci_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_ci (see GCBO)
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

function text_tau_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_tau (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function text_tau_Callback(hObject, eventdata, handles)
% hObject    handle to text_tau (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_tau as text
%        str2double(get(hObject,'String')) returns contents of text_tau as a double
val = str2double(get(handles.text_tau,'String'));
if  isempty(val) | (val < get(handles.slid_tau,'Min')) | (val > get(handles.slid_tau,'Max')),
	old_val = get(handles.slid_tau,'Value');
	set(handles.text_tau,'String',old_val)
else
	set(handles.slid_tau,'Value',val)
end


% --- Executes during object creation, after setting all properties.
function slid_tau_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_tau (see GCBO)
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
function slid_tau_Callback(hObject, eventdata, handles)
% hObject    handle to slid_tau (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_tau,'Value');
set(handles.text_tau,'String',slid_val);


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


