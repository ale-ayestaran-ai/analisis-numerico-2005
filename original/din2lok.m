function varargout = din2lok(varargin)
% DIN2LOK M-file for din2lok.fig
%      DIN2LOK, by itself, creates a new DIN2LOK or raises the existing
%      singleton*.
%
%      H = DIN2LOK returns the handle to a new DIN2LOK or the handle to
%      the existing singleton*.
%
%      DIN2LOK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIN2LOK.M with the given input arguments.
%
%      DIN2LOK('Property','Value',...) creates a new DIN2LOK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before din2lok_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to din2lok_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help din2lok

% Last Modified by GUIDE v2.5 17-Feb-2005 01:18:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @din2lok_OpeningFcn, ...
                   'gui_OutputFcn',  @din2lok_OutputFcn, ...
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


% --- Executes just before din2lok is made visible.
function din2lok_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to din2lok (see VARARGIN)

% Choose default command line output for din2lok
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes din2lok wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = din2lok_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function text_r1_Callback(hObject, eventdata, handles)
% hObject    handle to text_r1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = str2double(get(handles.text_r1,'String'));
if  isempty(val) | (val < get(handles.slid_r1,'Min')) | (val > get(handles.slid_r1,'Max')),
	old_val = get(handles.slid_r1,'Value');
	set(handles.text_r1,'String',old_val)
else
	set(handles.slid_r1,'Value',val)
end

% --- Executes during object creation, after setting all properties.
function slid_r1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_r1 (see GCBO)
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
function slid_r1_Callback(hObject, eventdata, handles)
% hObject    handle to slid_r1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_r1,'Value');
set(handles.text_r1,'String',slid_val);

% --- Executes during object creation, after setting all properties.
function slid_n1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_n1 (see GCBO)
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
function slid_n1_Callback(hObject, eventdata, handles)
% hObject    handle to slid_n1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_n1,'Value');
set(handles.text_n1,'String',slid_val);

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



function text_n1_Callback(hObject, eventdata, handles)
% hObject    handle to text_n1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_n1 as text
%        str2double(get(hObject,'String')) returns contents of text_n1 as a double
val = str2double(get(handles.text_n1,'String'));
if  isempty(val) | (val < get(handles.slid_n1,'Min')) | (val > get(handles.slid_n1,'Max')),
	old_val = get(handles.slid_n1,'Value');
	set(handles.text_n1,'String',old_val)
else
	set(handles.slid_n1,'Value',val)
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

