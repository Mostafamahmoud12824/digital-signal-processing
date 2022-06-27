function varargout = Audio_Processing(varargin)
% AUDIO_PROCESSING MATLAB code for Audio_Processing.fig
%      AUDIO_PROCESSING, by itself, creates a new AUDIO_PROCESSING or raises the existing
%      singleton*.
%
%      H = AUDIO_PROCESSING returns the handle to a new AUDIO_PROCESSING or the handle to
%      the existing singleton*.
%
%      AUDIO_PROCESSING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AUDIO_PROCESSING.M with the given input arguments.
%
%      AUDIO_PROCESSING('Property','Value',...) creates a new AUDIO_PROCESSING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Audio_Processing_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Audio_Processing_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Audio_Processing

% Last Modified by GUIDE v2.5 15-Mar-2021 10:41:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Audio_Processing_OpeningFcn, ...
                   'gui_OutputFcn',  @Audio_Processing_OutputFcn, ...
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


% --- Executes just before Audio_Processing is made visible.
function Audio_Processing_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Audio_Processing (see VARARGIN)

% Choose default command line output for Audio_Processing
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Audio_Processing wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Audio_Processing_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Renoise.
function Renoise_Callback(hObject, eventdata, handles)
% hObject    handle to Renoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in echo.
function echo_Callback(hObject, eventdata, handles)
% hObject    handle to echo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

filename=handles.filename;
[x,fs]= audioread(filename);
axes(handles.axes1);
plot(x);
y=x;
y=y-1;
z=x+y;
axes(handles.axes2);
plot(z);


% --- Executes on button press in InVol.
function InVol_Callback(hObject, eventdata, handles)
% hObject    handle to InVol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

filename = handles.filename;
[x,fs] = audioread(filename);
sound(2*x,fs);

% --- Executes on button press in decVol.
function decVol_Callback(hObject, eventdata, handles)
% hObject    handle to decVol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

filename = handles.filename;
[x,fs] = audioread(filename);
sound(0.2*x,fs);

% --- Executes on button press in speed.
function speed_Callback(hObject, eventdata, handles)
% hObject    handle to speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

filename = handles.filename;
[x,fs] = audioread(filename);
speed_factor=1.5;    
y = stretchAudio(x,speed_factor);        
sound(y,fs);
t = (0:size(y,1)-1)/fs;
axes(handles.axes2);
plot(t,y)
axis tight
grid on

% --- Executes on button press in slowDown.
function slowDown_Callback(hObject, eventdata, handles)
% hObject    handle to slowDown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

filename = handles.filename;
[x,fs] = audioread(filename);
speed_factor=.5;    
y = stretchAudio(x,speed_factor);        
sound(y,fs);
t = (0:size(y,1)-1)/fs;
axes(handles.axes2);
plot(t,y)
axis tight
grid on

% --- Executes on button press in addNoise.
function addNoise_Callback(hObject, eventdata, handles)
% hObject    handle to addNoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

y = handles.a;
y = y + randn(size(y));
axes(handles.axes2);
plot(y)
sound(y);

% --- Executes on button press in male.
function male_Callback(hObject, eventdata, handles)
% hObject    handle to male (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

filename = handles.filename;
[x,fs] = audioread(filename);
sound(5*x,1.5*fs)
axes(handles.axes2);
plot(5*x,1.5*fs)


% --- Executes on button press in female.
function female_Callback(hObject, eventdata, handles)
% hObject    handle to female (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

filename = handles.filename;
[x,fs] = audioread(filename);
sound(5*x,0.8*fs)
axes(handles.axes2);
plot(5*x,0.8*fs)

% --- Executes on button press in beeb.
function beeb_Callback(hObject, eventdata, handles)
% hObject    handle to beeb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

fs=8000;
time=1;
t=0:(1/fs):time;
fm=500;
A=0.9;
x=A*cos(2*pi*fm*t);
sound(x,fs)

axes(handles.axes1);
plot(t,x)
%plot(t(1:100),x(1:100));grid;
xlim([0 0.01]), grid

% --- Executes on button press in wnoise.
function wnoise_Callback(hObject, eventdata, handles)
% hObject    handle to wnoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

fs=8000;
time=2;
N=fs*time;
t=linspace(0,time,N);
A=0.1;
x=A*rand(1,N)*2-1;
sound(x,fs)

axes(handles.axes1);
plot(t,x)
%plot(t(1:100),x(1:100));grid;
xlim([0 0.01]), grid

% --- Executes on button press in enterAudio.
function enterAudio_Callback(hObject, eventdata, handles)
% hObject    handle to enterAudio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename, pathname] = uigetfile('*.wav', 'Pick an audio');
if isequal(filename,0) || isequal(pathname,0)
    warndlg('Audio is not selected');
else
    a=audioread(filename);
    axes(handles.axes1);
    plot(a);
%   disp(a);
    handles.filename=filename;
    handles.a=a;
    guidata(hObject, handles);
    helpdlg('Input audio is Selected');
end

% --- Executes on button press in record.
function record_Callback(hObject, eventdata, handles)
% hObject    handle to record (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fs=44100;
time=4;
recObj1 = audiorecorder(fs,16,1); 
helpdlg('Start speaking.')
recordblocking(recObj1, time); 
helpdlg('End of Recording.');
x = getaudiodata(recObj1);     
audiowrite('Recording.wav', x, fs); %to store recorded data named as test.wav
sound(x,fs);
axes(handles.axes1);
plot(x);


% --- Executes on button press in playInput.
function playInput_Callback(hObject, eventdata, handles)
% hObject    handle to playInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a=handles.a;
filename=handles.filename;
[y,fs] = audioread(filename);
sound(a,fs);

% --- Executes on button press in playOutput.
function playOutput_Callback(hObject, eventdata, handles)
% hObject    handle to playOutput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
