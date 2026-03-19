function varargout = din1indep(varargin)
% DIN1INDEP M-file for din1indep.fig
%      DIN1INDEP, by itself, creates a new DIN1INDEP or raises the existing
%      singleton*.
%
%      H = DIN1INDEP returns the handle to a new DIN1INDEP or the handle to
%      the existing singleton*.
%
%      DIN1INDEP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIN1INDEP.M with the given input arguments.
%
%      DIN1INDEP('Property','Value',...) creates a new DIN1INDEP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before din1indep_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to din1indep_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help din1indep

% Last Modified by GUIDE v2.5 17-Feb-2005 06:41:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @din1indep_OpeningFcn, ...
                   'gui_OutputFcn',  @din1indep_OutputFcn, ...
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


% --- Executes just before din1indep is made visible.
function din1indep_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to din1indep (see VARARGIN)

% Choose default command line output for din1indep
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes din1indep wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = din1indep_OutputFcn(hObject, eventdata, handles)
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

switch metodo
    case 1  %Forward
        if adap==1;
            k=1;
            while t(k)<tmax;
                ok=1;
                if ok==1;
                    t(k+1)=t(k)+h;
                    n(k+1)=n(k)+h*din1indep_f(t(k),r,n(k));
                    %for error estimation
                    na=n(k)+h/2*din1indep_f(t(k),r,n(k));
                    nb=na+h/2*din1indep_f(t(k),r,na);
                    error_now=2*abs(nb-n(k+1));
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
                n(k+1)=n(k)+h*din1indep_f(t(k),r,n(k));
                %for error estimation
                na=n(k)+h/2*din1indep_f(t(k),r,n(k));
                nb=na+h/2*din1indep_f(t(k),r,na);
                error_abs=error_abs+2*(abs(nb-n(k+1)));
            end
        end
    case 2  %Backward
        if adap==1;
            k=1;
            while t(k)<tmax;
                ok=1;
                if ok==1;
                    t(k+1)=t(k)+h;
                    nn=n(k);
                    error=1;
                    while error>error_max*h/tmax/10
                        J=1-r; %Bueh, llamarlo Jacobiano...
                        delta=-J\(nn-n(k)-h*din1indep_f(t(k),r,nn));
                        nn=nn+delta(1);
                        error=abs((nn-n(k)-h*din1indep_f(t(k),r,nn)));
                    end
                    n(k+1)=nn;
                    %for error estimation
                    h=h/2;
                    nna=n(k);
                    error=1;
                    while error>error_max*h/tmax/10
                        J=1-r;
                        delta=-J\(nna-n(k)-h*din1indep_f(t(k),r,nna));
                        nna=nna+delta(1);
                        error=abs(nna-n(k)-h*din1indep_f(t(k),r,nna));
                    end
                    nnb=nna;
                    error=1;
                    while error>error_max*h/tmax/10
                        J=1-r;
                        delta=-J\(nnb-nna-h*din1indep_f(t(k),r,nnb));
                        nnb=nnb+delta(1);
                        error=abs((nnb-nna-h*din1indep_f(t(k),r,nnb)));
                    end
                    h=h*2;
                    error_now=2*abs(nnb-nn);
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
                    nn=n(k);
                    error=1;
                    while error>error_max*h/tmax/10
                        J=1-r; %Bueh, llamarlo Jacobiano...
                        delta=-J\(nn-n(k)-h*din1indep_f(t(k),r,nn));
                        nn=nn+delta(1);
                        error=abs((nn-n(k)-h*din1indep_f(t(k),r,nn)));
                    end
                    n(k+1)=nn;
                    %for error estimation
                    h=h/2;
                    nna=n(k);
                    error=1;
                    while error>error_max*h/tmax/10
                        J=1-r;
                        delta=-J\(nna-n(k)-h*din1indep_f(t(k),r,nna));
                        nna=nna+delta(1);
                        error=abs((nna-n(k)-h*din1indep_f(t(k),r,nna)));
                    end
                    nnb=nna;
                    error=1;
                    while error>error_max*h/tmax/10
                        J=1-r;
                        delta=-J\(nnb-nna-h*din1indep_f(t(k),r,nnb));
                        nnb=nnb+delta(1);
                        error=abs((nnb-nna-h*din1indep_f(t(k),r,nnb)));
                    end
                error_abs=error_abs+2*abs(nnb-nn);
                h=2*h;
            end
        end
    case 3  %RK4
        if adap==1;
            k=1;
            while t(k)<tmax;
                ok=1;  
                if ok==1;
                    t(k+1)=t(k)+h;
                    delta1(1)=h*din1indep_f(t(k),r,n(k));
                    delta1(2)=h*din1indep_f(t(k)+h/2,r,n(k)+delta1(1)/2);
                    delta1(3)=h*din1indep_f(t(k)+h/2,r,n(k)+delta1(2)/2);
                    delta1(4)=h*din1indep_f(t(k)+h,r,n(k)+delta1(3));
                    n(k+1)=n(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    %for error estimation
                    h=h/2;           
                    delta1(1)=h*din1indep_f(t(k),r,n(k));
                    delta1(2)=h*din1indep_f(t(k)+h/2,r,n(k)+delta1(1)/2);
                    delta1(3)=h*din1indep_f(t(k)+h/2,r,n(k)+delta1(2)/2);
                    delta1(4)=h*din1indep_f(t(k)+h,r,n(k)+delta1(3));
                    na=n(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    delta1(1)=h*din1indep_f(t(k),r,na);
                    delta1(2)=h*din1indep_f(t(k)+h/2,r,na+delta1(1)/2);
                    delta1(3)=h*din1indep_f(t(k)+h/2,r,na+delta1(2)/2);
                    delta1(4)=h*din1indep_f(t(k)+h,r,na+delta1(3));
                    nb=na+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    error_now=16/15*(abs(nb-n(k+1)));    
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
                    delta1(1)=h*din1indep_f(t(k),r,n(k));
                    delta1(2)=h*din1indep_f(t(k)+h/2,r,n(k)+delta1(1)/2);
                    delta1(3)=h*din1indep_f(t(k)+h/2,r,n(k)+delta1(2)/2);
                    delta1(4)=h*din1indep_f(t(k)+h,r,n(k)+delta1(3));
                    n(k+1)=n(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    %for error estimation
                    h=h/2;           
                    delta1(1)=h*din1indep_f(t(k),r,n(k));
                    delta1(2)=h*din1indep_f(t(k)+h/2,r,n(k)+delta1(1)/2);
                    delta1(3)=h*din1indep_f(t(k)+h/2,r,n(k)+delta1(2)/2);
                    delta1(4)=h*din1indep_f(t(k)+h,r,n(k)+delta1(3));
                    na=n(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    delta1(1)=h*din1indep_f(t(k),r,na);
                    delta1(2)=h*din1indep_f(t(k)+h/2,r,na+delta1(1)/2);
                    delta1(3)=h*din1indep_f(t(k)+h/2,r,na+delta1(2)/2);
                    delta1(4)=h*din1indep_f(t(k)+h,r,na+delta1(3));
                    nb=na+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                h=2*h;
                error_abs=error_abs+16/15*(abs(nb-n(k+1)));
            end
        end
end

axes(handles.axes1);
plot(t,n,'bx-')
xlabel('tiempo')
ylabel('poblacion')
legend('N')
muestre=['error estimation (abs)= ',num2str(error_abs)];
set(handles.text_err,'String',muestre)

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