n1(1)=get(handles.slid_n1,'Value');
n2(1)=get(handles.slid_n2,'Value');
tmax=get(handles.slid_t,'Value');
r1=get(handles.slid_r1,'Value');
K1=get(handles.slid_K1,'Value');
r2=get(handles.slid_r2,'Value');
K2=get(handles.slid_K2,'Value');
a=get(handles.slid_a,'Value');
b=get(handles.slid_b,'Value');

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
                    n1(k+1)=n1(k)+h*din2lok_f(t(k),r1,K1,n1(k),a,n2(k));
                    n2(k+1)=n2(k)+h*din2lok_g(t(k),r2,K2,n2(k),b,n1(k));
                    %for error estimation
                    n1a=n1(k)+h/2*din2lok_f(t(k),r1,K1,n1(k),a,n2(k));
                    n2a=n2(k)+h/2*din2lok_g(t(k),r2,K2,n2(k),b,n1(k));
                    n1b=n1a+h/2*din2lok_f(t(k),r1,K1,n1a,a,n2a);
                    n2b=n2a+h/2*din2lok_g(t(k),r2,K2,n2a,b,n1a);
                    error_now=abs(n1b-n1(k+1))+abs(n2b-n2(k+1));
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
                n1(k+1)=n1(k)+h*din2lok_f(t(k),r1,K1,n1(k),a,n2(k));
                n2(k+1)=n2(k)+h*din2lok_g(t(k),r2,K2,n2(k),b,n1(k));
                %for error estimation
                n1a=n1(k)+h/2*din2lok_f(t(k),r1,K1,n1(k),a,n2(k));
                n2a=n2(k)+h/2*din2lok_g(t(k),r2,K2,n2(k),b,n1(k));
                n1b=n1a+h/2*din2lok_f(t(k),r1,K1,n1a,a,n2a);
                n2b=n2a+h/2*din2lok_g(t(k),r2,K2,n2a,b,n1a);
                error_abs=error_abs+(abs(n1b-n1(k+1))+abs(n2b-n2(k+1)));
            end
        end
    case 2  %Backward
        if adap==1;
            k=1;
            while t(k)<tmax;
                ok=1;
                if ok==1;
                    t(k+1)=t(k)+h;
                    nn1=n1(k);
                    nn2=n2(k);
                    error=1;
                    while error>error_max*h/tmax/10
                        J=[1+h*r1/K1*(2*nn1-K1+a*nn2), h*a*r1*nn1/K1;h*b*r2*nn2/K2, 1+h*r2/K2*(2*nn2-K2+b*nn1)];
                        delta=-J\[nn1-n1(k)-h*din2lok_f(t(k),r1,K1,nn1,a,nn2);nn2-n2(k)-h*din2lok_g(t(k),r2,K2,nn2,b,nn1)];
                        nn1=nn1+delta(1);
                        nn2=nn2+delta(2);
                        error=norm([nn1-n1(k)-h*din2lok_f(t(k),r1,K1,nn1,a,nn2);nn2-n2(k)-h*din2lok_g(t(k),r2,K2,nn2,b,nn1)]);
                    end
                    n1(k+1)=nn1;
                    n2(k+1)=nn2;
                    %for error estimation
                    h=h/2;
                    nn1a=n1(k);
                    nn2a=n2(k);
                    error=1;
                    while error>error_max*h/tmax/10
                        J=[1+h*r1/K1*(2*nn1a-K1+a*nn2a), h*a*r1*nn1a/K1;h*b*r2*nn2a/K2, 1+h*r2/K2*(2*nn2a-K2+b*nn1a)];
                        delta=-J\[nn1a-n1(k)-h*din2lok_f(t(k),r1,K1,nn1a,a,nn2a);nn2a-n2(k)-h*din2lok_g(t(k),r2,K2,nn2a,b,nn1a)];
                        nn1a=nn1a+delta(1);
                        nn2a=nn2a+delta(2);
                        error=norm([nn1a-n1(k)-h*din2lok_f(t(k),r1,K1,nn1a,a,nn2a);nn2a-n2(k)-h*din2lok_g(t(k),r2,K2,nn2a,b,nn1a)]);
                    end
                    nn1b=nn1a;
                    nn2b=nn2a;
                    error=1;
                    while error>error_max*h/tmax/10
                        J=[1+h*r1/K1*(2*nn1b-K1+a*nn2b), h*a*r1*nn1b/K1;h*b*r2*nn2b/K2, 1+h*r2/K2*(2*nn2b-K2+b*nn1b)];
                        delta=-J\[nn1b-nn1a-h*din2lok_f(t(k),r1,K1,nn1b,a,nn2b);nn2b-nn2a-h*din2lok_g(t(k),r2,K2,nn2b,b,nn1b)];
                        nn1b=nn1b+delta(1);
                        nn2b=nn2b+delta(2);
                        error=norm([nn1b-nn1a-h*din2lok_f(t(k),r1,K1,nn1b,a,nn2b);nn2b-nn2a-h*din2lok_g(t(k),r2,K2,nn2b,b,nn1b)]);
                    end
                    h=h*2;
                    error_now=abs(nn1b-nn1)+abs(nn2b-nn2);
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
                nn1=n1(k);
                nn2=n2(k);
                error=1;
                while error>tol
                    J=[1+h*r1/K1*(2*nn1-K1+a*nn2), h*a*r1*nn1/K1;h*b*r2*nn2/K2, 1+h*r2/K2*(2*nn2-K2+b*nn1)];
                    delta=-J\[nn1-n1(k)-h*din2lok_f(t(k),r1,K1,nn1,a,nn2);nn2-n2(k)-h*din2lok_g(t(k),r2,K2,nn2,b,nn1)];
                    nn1=nn1+delta(1);
                    nn2=nn2+delta(2);
                    error=norm([nn1-n1(k)-h*din2lok_f(t(k),r1,K1,nn1,a,nn2);nn2-n2(k)-h*din2lok_g(t(k),r2,K2,nn2,b,nn1)]);
                end
                n1(k+1)=nn1;
                n2(k+1)=nn2;
                %for error estimation
                h=h/2;
                nn1a=n1(k);
                nn2a=n2(k);
                error=1;
                while error>tol
                    J=[1+h*r1/K1*(2*nn1a-K1+a*nn2a), h*a*r1*nn1a/K1;h*b*r2*nn2a/K2, 1+h*r2/K2*(2*nn2a-K2+b*nn1a)];
                    delta=-J\[nn1a-n1(k)-h*din2lok_f(t(k),r1,K1,nn1a,a,nn2a);nn2a-n2(k)-h*din2lok_g(t(k),r2,K2,nn2a,b,nn1a)];
                    nn1a=nn1a+delta(1);
                    nn2a=nn2a+delta(2);
                    error=norm([nn1a-n1(k)-h*din2lok_f(t(k),r1,K1,nn1a,a,nn2a);nn2a-n2(k)-h*din2lok_g(t(k),r2,K2,nn2a,b,nn1a)]);
                end
                nn1b=nn1a;
                nn2b=nn2a;
                error=1;
                while error>tol
                    J=[1+h*r1/K1*(2*nn1b-K1+a*nn2b), h*a*r1*nn1b/K1;h*b*r2*nn2b/K2, 1+h*r2/K2*(2*nn2b-K2+b*nn1b)];
                    delta=-J\[nn1b-nn1a-h*din2lok_f(t(k),r1,K1,nn1b,a,nn2b);nn2b-nn2a-h*din2lok_g(t(k),r2,K2,nn2b,b,nn1b)];
                    nn1b=nn1b+delta(1);
                    nn2b=nn2b+delta(2);
                    error=norm([nn1b-nn1a-h*din2lok_f(t(k),r1,K1,nn1b,a,nn2b);nn2b-nn2a-h*din2lok_g(t(k),r2,K2,nn2b,b,nn1b)]);
                end
                error_abs=error_abs+abs((nn1b-nn1)+abs(nn2b-nn2));
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
                    delta1(1)=h*din2lok_f(t(k),r1,K1,n1(k),a,n2(k));
                    delta2(1)=h*din2lok_g(t(k),r2,K2,n2(k),b,n1(k));
                    delta1(2)=h*din2lok_f(t(k)+h/2,r1,K1,n1(k)+delta1(1)/2,a,n2(k)+delta2(1)/2);
                    delta2(2)=h*din2lok_g(t(k)+h/2,r2,K2,n2(k)+delta2(1)/2,b,n1(k)+delta1(1)/2);
                    delta1(3)=h*din2lok_f(t(k)+h/2,r1,K1,n1(k)+delta1(2)/2,a,n2(k)+delta2(2)/2);
                    delta2(3)=h*din2lok_g(t(k)+h/2,r2,K2,n2(k)+delta2(2)/2,b,n1(k)+delta1(2)/2);
                    delta1(4)=h*din2lok_f(t(k)+h,r1,K1,n1(k)+delta1(3),a,n2(k)+delta2(3));
                    delta2(4)=h*din2lok_g(t(k)+h,r2,K2,n2(k)+delta2(3),b,n1(k)+delta1(3));
                    n1(k+1)=n1(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    n2(k+1)=n2(k)+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
                    %for error estimation
                    h=h/2;           
                    delta1(1)=h*din2lok_f(t(k),r1,K1,n1(k),a,n2(k));
                    delta2(1)=h*din2lok_g(t(k),r2,K2,n2(k),b,n1(k));
                    delta1(2)=h*din2lok_f(t(k)+h/2,r1,K1,n1(k)+delta1(1)/2,a,n2(k)+delta2(1)/2);
                    delta2(2)=h*din2lok_g(t(k)+h/2,r2,K2,n2(k)+delta2(1)/2,b,n1(k)+delta1(1)/2);
                    delta1(3)=h*din2lok_f(t(k)+h/2,r1,K1,n1(k)+delta1(2)/2,a,n2(k)+delta2(2)/2);
                    delta2(3)=h*din2lok_g(t(k)+h/2,r2,K2,n2(k)+delta2(2)/2,b,n1(k)+delta1(2)/2);
                    delta1(4)=h*din2lok_f(t(k)+h,r1,K1,n1(k)+delta1(3),a,n2(k)+delta2(3));
                    delta2(4)=h*din2lok_g(t(k)+h,r2,K2,n2(k)+delta2(3),b,n1(k)+delta1(3));
                    n1a=n1(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    n2a=n2(k)+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
                
                    delta1(1)=h*din2lok_f(t(k),r1,K1,n1a,a,n2a);
                    delta2(1)=h*din2lok_g(t(k),r2,K2,n2a,b,n1a);
                    delta1(2)=h*din2lok_f(t(k)+h/2,r1,K1,n1a+delta1(1)/2,a,n2a+delta2(1)/2);
                    delta2(2)=h*din2lok_g(t(k)+h/2,r2,K2,n2a+delta2(1)/2,b,n1a+delta1(1)/2);
                    delta1(3)=h*din2lok_f(t(k)+h/2,r1,K1,n1a+delta1(2)/2,a,n2a+delta2(2)/2);
                    delta2(3)=h*din2lok_g(t(k)+h/2,r2,K2,n2a+delta2(2)/2,b,n1a+delta1(2)/2);
                    delta1(4)=h*din2lok_f(t(k)+h,r1,K1,n1a+delta1(3),a,n2a+delta2(3));
                    delta2(4)=h*din2lok_g(t(k)+h,r2,K2,n2a+delta2(3),b,n1a+delta1(3));
                    n1b=n1a+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    n2b=n2a+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));            
                    error_now=8/15*(abs(n1b-n1(k+1))+abs(n2b-n2(k+1)));    
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
                delta1(1)=h*din2lok_f(t(k),r1,K1,n1(k),a,n2(k));
                delta2(1)=h*din2lok_g(t(k),r2,K2,n2(k),b,n1(k));
                delta1(2)=h*din2lok_f(t(k)+h/2,r1,K1,n1(k)+delta1(1)/2,a,n2(k)+delta2(1)/2);
                delta2(2)=h*din2lok_g(t(k)+h/2,r2,K2,n2(k)+delta2(1)/2,b,n1(k)+delta1(1)/2);
                delta1(3)=h*din2lok_f(t(k)+h/2,r1,K1,n1(k)+delta1(2)/2,a,n2(k)+delta2(2)/2);
                delta2(3)=h*din2lok_g(t(k)+h/2,r2,K2,n2(k)+delta2(2)/2,b,n1(k)+delta1(2)/2);
                delta1(4)=h*din2lok_f(t(k)+h,r1,K1,n1(k)+delta1(3),a,n2(k)+delta2(3));
                delta2(4)=h*din2lok_g(t(k)+h,r2,K2,n2(k)+delta2(3),b,n1(k)+delta1(3));
                n1(k+1)=n1(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                n2(k+1)=n2(k)+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
                %for error estimation
                h=h/2;
                
                delta1(1)=h*din2lok_f(t(k),r1,K1,n1(k),a,n2(k));
                delta2(1)=h*din2lok_g(t(k),r2,K2,n2(k),b,n1(k));
                delta1(2)=h*din2lok_f(t(k)+h/2,r1,K1,n1(k)+delta1(1)/2,a,n2(k)+delta2(1)/2);
                delta2(2)=h*din2lok_g(t(k)+h/2,r2,K2,n2(k)+delta2(1)/2,b,n1(k)+delta1(1)/2);
                delta1(3)=h*din2lok_f(t(k)+h/2,r1,K1,n1(k)+delta1(2)/2,a,n2(k)+delta2(2)/2);
                delta2(3)=h*din2lok_g(t(k)+h/2,r2,K2,n2(k)+delta2(2)/2,b,n1(k)+delta1(2)/2);
                delta1(4)=h*din2lok_f(t(k)+h,r1,K1,n1(k)+delta1(3),a,n2(k)+delta2(3));
                delta2(4)=h*din2lok_g(t(k)+h,r2,K2,n2(k)+delta2(3),b,n1(k)+delta1(3));
                n1a=n1(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                n2a=n2(k)+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
            
                delta1(1)=h*din2lok_f(t(k),r1,K1,n1a,a,n2a);
                delta2(1)=h*din2lok_g(t(k),r2,K2,n2a,b,n1a);
                delta1(2)=h*din2lok_f(t(k)+h/2,r1,K1,n1a+delta1(1)/2,a,n2a+delta2(1)/2);
                delta2(2)=h*din2lok_g(t(k)+h/2,r2,K2,n2a+delta2(1)/2,b,n1a+delta1(1)/2);
                delta1(3)=h*din2lok_f(t(k)+h/2,r1,K1,n1a+delta1(2)/2,a,n2a+delta2(2)/2);
                delta2(3)=h*din2lok_g(t(k)+h/2,r2,K2,n2a+delta2(2)/2,b,n1a+delta1(2)/2);
                delta1(4)=h*din2lok_f(t(k)+h,r1,K1,n1a+delta1(3),a,n2a+delta2(3));
                delta2(4)=h*din2lok_g(t(k)+h,r2,K2,n2a+delta2(3),b,n1a+delta1(3));
                n1b=n1a+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                n2b=n2a+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));            
            
                h=2*h;
                error_abs=error_abs+8/15*(abs(n1b-n1(k+1))+abs(n2b-n2(k+1)));
            end
        end
