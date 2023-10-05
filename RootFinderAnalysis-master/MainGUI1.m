function varargout = MainGUI1(varargin)
format long

% MAINGUI1 MATLAB code for MainGUI1.fig
%      MAINGUI1, by itself, creates a new MAINGUI1 or raises the existing
%      singleton*.
%
%      H = MAINGUI1 returns the handle to a new MAINGUI1 or the handle to
%      the existing singleton*.
%
%      MAINGUI1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINGUI1.M with the given input arguments.
%
%      MAINGUI1('Property','Value',...) creates a new MAINGUI1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MainGUI1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MainGUI1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MainGUI1

% Last Modified by GUIDE v2.5 13-Dec-2016 21:44:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MainGUI1_OpeningFcn, ...
                   'gui_OutputFcn',  @MainGUI1_OutputFcn, ...
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

% function setGlobalx(val)
% global x
% x = val;
% 
% function r = getGlobalx
% global x
% r = x;


% --- Executes just before MainGUI1 is made visible.
function MainGUI1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MainGUI1 (see VARARGIN)

% Choose default command line output for MainGUI1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MainGUI1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MainGUI1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
    global chosen_method;
    global array;
    global iter;
    global sing_iter;
    sing_iter = 1;
    
    contents = cellstr(get(hObject,'String'));
    method = contents{get(hObject,'Value')};
    if(strcmp(method,'Bisection'))
        chosen_method = 'Bisection';
        input = {'Tolerance','Lower','Upper'};
        answer = inputdlg(input,'Bisection (optional)',[1 50]);
        array = {};
        array = {'tolerance',0.00001,array{:}};
        if ~isempty(answer)
            for i=1:1:3
                if ~isempty(answer{i})
                    switch i
                        case 1
                            array = {'tolerance',eval(answer{i}),array{:}};
                        case 2
                            array = {'lower',eval(answer{i}),array{:}};
                        case 3
                            array = {'upper',eval(answer{i}),array{:}};
                    end
                end
            end
        end
        
    elseif(strcmp(method,'False Position'))
        chosen_method = 'False';
        input = {'Tolerance','Lower','Upper'};
        answer = inputdlg(input,'False Position (optional)',[1 50]);
        array = {};
         array = {'tolerance',0.00001,array{:}};
        if ~isempty(answer)
            for i=1:1:3
                if ~isempty(answer{i})
                    switch i
                        case 1
                            array = {'tolerance',eval(answer{i}),array{:}};
                        case 2
                            array = {'lower',eval(answer{i}),array{:}};
                        case 3
                            array = {'upper',eval(answer{i}),array{:}};
                    end
                end
            end
            array = {'iter',iter,array{:}};
        end
    elseif(strcmp(method,'Fixed Point'))
        chosen_method = 'Fixed';
        set(handles.warning,'Visible','On');
        input = {'Tolerance','initial'};
        answer = inputdlg(input,'Fixed Point (optional)',[1 50]);
        array = {};
         array = {'tolerance',0.00001,array{:}};
        if ~isempty(answer)
            for i=1:1:2
                if ~isempty(answer{i})
                    switch i
                        case 1
                            array = {'tolerance',eval(answer{i}),array{:}};
                        case 2
                            array = {'initial',eval(answer{i}),array{:}};
                    end
                end
            end
            array = {'iter',iter,array{:}};
        end
    elseif(strcmp(method,'Newton Raphson'))
        chosen_method = 'Newton';
        input = {'Tolerance','initial'};
        answer = inputdlg(input,'Newton Raphson (optional)',[1 50]);
        array = {};
         array = {'tolerance',0.00001,array{:}};
        if ~isempty(answer)
            for i=1:1:2
                if ~isempty(answer{i})
                    switch i
                        case 1
                            array = {'tolerance',eval(answer{i}),array{:}};
                        case 2
                            array = {'initial',eval(answer{i}),array{:}};
                    end
                end
            end
        end
    elseif(strcmp(method,'Secant'))
        chosen_method = 'Secant';
        input = {'Tolerance','initial 1','initial 2'};
        answer = inputdlg(input,'Secant (optional)',[1 50]);
        array = {};
         array = {'tolerance',0.00001,array{:}};
        if ~isempty(answer)
            for i=1:1:3
                if ~isempty(answer{i})
                    switch i
                        case 1
                            array = {'tolerance',eval(answer{i})};
                        case 2
                            array = {'initial-1',eval(answer{i}),array{:}};
                        case 3
                            array = {'initial-2',eval(answer{i}),array{:}};
                            
                    end
                end
            end
        end
    else
        errordlg('No Selected Method'); 
    end


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit2_Callback(~, ~, handles)
global funct;
funct = get(handles.edit2,'String');
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
global iter;
iter = (str2num(get(handles.edit3,'String')));

% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global funct;
global iter;
global array;
global chosen_method;
if isempty(funct) 
    i=5
    errordlg('Fill the empty Fields !!');
end

if isempty(iter) 
   iter=50;
end
switch chosen_method;
    case 'Bisection'
        [l,fxl,u,fxu,xr,fxr,ea,rel,elapsedTime,c] = Bisection1(array,funct,iter);
        data={l(1),fxl(1),u(1),fxu(1),xr(1),fxr(1),'-------','------'};
        for i = 2:c
            data=[data;{l(i),fxl(i),u(i),fxu(i),xr(i),fxr(i),ea(i),rel(i)}];
        end
        set(handles.uitable1,'visible','on','Data',data);
        set(handles.root, 'String', xr(end));
        set(handles.time, 'String', elapsedTime);
    case 'False'
        [a,fa,b,fb,xr,fxr,tol,relerr,c,endtime] = False_Position(array,funct);
        data={a(1),fa(1),b(1),fb(1),xr(1),fxr(1),tol(1),relerr(1)};
        for i = 2:c
            data=[data;{a(i),fa(i),b(i),fb(i),xr(i),fxr(i),tol(i),relerr(i)}];
        end
        set(handles.uitable1,'visible','on','Data',data);
        set(handles.root, 'String', xr(end));
        set(handles.time, 'String', endtime );
   case 'Fixed'
        [root_xi , root_xinew ,time_taken ,counter ,state , ea , rel] = fixed(array,funct);
        if state == 'converge'
            data={root_xi(1),'--------',root_xinew(1),'--------','--------','--------',ea(1),rel(1)};
            for i = 2:counter
                data=[data;{root_xi(i),'--------',root_xinew(i),'--------','--------','--------',ea(i),rel(i)}];
            end
            set(handles.uitable1,'visible','on','Data',data);
            set(handles.time, 'String',time_taken);
            set(handles.root, 'String',root_xinew(end));
        else
            errordlg('This function diverges !!');
        end
        
        %set(handles.root, 'String', root_xinew(end));
    case'Secant'
        [a,b,fa,fb,xr,c,tol,trr,exct] = Secant(array,funct,iter);
        data={a(1),fa(1),b(1),fb(1),xr(1),'--------',tol(1),trr(1)};
        for i = 2:c
            data=[data;{a(i),fa(i),b(i),fb(i),xr(i),'--------',tol(i),trr(i)}];
        end
        
        set(handles.uitable1,'visible','on','Data',data);
        set(handles.root, 'String',xr(end));
        set(handles.time, 'String',exct);
    case'Newton'
        [c,xr,a,tol,erel,fa,fxr,endtime] = Newton1(array,funct,iter);
        data={a(1),fa(1),'--------','--------',xr(1),fxr(1),tol(1),erel(1)};
        for i = 2:c(end)
            data=[data;{a(i),fa(i),'--------','--------',xr(i),fxr(i),tol(i),erel(i)}];
        end
        set(handles.uitable1,'visible','on','Data',data);
        set(handles.root, 'String', xr(end));
        set(handles.time, 'String', endtime);
        
               

end
eq=sym(funct);
f=inline(char(eq));
t=[-10,10];
fplot(f,t)


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in single_mode.
function single_mode_Callback(hObject, eventdata, handles)
% hObject    handle to single_mode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sing_iter;
 global chosen_method;
    global array;
    global iter;
    global funct;
