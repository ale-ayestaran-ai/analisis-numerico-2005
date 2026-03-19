function varargout = Metodo(varargin)
% METODO M-file for Metodo.fig
%      METODO, by itself, creates a new METODO or raises the existing
%      singleton*.
%
%      H = METODO returns the handle to a new METODO or the handle to
%      the existing singleton*.
%
%      METODO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in METODO.M with the given input arguments.
%
%      METODO('Property','Value',...) creates a new METODO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Metodo_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Metodo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Metodo

% Last Modified by GUIDE v2.5 17-Feb-2005 02:41:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Metodo_OpeningFcn, ...
                   'gui_OutputFcn',  @Metodo_OutputFcn, ...
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


% --- Executes just before Metodo is made visible.
function Metodo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Metodo (see VARARGIN)

% Choose default command line output for Metodo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Metodo wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.but_ef,'Value',1)
set(handles.chk_adap,'Value',0)
set(handles.text_errtxt,'Visible','Off')
set(handles.text_err,'Visible','Off')
set(handles.slid_err,'Visible','Off')
set(handles.text_tol,'Visible','Off')
set(handles.slid_tol,'Visible','Off')
set(handles.text_toltxt,'Visible','Off')

% --- Outputs from this function are returned to the command line.
function varargout = Metodo_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in but_ef.
function but_ef_Callback(hObject, eventdata, handles)
% hObject    handle to but_ef (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of but_ef
off = [handles.but_eb,handles.but_rk4];
mutual_exclude(off)
set(handles.but_ef,'Value',1)
set(handles.text_tol,'Visible','Off')
set(handles.slid_tol,'Visible','Off')
set(handles.text_toltxt,'Visible','Off')

% --- Executes on button press in but_eb.
function but_eb_Callback(hObject, eventdata, handles)
% hObject    handle to but_eb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of but_eb
off = [handles.but_ef,handles.but_rk4];
mutual_exclude(off)
set(handles.but_eb,'Value',1)
if get(handles.chk_adap,'Value')==0
    set(handles.text_tol,'Visible','On')
    set(handles.slid_tol,'Visible','On')
    set(handles.text_toltxt,'Visible','On')
end

% --- Executes on button press in but_rk4.
function but_rk4_Callback(hObject, eventdata, handles)
% hObject    handle to but_rk4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of but_rk4
off = [handles.but_ef,handles.but_eb];
mutual_exclude(off)
set(handles.but_rk4,'Value',1)
set(handles.text_tol,'Visible','Off')
set(handles.slid_tol,'Visible','Off')
set(handles.text_toltxt,'Visible','Off')

function mutual_exclude(off)
set(off,'Value',0)


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --- Executes on button press in chk_adap.
function chk_adap_Callback(hObject, eventdata, handles)
% hObject    handle to chk_adap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chk_adap
val=get(handles.chk_adap,'Value');
if val==0
    if get(handles.but_eb,'Value')==1
        set(handles.slid_tol,'Visible','On')
        set(handles.text_tol,'Visible','On')
        set(handles.text_toltxt,'Visible','On')
    end
    set(handles.text_errtxt,'Visible','Off')
    set(handles.text_err,'Visible','Off')
    set(handles.slid_err,'Visible','Off')
else
    set(handles.slid_tol,'Visible','Off')
    set(handles.text_tol,'Visible','Off')
    set(handles.text_toltxt,'Visible','Off')
    set(handles.text_errtxt,'Visible','On')
    set(handles.text_err,'Visible','On')
    set(handles.slid_err,'Visible','On')
end


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


% --- Executes on button press in but_act.
function but_act_Callback(hObject, eventdata, handles)
% hObject    handle to but_act (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if get(handles.but_ef,'Value')==1
    ttt(1)=1;
end
if get(handles.but_eb,'Value')==1
    ttt(1)=2;
end
if get(handles.but_rk4,'Value')==1
    ttt(1)=3;
end
ttt(2)=get(handles.slid_h,'Value');
ttt(3)=get(handles.slid_tol,'Value');
ttt(4)=get(handles.chk_adap,'Value');
ttt(5)=get(handles.slid_err,'Value');
csvwrite('params.dat',ttt);


% --- Executes during object creation, after setting all properties.
function text_tol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_tol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function text_tol_Callback(hObject, eventdata, handles)
% hObject    handle to text_tol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_tol as text
%        str2double(get(hObject,'String')) returns contents of text_tol as a double
val = str2double(get(handles.text_tol,'String'));
if  isempty(val) | (val < get(handles.slid_tol,'Min')) | (val > get(handles.slid_tol,'Max')),
	old_val = get(handles.slid_tol,'Value');
	set(handles.text_tol,'String',old_val)
else
	set(handles.slid_tol,'Value',val)
end

% --- Executes during object creation, after setting all properties.
function slid_tol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_tol (see GCBO)
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
function slid_tol_Callback(hObject, eventdata, handles)
% hObject    handle to slid_tol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_tol,'Value');
set(handles.text_tol,'String',slid_val);


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
val = str2double(get(handles.text_err,'String'));
if  isempty(val) | (val < get(handles.slid_err,'Min')) | (val > get(handles.slid_err,'Max')),
	old_val = get(handles.slid_err,'Value');
	set(handles.text_err,'String',old_val)
else
	set(handles.slid_err,'Value',val)
end

% --- Executes during object creation, after setting all properties.
function slid_err_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slid_err (see GCBO)
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
function slid_err_Callback(hObject, eventdata, handles)
% hObject    handle to slid_err (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
slid_val=get(handles.slid_err,'Value');
set(handles.text_err,'String',slid_val);