end

axes(handles.axes1);
plot(t,n1,'bx-',t,n2,'rx-')
set(handles.axes1,'YLim',[0 150])
xlabel('tiempo')
ylabel('poblacion')
legend('N1','N2')
muestre=['error estimation (abs)= ',num2str(error_abs)];
set(handles.text_err,'String',muestre)

% --- Executes during object creation, after setting all properties.
function text_r1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_r1 (see GCBO)
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
function text_n1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_n1 (see GCBO)
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

function text_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function text_a_Callback(hObject, eventdata, handles)
% hObject    handle to text_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_a as text
%        str2double(get(hObject,'String')) returns contents of text_a as a double
val = str2double(get(handles.text_a,'String'));
if  isempty(val) | (val < get(handles.slid_a,'Min')) | (val > get(handles.slid_a,'Max')),
	old_val = get(handles.slid_a,'Value');
	set(handles.text_a,'String',old_val)
else
	set(handles.slid_a,'Value',val)
end


% --- Executes during object creation, after setting all properties.
function slid_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_a (see GCBO)
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
function slid_a_Callback(hObject, eventdata, handles)
% hObject    handle to slid_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_a,'Value');
set(handles.text_a,'String',slid_val);


% --- Executes during object creation, after setting all properties.
function text_K1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_K1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function text_K1_Callback(hObject, eventdata, handles)
% hObject    handle to text_K1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_K1 as text
%        str2double(get(hObject,'String')) returns contents of text_K1 as a double
val = str2double(get(handles.text_K1,'String'));
if  isempty(val) | (val < get(handles.slid_K1,'Min')) | (val > get(handles.slid_K1,'Max')),
	old_val = get(handles.slid_K1,'Value');
	set(handles.text_K1,'String',old_val)