switch chosen_method;
    case 'Bisection'
        [l,fxl,u,fxu,xr,fxr,ea,rel,elapsedTime,c] = Bisection1(array,funct,iter);
        if sing_iter <= c
        data={l(1),fxl(1),u(1),fxu(1),xr(1),fxr(1),'-------','------'};
        if sing_iter > 1
        for i = 2:sing_iter
            data=[data;{l(i),fxl(i),u(i),fxu(i),xr(i),fxr(i),ea(i),rel(i)}];
        end
        end
        set(handles.uitable1,'visible','on','Data',data);
            set(handles.root, 'String', xr(sing_iter));
            set(handles.time, 'String',elapsedTime);
            sing_iter = sing_iter +1;
        else
            errordlg('Tolerance is reached !!!');
        end
    case 'False'
        
        [a,fa,b,fb,xr,fxr,tol,relerr,c,endtime] = False_Position(array,funct);
        if sing_iter <= c
            data={a(1),fa(1),b(1),fb(1),xr(1),fxr(1),tol(1),relerr(1)};
            if sing_iter > 1
            for i = 2:sing_iter
                data=[data;{a(i),fa(i),b(i),fb(i),xr(i),fxr(i),tol(i),relerr(i)}];
            end
            end
            
            set(handles.uitable1,'visible','on','Data',data);
            set(handles.root, 'String', xr(sing_iter));
            set(handles.time, 'String', endtime );
            sing_iter = sing_iter +1;
        else
            errordlg('Tolerance is reached !!!');
        end
        
   case 'Fixed'
        [root_xi , root_xinew ,time_taken ,counter ,state , ea , rel] = fixed(array,funct);
        if sing_iter <= counter
        if state == 'converge'
            data={root_xi(1),'--------',root_xinew(1),'--------','--------','--------',ea(1),rel(1)};
            if sing_iter > 1
            for i = 2:sing_iter
                data=[data;{root_xi(i),'--------',root_xinew(i),'--------','--------','--------',ea(i),rel(i)}];
            end
            end
            set(handles.uitable1,'visible','on','Data',data);
            set(handles.time, 'String',time_taken);
            set(handles.root, 'String',root_xinew(end));
            sing_iter = sing_iter +1;
        else
            errordlg('This function diverges !!');
        end
        else
            errordlg('Tolerance is reached !!!');
        end
        
        %set(handles.root, 'String', root_xinew(end));
    case'Secant'
        [a,b,fa,fb,xr,c,tol,trr,exct] = Secant(array,funct,iter);
        if sing_iter <= c
        data={a(1),fa(1),b(1),fb(1),xr(1),'--------',tol(1),trr(1)};
        if sing_iter > 1
        for i = 2:sing_iter
            data=[data;{a(i),fa(i),b(i),fb(i),xr(i),'--------',tol(i),trr(i)}];
        end
        end
        set(handles.uitable1,'visible','on','Data',data);
        set(handles.root, 'String',xr(sing_iter));
        set(handles.time, 'String',exct);
        sing_iter = sing_iter +1;
        else
            errordlg('Tolerance is reached !!!');
        end
    case'Newton'
        [c,xr,a,tol,erel,fa,fxr,endtime] = Newton1(array,funct,iter);
        if sing_iter <= c(end)
        data={a(1),fa(1),'--------','--------',xr(1),fxr(1),tol(1),erel(1)};
        if sing_iter > 1
        for i = 2:sing_iter
            data=[data;{a(i),fa(i),'--------','--------',xr(i),fxr(i),tol(i),erel(i)}];
        end
        end
        set(handles.uitable1,'visible','on','Data',data);
        set(handles.root, 'String',xr(sing_iter));
        set(handles.time, 'String',endtime);
        sing_iter = sing_iter +1;
        else
            errordlg('Tolerance is reached !!!');
        end
end
eq=sym(funct);
f=inline(char(eq));
t=[-10,10];
fplot(f,t)

