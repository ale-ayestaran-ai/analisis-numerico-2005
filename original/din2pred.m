function varargout = din2pred(varargin)
% DIN2PRED M-file for din2pred.fig
%      DIN2PRED, by itself, creates C new DIN2PRED or raises the existing
%      singleton*.
%
%      H = DIN2PRED returns the handle to C new DIN2PRED or the handle to
%      the existing singleton*.
%
%      DIN2PRED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIN2PRED.M with the given input arguments.
%
%      DIN2PRED('Property','Value',...) creates C new DIN2PRED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before din2pred_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to din2pred_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help din2pred

% Last Modified by GUIDE v2.5 17-Feb-2005 04:58:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @din2pred_OpeningFcn, ...
                   'gui_OutputFcn',  @din2pred_OutputFcn, ...
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


% --- Executes just before din2pred is made visible.
function din2pred_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to din2pred (see VARARGIN)

% Choose default command line output for din2pred
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes din2pred wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = din2pred_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function text_r_Callback(hObject, eventdata, handles)
% hObject    handle to text_r (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
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
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have C light gray background, change
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
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_r,'Value');
set(handles.text_r,'String',slid_val);

% --- Executes during object creation, after setting all properties.
function slid_n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_n (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have C light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on slider movement.
function slid_n_Callback(hObject, eventdata, handles)
% hObject    handle to slid_n (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_n,'Value');
set(handles.text_n,'String',slid_val);

% --- Executes during object creation, after setting all properties.
function slid_t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_t (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have C light gray background, change
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
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_t,'Value');
set(handles.text_t,'String',slid_val);



function text_n_Callback(hObject, eventdata, handles)
% hObject    handle to text_n (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_n as text
%        str2double(get(hObject,'String')) returns contents of text_n as C double
val = str2double(get(handles.text_n,'String'));
if  isempty(val) | (val < get(handles.slid_n,'Min')) | (val > get(handles.slid_n,'Max')),
	old_val = get(handles.slid_n,'Value');
	set(handles.text_n,'String',old_val)
else
	set(handles.slid_n,'Value',val)
end



function text_t_Callback(h, eventdata, handles)
% hObject    handle to text_t (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_t as text
%        str2double(get(hObject,'String')) returns contents of text_t as C double

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
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n(1)=get(handles.slid_n,'Value');
p(1)=get(handles.slid_p,'Value');
tmax=get(handles.slid_t,'Value');
r=get(handles.slid_r,'Value');
d=get(handles.slid_d,'Value');
C=get(handles.slid_C,'Value');
g=get(handles.slid_g,'Value');

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
                    n(k+1)=n(k)+h*din2pred_f(t(k),r,n(k),C,p(k));
                    p(k+1)=p(k)+h*din2pred_g(t(k),d,p(k),C,g,n(k));
                    %for error estimation
                    na=n(k)+h/2*din2pred_f(t(k),r,n(k),C,p(k));
                    pa=p(k)+h/2*din2pred_g(t(k),d,p(k),C,g,n(k));
                    nb=na+h/2*din2pred_f(t(k),r,na,C,pa);
                    pb=pa+h/2*din2pred_g(t(k),d,pa,C,g,na);
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
                n(k+1)=n(k)+h*din2pred_f(t(k),r,n(k),C,p(k));
                p(k+1)=p(k)+h*din2pred_g(t(k),d,p(k),C,g,n(k));
                %for error estimation
                na=n(k)+h/2*din2pred_f(t(k),r,n(k),C,p(k));
                pa=p(k)+h/2*din2pred_g(t(k),d,p(k),C,g,n(k));
                nb=na+h/2*din2pred_f(t(k),r,na,C,pa);
                pb=pa+h/2*din2pred_g(t(k),d,pa,C,g,na);
                error_abs=error_abs+(abs(nb-n(k+1))+abs(pb-p(k+1)));
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
                    pp=p(k);
                    error=1;
                    while error>error_max*h/tmax/10
                        J=[1-h*(r-C*pp), h*C*nn;-h*g*C*pp, 1+h*d*g*C*nn];
                        delta=-J\[nn-n(k)-h*din2pred_f(t(k),r,nn,C,pp);pp-p(k)-h*din2pred_g(t(k),d,pp,C,g,nn)];
                        nn=nn+delta(1);
                        pp=pp+delta(2);
                        error=norm([nn-n(k)-h*din2pred_f(t(k),r,nn,C,pp);pp-p(k)-h*din2pred_g(t(k),d,pp,C,g,nn)]);
                    end
                    n(k+1)=nn;
                    p(k+1)=pp;
                    %for error estimation
                    h=h/2;
                    nna=n(k);
                    ppa=p(k);
                    error=1;
                    while error>error_max*h/tmax/10
                        J=[1-h*(r-C*ppa), h*C*nna;-h*g*C*ppa, 1+h*d*g*C*nna];
                        delta=-J\[nna-n(k)-h*din2pred_f(t(k),r,nna,C,ppa);ppa-p(k)-h*din2pred_g(t(k),d,ppa,C,g,nna)];
                        nna=nna+delta(1);
                        ppa=ppa+delta(2);
                        error=norm([nna-n(k)-h*din2pred_f(t(k),r,nna,C,ppa);ppa-p(k)-h*din2pred_g(t(k),d,ppa,C,g,nna)]);
                    end
                    nnb=nna;
                    ppb=ppa;
                    error=1;
                    while error>error_max*h/tmax/10
                        J=[1-h*(r-C*ppb), h*C*nnb;-h*g*C*ppb, 1+h*d*g*C*nnb];
                        delta=-J\[nnb-nna-h*din2pred_f(t(k),r,nnb,C,ppb);ppb-ppa-h*din2pred_g(t(k),d,ppb,C,g,nnb)];
                        nnb=nnb+delta(1);
                        ppb=ppb+delta(2);
                        error=norm([nnb-nna-h*din2pred_f(t(k),r,nnb,C,ppb);ppb-ppa-h*din2pred_g(t(k),d,ppb,C,g,nnb)]);
                    end
                    h=h*2;
                    error_now=abs(nnb-nn)+abs(ppb-pp);
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
                pp=p(k);
                error=1;
                while error>error_max*h/tmax/10
                    J=[1-h*(r-C*pp), h*C*nn;-h*g*C*pp, 1+h*d*g*C*nn];
                    delta=-J\[nn-n(k)-h*din2pred_f(t(k),r,nn,C,pp);pp-p(k)-h*din2pred_g(t(k),d,pp,C,g,nn)];
                    nn=nn+delta(1);
                    pp=pp+delta(2);
                    error=norm([nn-n(k)-h*din2pred_f(t(k),r,nn,C,pp);pp-p(k)-h*din2pred_g(t(k),d,pp,C,g,nn)]);
                end
                n(k+1)=nn;
                p(k+1)=pp;
                %for error estimation
                h=h/2;
                    nna=n(k);
                    ppa=p(k);
                    error=1;
                    while error>error_max*h/tmax/10
                        J=[1-h*(r-C*ppa), h*C*nna;-h*g*C*ppa, 1+h*d*g*C*nna];
                        delta=-J\[nna-n(k)-h*din2pred_f(t(k),r,nna,C,ppa);ppa-p(k)-h*din2pred_g(t(k),d,ppa,C,g,nna)];
                        nna=nna+delta(1);
                        ppa=ppa+delta(2);
                        error=norm([nna-n(k)-h*din2pred_f(t(k),r,nna,C,ppa);ppa-p(k)-h*din2pred_g(t(k),d,ppa,C,g,nna)]);
                    end
                    nnb=nna;
                    ppb=ppa;
                    error=1;
                    while error>error_max*h/tmax/10
                        J=[1-h*(r-C*ppb), h*C*nnb;-h*g*C*ppb, 1+h*d*g*C*nnb];
                        delta=-J\[nnb-nna-h*din2pred_f(t(k),r,nnb,C,ppb);ppb-ppa-h*din2pred_g(t(k),d,ppb,C,g,nnb)];
                        nnb=nnb+delta(1);
                        ppb=ppb+delta(2);
                        error=norm([nnb-nna-h*din2pred_f(t(k),r,nnb,C,ppb);ppb-ppa-h*din2pred_g(t(k),d,ppb,C,g,nnb)]);
                    end
                error_abs=error_abs+abs((nnb-nn)+abs(ppb-pp));
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
                    delta1(1)=h*din2pred_f(t(k),r,n(k),C,p(k));
                    delta2(1)=h*din2pred_g(t(k),d,p(k),C,g,n(k));
                    delta1(2)=h*din2pred_f(t(k)+h/2,r,n(k)+delta1(1)/2,C,p(k)+delta2(1)/2);
                    delta2(2)=h*din2pred_g(t(k)+h/2,d,p(k)+delta2(1)/2,C,g,n(k)+delta1(1)/2);
                    delta1(3)=h*din2pred_f(t(k)+h/2,r,n(k)+delta1(2)/2,C,p(k)+delta2(2)/2);
                    delta2(3)=h*din2pred_g(t(k)+h/2,d,p(k)+delta2(2)/2,C,g,n(k)+delta1(2)/2);
                    delta1(4)=h*din2pred_f(t(k)+h,r,n(k)+delta1(3),C,p(k)+delta2(3));
                    delta2(4)=h*din2pred_g(t(k)+h,d,p(k)+delta2(3),C,g,n(k)+delta1(3));
                    n(k+1)=n(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    p(k+1)=p(k)+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
                    %for error estimation
                    h=h/2;           
                    delta1(1)=h*din2pred_f(t(k),r,n(k),C,p(k));
                    delta2(1)=h*din2pred_g(t(k),d,p(k),C,g,n(k));
                    delta1(2)=h*din2pred_f(t(k)+h/2,r,n(k)+delta1(1)/2,C,p(k)+delta2(1)/2);
                    delta2(2)=h*din2pred_g(t(k)+h/2,d,p(k)+delta2(1)/2,C,g,n(k)+delta1(1)/2);
                    delta1(3)=h*din2pred_f(t(k)+h/2,r,n(k)+delta1(2)/2,C,p(k)+delta2(2)/2);
                    delta2(3)=h*din2pred_g(t(k)+h/2,d,p(k)+delta2(2)/2,C,g,n(k)+delta1(2)/2);
                    delta1(4)=h*din2pred_f(t(k)+h,r,n(k)+delta1(3),C,p(k)+delta2(3));
                    delta2(4)=h*din2pred_g(t(k)+h,d,p(k)+delta2(3),C,g,n(k)+delta1(3));
                    na=n(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    pa=p(k)+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
                
                    delta1(1)=h*din2pred_f(t(k),r,na,C,pa);
                    delta2(1)=h*din2pred_g(t(k),d,pa,C,g,na);
                    delta1(2)=h*din2pred_f(t(k)+h/2,r,na+delta1(1)/2,C,pa+delta2(1)/2);
                    delta2(2)=h*din2pred_g(t(k)+h/2,d,pa+delta2(1)/2,C,g,na+delta1(1)/2);
                    delta1(3)=h*din2pred_f(t(k)+h/2,r,na+delta1(2)/2,C,pa+delta2(2)/2);
                    delta2(3)=h*din2pred_g(t(k)+h/2,d,pa+delta2(2)/2,C,g,na+delta1(2)/2);
                    delta1(4)=h*din2pred_f(t(k)+h,r,na+delta1(3),C,pa+delta2(3));
                    delta2(4)=h*din2pred_g(t(k)+h,d,pa+delta2(3),C,g,na+delta1(3));
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
                    delta1(1)=h*din2pred_f(t(k),r,n(k),C,p(k));
                    delta2(1)=h*din2pred_g(t(k),d,p(k),C,g,n(k));
                    delta1(2)=h*din2pred_f(t(k)+h/2,r,n(k)+delta1(1)/2,C,p(k)+delta2(1)/2);
                    delta2(2)=h*din2pred_g(t(k)+h/2,d,p(k)+delta2(1)/2,C,g,n(k)+delta1(1)/2);
                    delta1(3)=h*din2pred_f(t(k)+h/2,r,n(k)+delta1(2)/2,C,p(k)+delta2(2)/2);
                    delta2(3)=h*din2pred_g(t(k)+h/2,d,p(k)+delta2(2)/2,C,g,n(k)+delta1(2)/2);
                    delta1(4)=h*din2pred_f(t(k)+h,r,n(k)+delta1(3),C,p(k)+delta2(3));
                    delta2(4)=h*din2pred_g(t(k)+h,d,p(k)+delta2(3),C,g,n(k)+delta1(3));
                    n(k+1)=n(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    p(k+1)=p(k)+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
                    %for error estimation
                    h=h/2;
                    
                    delta1(1)=h*din2pred_f(t(k),r,n(k),C,p(k));
                    delta2(1)=h*din2pred_g(t(k),d,p(k),C,g,n(k));
                    delta1(2)=h*din2pred_f(t(k)+h/2,r,n(k)+delta1(1)/2,C,p(k)+delta2(1)/2);
                    delta2(2)=h*din2pred_g(t(k)+h/2,d,p(k)+delta2(1)/2,C,g,n(k)+delta1(1)/2);
                    delta1(3)=h*din2pred_f(t(k)+h/2,r,n(k)+delta1(2)/2,C,p(k)+delta2(2)/2);
                    delta2(3)=h*din2pred_g(t(k)+h/2,d,p(k)+delta2(2)/2,C,g,n(k)+delta1(2)/2);
                    delta1(4)=h*din2pred_f(t(k)+h,r,n(k)+delta1(3),C,p(k)+delta2(3));
                    delta2(4)=h*din2pred_g(t(k)+h,d,p(k)+delta2(3),C,g,n(k)+delta1(3));
                    na=n(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    pa=p(k)+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
                
                    delta1(1)=h*din2pred_f(t(k),r,na,C,pa);
                    delta2(1)=h*din2pred_g(t(k),d,pa,C,g,na);
                    delta1(2)=h*din2pred_f(t(k)+h/2,r,na+delta1(1)/2,C,pa+delta2(1)/2);
                    delta2(2)=h*din2pred_g(t(k)+h/2,d,pa+delta2(1)/2,C,g,na+delta1(1)/2);
                    delta1(3)=h*din2pred_f(t(k)+h/2,r,na+delta1(2)/2,C,pa+delta2(2)/2);
                    delta2(3)=h*din2pred_g(t(k)+h/2,d,pa+delta2(2)/2,C,g,na+delta1(2)/2);
                    delta1(4)=h*din2pred_f(t(k)+h,r,na+delta1(3),C,pa+delta2(3));
                    delta2(4)=h*din2pred_g(t(k)+h,d,pa+delta2(3),C,g,na+delta1(3));
                    nb=na+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    pb=pa+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
                    
                    h=2*h;
                    error_abs=error_abs+8/15*(abs(nb-n(k+1))+abs(pb-p(k+1)));
            end
        end
end

axes(handles.axes1)
plot(t,n,'bx-',t,p,'rx-')
set(handles.axes1,'YLim',[0 300])
xlabel('Tiempo')
ylabel('Poblacion')
legend('N','P')
muestre=['error estimation (abs)= ',num2str(error_abs)];
set(handles.text_err,'String',muestre)

% --- Executes during object creation, after setting all properties.
function text_r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_r (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have C white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes during object creation, after setting all properties.
function text_n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_n (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have C white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes during object creation, after setting all properties.
function text_t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_t (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have C white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.

function text_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_a (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have C white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function text_a_Callback(hObject, eventdata, handles)
% hObject    handle to text_a (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_a as text
%        str2double(get(hObject,'String')) returns contents of text_a as C double
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
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have C light gray background, change
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
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_a,'Value');
set(handles.text_a,'String',slid_val);


% --- Executes during object creation, after setting all properties.
function text_K1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_K1 (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have C white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function text_K1_Callback(hObject, eventdata, handles)
% hObject    handle to text_K1 (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_K1 as text
%        str2double(get(hObject,'String')) returns contents of text_K1 as C double
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
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have C light gray background, change
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
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_K1,'Value');
set(handles.text_K1,'String',slid_val);


% --- Executes during object creation, after setting all properties.
function text_d_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_d (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have C white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function text_d_Callback(hObject, eventdata, handles)
% hObject    handle to text_d (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_d as text
%        str2double(get(hObject,'String')) returns contents of text_d as C double


% --- Executes during object creation, after setting all properties.
function slid_d_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_d (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have C light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on slider movement.
function slid_d_Callback(hObject, eventdata, handles)
% hObject    handle to slid_d (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_d,'Value');
set(handles.text_d,'String',slid_val);

% --- Executes during object creation, after setting all properties.
function text_C_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_C (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have C white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function text_C_Callback(hObject, eventdata, handles)
% hObject    handle to text_C (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_C as text
%        str2double(get(hObject,'String')) returns contents of text_C as C double
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
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have C light gray background, change
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
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_C,'Value');
set(handles.text_C,'String',slid_val);

% --- Executes during object creation, after setting all properties.
function text_g_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_g (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have C white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function text_g_Callback(hObject, eventdata, handles)
% hObject    handle to text_g (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_g as text
%        str2double(get(hObject,'String')) returns contents of text_g as C double
val = str2double(get(handles.text_g,'String'));
if  isempty(val) | (val < get(handles.slid_g,'Min')) | (val > get(handles.slid_g,'Max')),
	old_val = get(handles.slid_g,'Value');
	set(handles.text_g,'String',old_val)
else
	set(handles.slid_g,'Value',val)
end

% --- Executes during object creation, after setting all properties.
function slid_g_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_g (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have C light gray background, change
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
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_g,'Value');
set(handles.text_g,'String',slid_val);

% --- Executes during object creation, after setting all properties.
function text_p_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_p (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have C white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function text_p_Callback(hObject, eventdata, handles)
% hObject    handle to text_p (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_p as text
%        str2double(get(hObject,'String')) returns contents of text_p as C double
val = str2double(get(handles.text_p,'String'));
if  isempty(val) | (val < get(handles.slid_p,'Min')) | (val > get(handles.slid_p,'Max')),
	old_val = get(handles.slid_p,'Value');
	set(handles.text_p,'String',old_val)
else
	set(handles.slid_p,'Value',val)
end

% --- Executes during object creation, after setting all properties.
function slid_p_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_p (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have C light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on slider movement.
function slid_p_Callback(hObject, eventdata, handles)
% hObject    handle to slid_p (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_p,'Value');
set(handles.text_p,'String',slid_val);


% --- Executes on button press in but_phase.
function but_phase_Callback(hObject, eventdata, handles)
% hObject    handle to but_phase (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n(1)=get(handles.slid_n,'Value');
p(1)=get(handles.slid_p,'Value');
tmax=get(handles.slid_t,'Value');
r=get(handles.slid_r,'Value');
d=get(handles.slid_d,'Value');
C=get(handles.slid_C,'Value');
g=get(handles.slid_g,'Value');

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
                    n(k+1)=n(k)+h*din2pred_f(t(k),r,n(k),C,p(k));
                    p(k+1)=p(k)+h*din2pred_g(t(k),d,p(k),C,g,n(k));
                    %for error estimation
                    na=n(k)+h/2*din2pred_f(t(k),r,n(k),C,p(k));
                    pa=p(k)+h/2*din2pred_g(t(k),d,p(k),C,g,n(k));
                    nb=na+h/2*din2pred_f(t(k),r,na,C,pa);
                    pb=pa+h/2*din2pred_g(t(k),d,pa,C,g,na);
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
                n(k+1)=n(k)+h*din2pred_f(t(k),r,n(k),C,p(k));
                p(k+1)=p(k)+h*din2pred_g(t(k),d,p(k),C,g,n(k));
                %for error estimation
                na=n(k)+h/2*din2pred_f(t(k),r,n(k),C,p(k));
                pa=p(k)+h/2*din2pred_g(t(k),d,p(k),C,g,n(k));
                nb=na+h/2*din2pred_f(t(k),r,na,C,pa);
                pb=pa+h/2*din2pred_g(t(k),d,pa,C,g,na);
                error_abs=error_abs+(abs(nb-n(k+1))+abs(pb-p(k+1)));
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
                    pp=p(k);
                    error=1;
                    while error>error_max*h/tmax/10
                        J=[1-h*(r-C*pp), h*C*nn;-h*g*C*pp, 1+h*d*g*C*nn];
                        delta=-J\[nn-n(k)-h*din2pred_f(t(k),r,nn,C,pp);pp-p(k)-h*din2pred_g(t(k),d,pp,C,g,nn)];
                        nn=nn+delta(1);
                        pp=pp+delta(2);
                        error=norm([nn-n(k)-h*din2pred_f(t(k),r,nn,C,pp);pp-p(k)-h*din2pred_g(t(k),d,pp,C,g,nn)]);
                    end
                    n(k+1)=nn;
                    p(k+1)=pp;
                    %for error estimation
                    h=h/2;
                    nna=n(k);
                    ppa=p(k);
                    error=1;
                    while error>error_max*h/tmax/10
                        J=[1-h*(r-C*ppa), h*C*nna;-h*g*C*ppa, 1+h*d*g*C*nna];
                        delta=-J\[nna-n(k)-h*din2pred_f(t(k),r,nna,C,ppa);ppa-p(k)-h*din2pred_g(t(k),d,ppa,C,g,nna)];
                        nna=nna+delta(1);
                        ppa=ppa+delta(2);
                        error=norm([nna-n(k)-h*din2pred_f(t(k),r,nna,C,ppa);ppa-p(k)-h*din2pred_g(t(k),d,ppa,C,g,nna)]);
                    end
                    nnb=nna;
                    ppb=ppa;
                    error=1;
                    while error>error_max*h/tmax/10
                        J=[1-h*(r-C*ppb), h*C*nnb;-h*g*C*ppb, 1+h*d*g*C*nnb];
                        delta=-J\[nnb-nna-h*din2pred_f(t(k),r,nnb,C,ppb);ppb-ppa-h*din2pred_g(t(k),d,ppb,C,g,nnb)];
                        nnb=nnb+delta(1);
                        ppb=ppb+delta(2);
                        error=norm([nnb-nna-h*din2pred_f(t(k),r,nnb,C,ppb);ppb-ppa-h*din2pred_g(t(k),d,ppb,C,g,nnb)]);
                    end
                    h=h*2;
                    error_now=abs(nnb-nn)+abs(ppb-pp);
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
                pp=p(k);
                error=1;
                while error>error_max*h/tmax/10
                    J=[1-h*(r-C*pp), h*C*nn;-h*g*C*pp, 1+h*d*g*C*nn];
                    delta=-J\[nn-n(k)-h*din2pred_f(t(k),r,nn,C,pp);pp-p(k)-h*din2pred_g(t(k),d,pp,C,g,nn)];
                    nn=nn+delta(1);
                    pp=pp+delta(2);
                    error=norm([nn-n(k)-h*din2pred_f(t(k),r,nn,C,pp);pp-p(k)-h*din2pred_g(t(k),d,pp,C,g,nn)]);
                end
                n(k+1)=nn;
                p(k+1)=pp;
                %for error estimation
                h=h/2;
                    nna=n(k);
                    ppa=p(k);
                    error=1;
                    while error>error_max*h/tmax/10
                        J=[1-h*(r-C*ppa), h*C*nna;-h*g*C*ppa, 1+h*d*g*C*nna];
                        delta=-J\[nna-n(k)-h*din2pred_f(t(k),r,nna,C,ppa);ppa-p(k)-h*din2pred_g(t(k),d,ppa,C,g,nna)];
                        nna=nna+delta(1);
                        ppa=ppa+delta(2);
                        error=norm([nna-n(k)-h*din2pred_f(t(k),r,nna,C,ppa);ppa-p(k)-h*din2pred_g(t(k),d,ppa,C,g,nna)]);
                    end
                    nnb=nna;
                    ppb=ppa;
                    error=1;
                    while error>error_max*h/tmax/10
                        J=[1-h*(r-C*ppb), h*C*nnb;-h*g*C*ppb, 1+h*d*g*C*nnb];
                        delta=-J\[nnb-nna-h*din2pred_f(t(k),r,nnb,C,ppb);ppb-ppa-h*din2pred_g(t(k),d,ppb,C,g,nnb)];
                        nnb=nnb+delta(1);
                        ppb=ppb+delta(2);
                        error=norm([nnb-nna-h*din2pred_f(t(k),r,nnb,C,ppb);ppb-ppa-h*din2pred_g(t(k),d,ppb,C,g,nnb)]);
                    end
                error_abs=error_abs+abs((nnb-nn)+abs(ppb-pp));
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
                    delta1(1)=h*din2pred_f(t(k),r,n(k),C,p(k));
                    delta2(1)=h*din2pred_g(t(k),d,p(k),C,g,n(k));
                    delta1(2)=h*din2pred_f(t(k)+h/2,r,n(k)+delta1(1)/2,C,p(k)+delta2(1)/2);
                    delta2(2)=h*din2pred_g(t(k)+h/2,d,p(k)+delta2(1)/2,C,g,n(k)+delta1(1)/2);
                    delta1(3)=h*din2pred_f(t(k)+h/2,r,n(k)+delta1(2)/2,C,p(k)+delta2(2)/2);
                    delta2(3)=h*din2pred_g(t(k)+h/2,d,p(k)+delta2(2)/2,C,g,n(k)+delta1(2)/2);
                    delta1(4)=h*din2pred_f(t(k)+h,r,n(k)+delta1(3),C,p(k)+delta2(3));
                    delta2(4)=h*din2pred_g(t(k)+h,d,p(k)+delta2(3),C,g,n(k)+delta1(3));
                    n(k+1)=n(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    p(k+1)=p(k)+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
                    %for error estimation
                    h=h/2;           
                    delta1(1)=h*din2pred_f(t(k),r,n(k),C,p(k));
                    delta2(1)=h*din2pred_g(t(k),d,p(k),C,g,n(k));
                    delta1(2)=h*din2pred_f(t(k)+h/2,r,n(k)+delta1(1)/2,C,p(k)+delta2(1)/2);
                    delta2(2)=h*din2pred_g(t(k)+h/2,d,p(k)+delta2(1)/2,C,g,n(k)+delta1(1)/2);
                    delta1(3)=h*din2pred_f(t(k)+h/2,r,n(k)+delta1(2)/2,C,p(k)+delta2(2)/2);
                    delta2(3)=h*din2pred_g(t(k)+h/2,d,p(k)+delta2(2)/2,C,g,n(k)+delta1(2)/2);
                    delta1(4)=h*din2pred_f(t(k)+h,r,n(k)+delta1(3),C,p(k)+delta2(3));
                    delta2(4)=h*din2pred_g(t(k)+h,d,p(k)+delta2(3),C,g,n(k)+delta1(3));
                    na=n(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    pa=p(k)+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
                
                    delta1(1)=h*din2pred_f(t(k),r,na,C,pa);
                    delta2(1)=h*din2pred_g(t(k),d,pa,C,g,na);
                    delta1(2)=h*din2pred_f(t(k)+h/2,r,na+delta1(1)/2,C,pa+delta2(1)/2);
                    delta2(2)=h*din2pred_g(t(k)+h/2,d,pa+delta2(1)/2,C,g,na+delta1(1)/2);
                    delta1(3)=h*din2pred_f(t(k)+h/2,r,na+delta1(2)/2,C,pa+delta2(2)/2);
                    delta2(3)=h*din2pred_g(t(k)+h/2,d,pa+delta2(2)/2,C,g,na+delta1(2)/2);
                    delta1(4)=h*din2pred_f(t(k)+h,r,na+delta1(3),C,pa+delta2(3));
                    delta2(4)=h*din2pred_g(t(k)+h,d,pa+delta2(3),C,g,na+delta1(3));
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
                    delta1(1)=h*din2pred_f(t(k),r,n(k),C,p(k));
                    delta2(1)=h*din2pred_g(t(k),d,p(k),C,g,n(k));
                    delta1(2)=h*din2pred_f(t(k)+h/2,r,n(k)+delta1(1)/2,C,p(k)+delta2(1)/2);
                    delta2(2)=h*din2pred_g(t(k)+h/2,d,p(k)+delta2(1)/2,C,g,n(k)+delta1(1)/2);
                    delta1(3)=h*din2pred_f(t(k)+h/2,r,n(k)+delta1(2)/2,C,p(k)+delta2(2)/2);
                    delta2(3)=h*din2pred_g(t(k)+h/2,d,p(k)+delta2(2)/2,C,g,n(k)+delta1(2)/2);
                    delta1(4)=h*din2pred_f(t(k)+h,r,n(k)+delta1(3),C,p(k)+delta2(3));
                    delta2(4)=h*din2pred_g(t(k)+h,d,p(k)+delta2(3),C,g,n(k)+delta1(3));
                    n(k+1)=n(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    p(k+1)=p(k)+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
                    %for error estimation
                    h=h/2;
                    
                    delta1(1)=h*din2pred_f(t(k),r,n(k),C,p(k));
                    delta2(1)=h*din2pred_g(t(k),d,p(k),C,g,n(k));
                    delta1(2)=h*din2pred_f(t(k)+h/2,r,n(k)+delta1(1)/2,C,p(k)+delta2(1)/2);
                    delta2(2)=h*din2pred_g(t(k)+h/2,d,p(k)+delta2(1)/2,C,g,n(k)+delta1(1)/2);
                    delta1(3)=h*din2pred_f(t(k)+h/2,r,n(k)+delta1(2)/2,C,p(k)+delta2(2)/2);
                    delta2(3)=h*din2pred_g(t(k)+h/2,d,p(k)+delta2(2)/2,C,g,n(k)+delta1(2)/2);
                    delta1(4)=h*din2pred_f(t(k)+h,r,n(k)+delta1(3),C,p(k)+delta2(3));
                    delta2(4)=h*din2pred_g(t(k)+h,d,p(k)+delta2(3),C,g,n(k)+delta1(3));
                    na=n(k)+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    pa=p(k)+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
                
                    delta1(1)=h*din2pred_f(t(k),r,na,C,pa);
                    delta2(1)=h*din2pred_g(t(k),d,pa,C,g,na);
                    delta1(2)=h*din2pred_f(t(k)+h/2,r,na+delta1(1)/2,C,pa+delta2(1)/2);
                    delta2(2)=h*din2pred_g(t(k)+h/2,d,pa+delta2(1)/2,C,g,na+delta1(1)/2);
                    delta1(3)=h*din2pred_f(t(k)+h/2,r,na+delta1(2)/2,C,pa+delta2(2)/2);
                    delta2(3)=h*din2pred_g(t(k)+h/2,d,pa+delta2(2)/2,C,g,na+delta1(2)/2);
                    delta1(4)=h*din2pred_f(t(k)+h,r,na+delta1(3),C,pa+delta2(3));
                    delta2(4)=h*din2pred_g(t(k)+h,d,pa+delta2(3),C,g,na+delta1(3));
                    nb=na+1/6*(delta1(1)+2*delta1(2)+2*delta1(3)+delta1(4));
                    pb=pa+1/6*(delta2(1)+2*delta2(2)+2*delta2(3)+delta2(4));
                    
                    h=2*h;
                    error_abs=error_abs+8/15*(abs(nb-n(k+1))+abs(pb-p(k+1)));
            end
        end
end

axes(handles.axes1);
plot(n,p,'kx-')
set(handles.axes1,'XLim',[0 300],'YLim',[0 300])
xlabel('poblacion N')
ylabel('poblacion P')
legend('Trayectoria')
iso1x=[d/(g*C),d/(g*C)];
iso1y=[0,280];
iso2x=[0,280];
iso2y=[r/C,r/C];
line(iso1x,iso1y,'Color',[1 0 0],'LineStyle','--','LineWidth',[4])
line(iso2x,iso2y,'Color',[0 0 1],'LineStyle','--','LineWidth',[4])
muestre=['error estimation (abs)= ',num2str(error_abs)];
set(handles.text_err,'String',muestre)

% --- Executes during object creation, after setting all properties.
function text_err_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_err (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have C white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function text_err_Callback(hObject, eventdata, handles)
% hObject    handle to text_err (see GCBO)
% eventdata  reserved - to be defined in C future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_err as text
%        str2double(get(hObject,'String')) returns contents of text_err as C double