else
	set(handles.slid_K1,'Value',val)
end

% --- Executes during object creation, after setting all properties.
function slid_K1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_K1 (see GCBO)
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
function slid_K1_Callback(hObject, eventdata, handles)
% hObject    handle to slid_K1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_K1,'Value');
set(handles.text_K1,'String',slid_val);


% --- Executes during object creation, after setting all properties.
function text_r2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_r2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function text_r2_Callback(hObject, eventdata, handles)
% hObject    handle to text_r2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_r2 as text
%        str2double(get(hObject,'String')) returns contents of text_r2 as a double


% --- Executes during object creation, after setting all properties.
function slid_r2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_r2 (see GCBO)
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
function slid_r2_Callback(hObject, eventdata, handles)
% hObject    handle to slid_r2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_r2,'Value');
set(handles.text_r2,'String',slid_val);

% --- Executes during object creation, after setting all properties.
function text_K2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_K2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function text_K2_Callback(hObject, eventdata, handles)
% hObject    handle to text_K2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_K2 as text
%        str2double(get(hObject,'String')) returns contents of text_K2 as a double
val = str2double(get(handles.text_K2,'String'));
if  isempty(val) | (val < get(handles.slid_K2,'Min')) | (val > get(handles.slid_K2,'Max')),
	old_val = get(handles.slid_K2,'Value');
	set(handles.text_K2,'String',old_val)
else
	set(handles.slid_K2,'Value',val)
end

% --- Executes during object creation, after setting all properties.
function slid_K2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_K2 (see GCBO)
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
function slid_K2_Callback(hObject, eventdata, handles)
% hObject    handle to slid_K2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_K2,'Value');
set(handles.text_K2,'String',slid_val);

% --- Executes during object creation, after setting all properties.
function text_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function text_b_Callback(hObject, eventdata, handles)
% hObject    handle to text_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_b as text
%        str2double(get(hObject,'String')) returns contents of text_b as a double
val = str2double(get(handles.text_b,'String'));
if  isempty(val) | (val < get(handles.slid_b,'Min')) | (val > get(handles.slid_b,'Max')),
	old_val = get(handles.slid_b,'Value');
	set(handles.text_b,'String',old_val)
else
	set(handles.slid_b,'Value',val)
end

% --- Executes during object creation, after setting all properties.
function slid_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_b (see GCBO)
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
function slid_b_Callback(hObject, eventdata, handles)
% hObject    handle to slid_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_b,'Value');
set(handles.text_b,'String',slid_val);

% --- Executes during object creation, after setting all properties.
function text_n2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_n2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function text_n2_Callback(hObject, eventdata, handles)
% hObject    handle to text_n2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_n2 as text
%        str2double(get(hObject,'String')) returns contents of text_n2 as a double
val = str2double(get(handles.text_n2,'String'));
if  isempty(val) | (val < get(handles.slid_n2,'Min')) | (val > get(handles.slid_n2,'Max')),
	old_val = get(handles.slid_n2,'Value');
	set(handles.text_n2,'String',old_val)
else
	set(handles.slid_n2,'Value',val)
end

% --- Executes during object creation, after setting all properties.
function slid_n2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_n2 (see GCBO)
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
function slid_n2_Callback(hObject, eventdata, handles)
% hObject    handle to slid_n2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_n2,'Value');
set(handles.text_n2,'String',slid_val);


% --- Executes on button press in but_phase.
function but_phase_Callback(hObject, eventdata, handles)
% hObject    handle to but_phase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n1(1)=get(handles.slid_n1,'Value');
n2(1)=get(handles.slid_n2,'Value');
tmax=get(handles.slid_t,'Value');
r1=get(handles.slid_r1,'Value');
K1=get(handles.slid_K1,'Value');
r2=get(handles.slid_r2,'Value');
K2=get(handles.slid_K2,'Value');
a=get(handles.slid_a,'Value');
b=get(handles.slid_b,'Value');

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
                    n1(k+1)=n1(k)+h*din2lok_f(t(k),r1,K1,n1(k),a,n2(k));
                    n2(k+1)=n2(k)+h*din2lok_g(t(k),r2,K2,n2(k),b,n1(k));
                    %for error estimation
                    n1a=n1(k)+h/2*din2lok_f(t(k),r1,K1,n1(k),a,n2(k));
                    n2a=n2(k)+h/2*din2lok_g(t(k),r2,K2,n2(k),b,n1(k));
                    n1b=n1a+h/2*din2lok_f(t(k),r1,K1,n1a,a,n2a);
                    n2b=n2a+h/2*din2lok_g(t(k),r2,K2,n2a,b,n1a);
                    error_now=abs(n1b-n1(k+1))+abs(n2b-n2(k+1));
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
                n1(k+1)=n1(k)+h*din2lok_f(t(k),r1,K1,n1(k),a,n2(k));
                n2(k+1)=n2(k)+h*din2lok_g(t(k),r2,K2,n2(k),b,n1(k));
                %for error estimation
                n1a=n1(k)+h/2*din2lok_f(t(k),r1,K1,n1(k),a,n2(k));
                n2a=n2(k)+h/2*din2lok_g(t(k),r2,K2,n2(k),b,n1(k));
                n1b=n1a+h/2*din2lok_f(t(k),r1,K1,n1a,a,n2a);
                n2b=n2a+h/2*din2lok_g(t(k),r2,K2,n2a,b,n1a);
                error_abs=error_abs+(abs(n1b-n1(k+1))+abs(n2b-n2(k+1)));
            end
        end
    case 2  %Backward
        if adap==1;
            k=1;
            while t(k)<tmax;
                ok=1;
                if ok==1;
                    t(k+1)=t(k)+h;
                    nn1=n1(k);
                    nn2=n2(k);
                    error=1;
                    while error>error_max*h/tmax/10
                        J=[1+h*r1/K1*(2*nn1-K1+a*nn2), a*r1*nn1/K1;b*r2*nn2/K2, 1+h*r2/K2*(2*nn2-K2+b*nn1)];
                        delta=-J\[nn1-n1(k)-h*din2lok_f(t(k),r1,K1,nn1,a,nn2);nn2-n2(k)-h*din2lok_g(t(k),r2,K2,nn2,b,nn1)];
                        nn1=nn1+delta(1);
                        nn2=nn2+delta(2);
                        error=norm([nn1-n1(k)-h*din2lok_f(t(k),r1,K1,nn1,a,nn2);nn2-n2(k)-h*din2lok_g(t(k),r2,K2,nn2,b,nn1)]);
                    end
                    n1(k+1)=nn1;
                    n2(k+1)=nn2;
                    %for error estimation
                    h=h/2;
                    nn1a=n1(k);
                    nn2a=n2(k);
                    error=1;
                    while error>error_max*h/tmax/10
                        J=[1+h*r1/K1*(2*nn1a-K1+a*nn2a), a*r1*nn1a/K1;b*r2*nn2a/K2, 1+h*r2/K2*(2*nn2a-K2+b*nn1a)];
                        delta=-J\[nn1a-n1(k)-h*din2lok_f(t(k),r1,K1,nn1a,a,nn2a);nn2a-n2(k)-h*din2lok_g(t(k),r2,K2,nn2a,b,nn1a)];
                        nn1a=nn1a+delta(1);
                        nn2a=nn2a+delta(2);
                        error=norm([nn1a-n1(k)-h*din2lok_f(t(k),r1,K1,nn1a,a,nn2a);nn2a-n2(k)-h*din2lok_g(t(k),r2,K2,nn2a,b,nn1a)]);
                    end
                    nn1b=nn1a;
                    nn2b=nn2a;
                    error=1;
                    while error>error_max*h/tmax/10
                        J=[1+h*r1/K1*(2*nn1b-K1+a*nn2b), a*r1*nn1b/K1;b*r2*nn2b/K2, 1+h*r2/K2*(2*nn2b-K2+b*nn1b)];
                        delta=-J\[nn1b-nn1a-h*din2lok_f(t(k),r1,K1,nn1b,a,nn2b);nn2b-nn2a-h*din2lok_g(t(k),r2,K2,nn2b,b,nn1b)];
                        nn1b=nn1b+delta(1);
                        nn2b=nn2b+delta(2);
                        error=norm([nn1b-nn1a-h*din2lok_f(t(k),r1,K1,nn1b,a,nn2b);nn2b-nn2a-h*din2lok_g(t(k),r2,K2,nn2b,b,nn1b)]);
                    end
                    h=h*2;
                    error_now=abs(nn1b-nn1)+abs(nn2b-nn2);
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
                nn1=n1(k);
                nn2=n2(k);
                error=1;
                while error>tol
                    J=[1+h*r1/K1*(2*nn1-K1+a*nn2), a*r1*nn1/K1;b*r2*nn2/K2, 1+h*r2/K2*(2*nn2-K2+b*nn1)];
                    delta=-J\[nn1-n1(k)-h*din2lok_f(t(k),r1,K1,nn1,a,nn2);nn2-n2(k)-h*din2lok_g(t(k),r2,K2,nn2,b,nn1)];
                    nn1=nn1+delta(1);
                    nn2=nn2+delta(2);
                    error=norm([nn1-n1(k)-h*din2lok_f(t(k),r1,K1,nn1,a,nn2);nn2-n2(k)-h*din2lok_g(t(k),r2,K2,nn2,b,nn1)]);
                end
                n1(k+1)=nn1;
                n2(k+1)=nn2;
                %for error estimation
                h=h/2;
                nn1a=n1(k);
                nn2a=n2(k);
                error=1;
                while error>tol
                    J=[1+h*r1/K1*(2*nn1a-K1+a*nn2a), a*r1*nn1a/K1;b*r2*nn2a/K2, 1+h*r2/K2*(2*nn2a-K2+b*nn1a)];
                    delta=-J\[nn1a-n1(k)-h*din2lok_f(t(k),r1,K1,nn1a,a,nn2a);nn2a-n2(k)-h*din2lok_g(t(k),r2,K2,nn2a,b,nn1a)];
                    nn1a=nn1a+delta(1);
                    nn2a=nn2a+delta(2);
                    error=norm([nn1a-n1(k)-h*din2lok_f(t(k),r1,K1,nn1a,a,nn2a);nn2a-n2(k)-h*din2lok_g(t(k),r2,K2,nn2a,b,nn1a)]);
                end
                nn1b=nn1a;
                nn2b=nn2a;
                error=1;
                while error>tol
                    J=[1+h*r1/K1*(2*nn1b-K1+a*nn2b), a*r1*nn1b/K1;b*r2*nn2b/K2, 1+h*r2/K2*(2*nn2b-K2+b*nn1b)];
                    delta=-J\[nn1b-nn1a-h*din2lok_f(t(k),r1,K1,nn1b,a,nn2b);nn2b-nn2a-h*din2lok_g(t(k),r2,K2,nn2b,b,nn1b)];
                    nn1b=nn1b+delta(1);
                    nn2b=nn2b+delta(2);
                    error=norm([nn1b-nn1a-h*din2lok_f(t(k),r1,K1,nn1b,a,nn2b);nn2b-nn2a-h*din2lok_g(t(k),r2,K2,nn2b,b,nn1b)]);
                end
                error_abs=error_abs+abs((nn1b-nn1)+abs(nn2b-nn2));
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
                    delta1(1)=h*din2lok_f(t(k),r1,K1,n1(k),a,n2(k));
                    delta2(1)=h*din2lok_g(t(k),r2,K2,n2(k),b,n1(k));
                    delta1(2)=h*din2lok_f(t(k)+h/2,r1,K1,n1(k)+delta1(1)/2,a,n2(k)+delta2(1)/2);
                    delta2(2)=h*din2lok_g(t(k)+h/2,r2,K2,n2(k)+delta2(1)/2,b,n1(k)+delta1(1)/2);
                    delta1(3)=h*din2lok_f(t(k)+h/2,r1,K1,n1(k)+delta1(2)/2,a,n2(k)+delta2(2)/2);
                    delta2(3)=h*din2lok_g(t(k)+h/2,r2,K2,n2(k)+delta2(2)/2,b,n1(k)+delta1(2)/2);
                    delta1(4)=h*din2lok_f(t(k)+h,r1,K1,n1(k)+delta1(3),a,n2(k)+delta2(3));
                    delta2(4)=h*din2lok_g(t(k)+h,r2,K2,n2(k)+delta2(3),b,n1(k)+delta1(3));
                    n1(k+1)=n1(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    n2(k+1)=n2(k)+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
                    %for error estimation
                    h=h/2;           
                    delta1(1)=h*din2lok_f(t(k),r1,K1,n1(k),a,n2(k));
                    delta2(1)=h*din2lok_g(t(k),r2,K2,n2(k),b,n1(k));
                    delta1(2)=h*din2lok_f(t(k)+h/2,r1,K1,n1(k)+delta1(1)/2,a,n2(k)+delta2(1)/2);
                    delta2(2)=h*din2lok_g(t(k)+h/2,r2,K2,n2(k)+delta2(1)/2,b,n1(k)+delta1(1)/2);
                    delta1(3)=h*din2lok_f(t(k)+h/2,r1,K1,n1(k)+delta1(2)/2,a,n2(k)+delta2(2)/2);
                    delta2(3)=h*din2lok_g(t(k)+h/2,r2,K2,n2(k)+delta2(2)/2,b,n1(k)+delta1(2)/2);
                    delta1(4)=h*din2lok_f(t(k)+h,r1,K1,n1(k)+delta1(3),a,n2(k)+delta2(3));
                    delta2(4)=h*din2lok_g(t(k)+h,r2,K2,n2(k)+delta2(3),b,n1(k)+delta1(3));
                    n1a=n1(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    n2a=n2(k)+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
                
                    delta1(1)=h*din2lok_f(t(k),r1,K1,n1a,a,n2a);
                    delta2(1)=h*din2lok_g(t(k),r2,K2,n2a,b,n1a);
                    delta1(2)=h*din2lok_f(t(k)+h/2,r1,K1,n1a+delta1(1)/2,a,n2a+delta2(1)/2);
                    delta2(2)=h*din2lok_g(t(k)+h/2,r2,K2,n2a+delta2(1)/2,b,n1a+delta1(1)/2);
                    delta1(3)=h*din2lok_f(t(k)+h/2,r1,K1,n1a+delta1(2)/2,a,n2a+delta2(2)/2);
                    delta2(3)=h*din2lok_g(t(k)+h/2,r2,K2,n2a+delta2(2)/2,b,n1a+delta1(2)/2);
                    delta1(4)=h*din2lok_f(t(k)+h,r1,K1,n1a+delta1(3),a,n2a+delta2(3));
                    delta2(4)=h*din2lok_g(t(k)+h,r2,K2,n2a+delta2(3),b,n1a+delta1(3));
                    n1b=n1a+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    n2b=n2a+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));            
                    error_now=8/15*(abs(n1b-n1(k+1))+abs(n2b-n2(k+1)));    
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
                delta1(1)=h*din2lok_f(t(k),r1,K1,n1(k),a,n2(k));
                delta2(1)=h*din2lok_g(t(k),r2,K2,n2(k),b,n1(k));
                delta1(2)=h*din2lok_f(t(k)+h/2,r1,K1,n1(k)+delta1(1)/2,a,n2(k)+delta2(1)/2);
                delta2(2)=h*din2lok_g(t(k)+h/2,r2,K2,n2(k)+delta2(1)/2,b,n1(k)+delta1(1)/2);
                delta1(3)=h*din2lok_f(t(k)+h/2,r1,K1,n1(k)+delta1(2)/2,a,n2(k)+delta2(2)/2);
                delta2(3)=h*din2lok_g(t(k)+h/2,r2,K2,n2(k)+delta2(2)/2,b,n1(k)+delta1(2)/2);
                delta1(4)=h*din2lok_f(t(k)+h,r1,K1,n1(k)+delta1(3),a,n2(k)+delta2(3));
                delta2(4)=h*din2lok_g(t(k)+h,r2,K2,n2(k)+delta2(3),b,n1(k)+delta1(3));
                n1(k+1)=n1(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                n2(k+1)=n2(k)+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
                %for error estimation
                h=h/2;
                
                delta1(1)=h*din2lok_f(t(k),r1,K1,n1(k),a,n2(k));
                delta2(1)=h*din2lok_g(t(k),r2,K2,n2(k),b,n1(k));
                delta1(2)=h*din2lok_f(t(k)+h/2,r1,K1,n1(k)+delta1(1)/2,a,n2(k)+delta2(1)/2);
                delta2(2)=h*din2lok_g(t(k)+h/2,r2,K2,n2(k)+delta2(1)/2,b,n1(k)+delta1(1)/2);
                delta1(3)=h*din2lok_f(t(k)+h/2,r1,K1,n1(k)+delta1(2)/2,a,n2(k)+delta2(2)/2);
                delta2(3)=h*din2lok_g(t(k)+h/2,r2,K2,n2(k)+delta2(2)/2,b,n1(k)+delta1(2)/2);
                delta1(4)=h*din2lok_f(t(k)+h,r1,K1,n1(k)+delta1(3),a,n2(k)+delta2(3));
                delta2(4)=h*din2lok_g(t(k)+h,r2,K2,n2(k)+delta2(3),b,n1(k)+delta1(3));
                n1a=n1(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                n2a=n2(k)+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
            
                delta1(1)=h*din2lok_f(t(k),r1,K1,n1a,a,n2a);
                delta2(1)=h*din2lok_g(t(k),r2,K2,n2a,b,n1a);
                delta1(2)=h*din2lok_f(t(k)+h/2,r1,K1,n1a+delta1(1)/2,a,n2a+delta2(1)/2);
                delta2(2)=h*din2lok_g(t(k)+h/2,r2,K2,n2a+delta2(1)/2,b,n1a+delta1(1)/2);
                delta1(3)=h*din2lok_f(t(k)+h/2,r1,K1,n1a+delta1(2)/2,a,n2a+delta2(2)/2);
                delta2(3)=h*din2lok_g(t(k)+h/2,r2,K2,n2a+delta2(2)/2,b,n1a+delta1(2)/2);
                delta1(4)=h*din2lok_f(t(k)+h,r1,K1,n1a+delta1(3),a,n2a+delta2(3));
                delta2(4)=h*din2lok_g(t(k)+h,r2,K2,n2a+delta2(3),b,n1a+delta1(3));
                n1b=n1a+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                n2b=n2a+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));            
            
                h=2*h;
                error_abs=error_abs+8/15*(abs(n1b-n1(k+1))+abs(n2b-n2(k+1)));
            end
        end
end
axes(handles.axes1);
iso1x=[0,K1/a];
iso1y=[K1,0];
iso2x=[K2,0];
iso2y=[0,K2/b];
plot(n2,n1,'kx-')
set(handles.axes1,'XLim',[0 300],'YLim',[0 300])
line(iso1x,iso1y,'Color',[1 0 0],'LineStyle','--','LineWidth',[4])
line(iso2x,iso2y,'Color',[0 0 1],'LineStyle','--','LineWidth',[4])
xlabel('poblacion 2')
ylabel('poblacion 1')
legend('Trayectoria','Isoclina 1','Isoclina 2')
muestre=['error estimation (abs)= ',num2str(error_abs)];
set(handles.text_err,'String',muestre)

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


