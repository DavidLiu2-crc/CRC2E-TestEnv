function varargout = SounderGUI(varargin)

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SounderGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SounderGUI_OutputFcn, ...
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


% --- Executes just before SounderGUI is made visible.
function SounderGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SounderGUI (see VARARGIN)

handles.output = hObject;

% Initialize measurement parameters
set(handles.txtFreq, 'String', '28');
set(handles.txtAtt, 'String', '0');
set(handles.txtSRate, 'String', '200');
set(handles.txtBlockSize, 'String', '10000');
set(handles.txtFPer, 'String', '200');
set(handles.txtOffsetAdjust, 'String', '-5');
set(handles.rdo_preamp, 'Value', 1);

% Initialize the raw data plot
handles.plothandle = plot(handles.raw_plot, 0);
set(handles.raw_plot, 'Color', [0 0 0]);
grid(handles.raw_plot, 'on');
set(handles.raw_plot, 'xcolor', 'w');
set(handles.raw_plot, 'ycolor', 'w');
xlabel(handles.raw_plot, 'Time (\mus)');
ylabel(handles.raw_plot, 'Power (dBm)');
h = title(handles.raw_plot, 'Raw Data'); set(h, 'Color', 'white')

% Populate the impulse response plot
handles.plothandle = plot(handles.ir_plot, 0);
set(handles.ir_plot, 'Color', [0 0 0]);
grid(handles.ir_plot, 'on');
set(handles.ir_plot, 'xcolor', 'w');
set(handles.ir_plot, 'ycolor', 'w');
xlabel(handles.ir_plot, 'Delay (\mus)');
ylabel(handles.ir_plot, 'Power (dBm)');
h = title(handles.ir_plot, 'Impulse Response'); set(h, 'Color', 'white')

% Initialize connect button
set(handles.btnConnect, 'BackgroundColor', 'green');
set(handles.btnConnect, 'String', 'Connect');

% Initialize start button
set(handles.btnGetData, 'Interruptible', 'on');
set(handles.btnGetData, 'Enable', 'off');
set(handles.btnGetData, 'BackgroundColor', 'green');
set(handles.btnGetData, 'String', 'Start Measurement');
set(handles.optVisualize, 'Enable', 'on');
set(handles.optSave, 'Enable', 'on');

% Initialize autoscale radio button
set(handles.rdo_autoscale, 'Value', 1);

% Initialize pan/zoom radio button
zoom off
pan on
set(handles.rdo_zoom, 'Value', 0)

% Update status
set(handles.txtStatus, 'String','   Status: Waiting for user input'); drawnow;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SoundereGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = SounderGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function txtVISAAddress_Callback(hObject, eventdata, handles)
% hObject    handle to txtVISAAddress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtVISAAddress as text
%        str2double(get(hObject,'String')) returns contents of txtVISAAddress as a double


% --- Executes during object creation, after setting all properties.
function txtVISAAddress_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtVISAAddress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function btnConnect_Callback(hObject, eventdata, handles)
% hObject    handle to btnConnect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Create VISA object to connect to
visaObj = instrfind('Tag', 'deepCapture');
if strcmp(get(visaObj, 'Status'), 'open')
    if strcmp(get(handles.btnConnect, 'String'), 'Disconnect')
        fclose(visaObj);
        set(handles.btnGetData, 'BackgroundColor', 'green');
        set(handles.btnGetData, 'String', 'Start Measurement'); drawnow
        set(handles.btnGetData, 'Enable', 'off')
        set(handles.btnConnect, 'BackgroundColor', 'green');
        set(handles.btnConnect, 'String', 'Connect')
        set(handles.txtStatus, 'String', '   Status: PXA disconnected'); drawnow
        return
    end
end

% Update status
set(handles.txtStatus, 'String','   Status: Connecting to PXA ...'); drawnow;

% Get VISA address from GUI
VISAAddresses = get(handles.visa_popup,'String');
VISAValue     = get(handles.visa_popup, 'Value');
VISAAddress   = VISAAddresses{VISAValue}; 

% Create VISA Object to which to connect to
visaObj = instrfind('Tag', 'deepCapture');
if isempty(visaObj)
    visaObj = visa('agilent', VISAAddress, 'Tag', 'deepCapture');
else
    fclose(visaObj);
end

% Get block size
blockSize = str2double(get(handles.txtBlockSize, 'String'));

% Set buffer size - 8 bytes/point * 2 (1 each for I & Q) + additional block for buffer
visaObj.InputBufferSize = (blockSize+1)*8*2;
% Set Endianness of the data
visaObj.ByteOrder = 'bigEndian';
% Set EOS Mode
visaObj.EOSMode = 'read&write';
% Set EOS Character
visaObj.EOSCharCode = 'LF';

% Temporarily set the timeout value to 45 sec
visaObj.Timeout = 45;

% Open VISA interface connection
fopen(visaObj);

% Update status
set(handles.txtStatus,'String','   Status: Initializing PXA ...'); drawnow;

% Reset the analyzer, Clear Error Queue & Status Registers
% set internal alignments to Partial
fprintf(visaObj, '*RST;*CLS');

% Set the timeout value to 5 sec
visaObj.Timeout = 5;

% Check to make sure we are connected to a N9030A
idn = query(visaObj, '*IDN?');
mdlIndx = regexpi(idn, 'N9030A');
if isempty(mdlIndx)
    myException = MException('DeepCapture:Incorrectinstrument','Confirm that you have an X-Series analyzer at the specified VISA address');
    throw(myException);
end

% Set instrument to IQ Basic mode
fprintf(visaObj, ':INST:SEL BASIC');

% Clear error queue and do a mode preset
fprintf(visaObj, '*CLS;*RST');

% configure waveform
fprintf(visaObj, ':CONF:WAV');

% Set center frequency
fprintf(visaObj, [':FREQ:CENT ' get(handles.txtFreq, 'String') ' GHz']);

% Set sampling rate
fprintf(visaObj, [':WAV:SRAT ' get(handles.txtSRate, 'String') ' MHz']);

% Set SCPI Read Format (Possible settings are REAL, 32;  REAL, 64)
fprintf(visaObj, ':FORM REAL,32');

% Initiate a fast capture (deep capture)
fprintf(visaObj, ':INIT:FCAP');

% Query to determine when meausurement is complete
opVal = query(visaObj, '*OPC?');

% % Set the trigger source to EXT1
% fprintf(visaObj, ':TRIG:WAV:SOUR EXT1');

% Set the trigger source to internal (periodic timer)
fprintf(visaObj, ':TRIG:WAV:SOUR FRAM');
fprintf(visaObj, ':TRIG:FRAM:SYNC OFF');
fprintf(visaObj, [':TRIG:FRAM:PER ' get(handles.txtFPer, 'String') ' ms']);

% Set attenuation
fprintf(visaObj, [':POW:ATT ' get(handles.txtAtt, 'String')]);

% Turn internal preamplifier on and set to full frequency range
if get(handles.rdo_preamp, 'Value') == 1
    fprintf(visaObj, ':POW:RF:GAIN:STAT ON');
    fprintf(visaObj, ':POW:GAIN:BAND FULL');
else
    fprintf(visaObj, ':POW:RF:GAIN:STAT OFF');
end

% Enable IF amplifier
% test = query(visaObj, ':IF:GAIN:AUTO?');
% fprintf(visaObj, ':IF:GAIN:AUTO OFF');
% fprintf(visaObj, ':IF:GAIN ON');

% Set capture length in points
% Use an even number when bit packing is AUTO or BIT32
reqPoints = blockSize;
if ~isequal(mod(reqPoints, 2), 0)
    reqPoints = reqPoints + 1;
end
fprintf(visaObj, [':FCAP:LENG ' num2str(reqPoints)]);

% Enable start button
set(handles.btnGetData, 'enable', 'on'); drawnow

% Change connect button to disconnect button
set(handles.btnConnect, 'BackgroundColor', 'red');
set(handles.btnConnect, 'String', 'Disconnect'); drawnow;

% Update status
set(handles.txtStatus, 'String', '   Status: PXA initialized'); drawnow;


% --- Executes on button press in btnGetData.
function btnGetData_Callback(hObject, eventdata, handles)
% hObject    handle to btnGetData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

visaObj = instrfind('Tag', 'deepCapture');
if strcmp(get(visaObj, 'Status'), 'closed')
    return
end

% Change button colour
if strcmp(get(handles.btnGetData, 'String'), 'Start Measurement')
    set(handles.btnGetData, 'BackgroundColor', 'red');
    set(handles.btnGetData, 'String', 'Stop Measurement'); drawnow
    set(handles.optVisualize, 'Enable', 'off');
    set(handles.optSave, 'Enable', 'off');
else
    set(handles.btnGetData, 'BackgroundColor', 'green');
    set(handles.btnGetData, 'String', 'Start Measurement'); drawnow
    set(handles.optVisualize, 'Enable', 'on');
    set(handles.optSave, 'Enable', 'on');
    return
end

% Get center frequency
freqGHz = str2double(get(handles.txtFreq, 'String'));

% Prepare for impulse response calculations
load chirp_140MHz_200MSps.mat
x = transpose(R + j*I);
x = x / sqrt(sum(abs(x).^2));
X = fftshift(fft(x));
W = window(@flattopwin, length(X));
ACF_dB = 20*log10(sum(abs(X).^2)) - 20*log10(sum(W.*abs(X).^2));

% Get sampling rate
SRate = str2double(get(handles.txtSRate, 'String'));

% Get block size
blockSize = str2double(get(handles.txtBlockSize, 'String'));

% Set capture length in points
% Use an even number when bit packing is AUTO or BIT32
reqPoints = blockSize;
if ~isequal(mod(reqPoints, 2), 0)
    reqPoints = reqPoints + 1;
end
fprintf(visaObj,[':FCAP:LENG ' num2str(reqPoints)]);

% Set blockSize for Fast Capture
fprintf(visaObj,[':FCAP:BLOC ' num2str(reqPoints)]);

% Obtain initial time stamp for file names
T0 = now;
fileNameBase = [...
    datestr(T0, 'yyyy'), '.', ...
    datestr(T0, 'mm'), '.', ...
    datestr(T0, 'dd'), '.', ...
    datestr(T0, 'HH'), '.', ...
    datestr(T0, 'MM'), '.', ...
    datestr(T0, 'SS')];

% create data folder
if get(handles.optSave, 'Value') == 1       
    mkdir('Results', fileNameBase);
end

% snapshot counter
count = 0;

while 1
   
    % Update counter
    count = count + 1;

    % Initiate fast capture
    fprintf(visaObj, ':INIT:FCAP');
%     loopTillComplete(visaObj);

    % Obtain time stamp
    T = now;
    
    % Binblock read
    fprintf(visaObj, 'FETCH:FCAP?');
    rawData = binblockread(visaObj, 'float32');
    fread(visaObj, 1);
    
    % Reformat
    iqData = reshape(rawData.', 2, length(rawData)/2).';
    if ~(isempty(iqData))
        iqData = complex(iqData(1:blockSize, 1), iqData(1:blockSize, 2));
    end
    
    if get(handles.optVisualize, 'Value') == 1
        
        % Save current axis limits
        xl = get(handles.raw_plot, 'XLim');
        yl = get(handles.raw_plot, 'YLim');
        
        % Update the raw data plot
        t = 1e6*(0:blockSize-1)/(SRate*1e6);
        raw = 20*log10(abs(iqData)) + 10;   % dBm into 50 ohm load
        plot(handles.raw_plot, t, raw, 'y')
        set(handles.raw_plot, 'Color', [0 0 0]);
        grid(handles.raw_plot, 'on');
        set(handles.raw_plot, 'xcolor', 'w');
        set(handles.raw_plot, 'ycolor', 'w');
        xlabel(handles.raw_plot, 'Time (\mus)');
        ylabel(handles.raw_plot, 'Power (dBm)');
        h = title(handles.raw_plot, 'Raw Data'); set(h, 'Color', 'white')
        
        % Plot thermal noise
        if handles.rdo_kTB.Value == 1
            hold(handles.raw_plot, 'on')
            B = 160e6;
            kTB = -174 + 10*log10(B);
            plot(handles.raw_plot, [min(t) max(t)], [kTB kTB], 'w--')
            hold(handles.raw_plot, 'off')
        end
        
        % Scale axis
        if handles.rdo_autoscale.Value == 0
            set(handles.raw_plot, 'XLim', xl);
            set(handles.raw_plot, 'YLim', yl);
        else
            xlim(handles.raw_plot, [0 max(t)]);
            ylim(handles.raw_plot, 20 * [floor(0.05*min(raw)) ceil(0.05*max(raw))])
        end
        
        % Compute impulse response
        Y = fftshift(fft(iqData));
        ir = 20*log10(abs(ifft(ifftshift(W .* Y .* X)))) + 10;  % dBm into 50 ohm load
        ir = ir - 10*log10(sum(abs(X).^2));
        ir = ir + ACF_dB;                                       % NOTE: amplitude correction needs more work!!
        
        % Save current axis limits
        xl = get(handles.ir_plot, 'XLim');
        yl = get(handles.ir_plot, 'YLim');

        % Update the impulse response plot
        plot(handles.ir_plot, t, ir, 'y')
        set(handles.ir_plot, 'Color', [0 0 0]);
        grid(handles.ir_plot, 'on');
        set(handles.ir_plot, 'xcolor', 'w');
        set(handles.ir_plot, 'ycolor', 'w');
        xlabel(handles.ir_plot, 'Delay (\mus)');
        ylabel(handles.ir_plot, 'Power (dBm)');
        h = title(handles.ir_plot, 'Impulse Response'); set(h, 'Color', 'white')
        
        % Scale axis
        if handles.rdo_autoscale.Value == 0
            set(handles.ir_plot, 'XLim', xl);
            set(handles.ir_plot, 'YLim', yl);
        else
            xlim(handles.ir_plot, [0 max(t)]);
            ylim(handles.ir_plot, 20 * [floor(0.05*min(ir)) ceil(0.05*max(ir))])
        end
       
        drawnow
        
        % Update status
        set(handles.txtStatus, 'String', ['   Status: Measuring data snapshot ', num2str(count)]); drawnow;    
    
    end
    
    if get(handles.optSave, 'Value') == 1
        
        % Save the data
        fileFolder = ['Results/', fileNameBase];
        fileName = [fileNameBase, '-', num2str(count), '.mat'];
        save([fileFolder, '/', fileName], 'iqData', 'freqGHz', 'T');

        % Update status
        set(handles.txtStatus, 'String', ['   Status: Saved data snapshot to ', fileName]); drawnow;  
       
    end

    % Check if user pressed stop button
    if strcmp(get(handles.btnGetData, 'String'), 'Start Measurement')
        break
    end
    
end


function txtFreq_Callback(hObject, eventdata, handles)

visaObj = instrfind('Tag', 'deepCapture');
if strcmp(get(visaObj, 'Status'), 'open')
    fprintf(visaObj, [':FREQ:CENT ' get(hObject, 'String') 'GHz']);
end

function txtFreq_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txtSRate_Callback(hObject, eventdata, handles)

visaObj = instrfind('Tag', 'deepCapture');
if strcmp(get(visaObj, 'Status'), 'open')
    fprintf(visaObj, [':SPAN:SRAT ' get(hObject, 'String') 'MHz']);
end

function txtSRate_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txtAtt_Callback(hObject, eventdata, handles)
% hObject    handle to txtAtt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtFreq as text
%        str2double(get(hObject,'String')) returns contents of txtFreq as a double

% Create VISA Object to which to connect to
visaObj = instrfind('Tag', 'deepCapture');
if strcmp(get(visaObj, 'Status'), 'open')
    fprintf(visaObj, [':POW:ATT ' get(hObject, 'String')]);
end

% --- Executes during object creation, after setting all properties.
function txtAtt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtAtt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function rdoPreamp_Callback(hObject, eventdata, handles)

% Create VISA Object to which to connect to
visaObj = instrfind('Tag', 'deepCapture');
if strcmp(get(visaObj, 'Status'), 'open')
    if handles.rdo_preamp.Value == 1
        fprintf(visaObj, ':POW:RF:GAIN:STAT ON');
        fprintf(visaObj, ':POW:GAIN:BAND FULL');
    else
        fprintf(visaObj, ':POW:RF:GAIN:STAT OFF');
    end
end

% --- Executes during object creation, after setting all properties.
function rdoPreamp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtFreq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txtFPer_Callback(hObject, eventdata, handles)

visaObj = instrfind('Tag', 'deepCapture');
if strcmp(get(visaObj, 'Status'), 'open')
    fprintf(visaObj, [':TRIG:FRAME:PER ' get(hObject, 'String') ' ms']);
end

function txtFPer_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function btnOffsetAdjust_Callback(hObject, eventdata, handles)

visaObj = instrfind('Tag', 'deepCapture');
if strcmp(get(visaObj, 'Status'), 'open')
    fprintf(visaObj, [':TRIG:FRAME:ADJ ' get(handles.txtOffsetAdjust, 'String') ' us']);
end

function rdoZoom_Callback(hObject, eventdata, handles)

if handles.rdo_zoom.Value == 1
    zoom on
    pan off
else
    zoom off
    pan on
end


% --- Executes on selection change in visa_popup.
function visa_popup_Callback(hObject, eventdata, handles)
% hObject    handle to visa_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns visa_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from visa_popup


% --- Executes during object creation, after setting all properties.
function visa_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to visa_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
vAddress = listACEVISAAddresses();
set(hObject, 'String', vAddress);


% --- Executes on button press in viewMLScript.
% function viewMLScript_Callback(hObject, eventdata, handles)
function viewMLScript_Callback(hObject, eventdata, handles)
% hObject    handle to viewMLScript (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
edit('deepCapture.m');


function VISAAddresses = listACEVISAAddresses
%LISTACEVISAADDRESSES returns the VISA resource strings of all instruments configured in Agilent Connection Expert
%   This function returns a cell array of strings, with each cell
%   containing a VISA address of an instrument that has been configured in
%   Agilent Connection Expert. The function assumes that Agilent IO Suite
%   has been installed

% Copyright 2012 MathWorks
% Modification YdJ, 20190926

VISAAddresses = {};
AgilentVISAInfo = instrhwinfo('visa', 'agilent');
for iLoop = 1:length(AgilentVISAInfo.ObjectConstructorName)
    tmp = extractBetween(AgilentVISAInfo.ObjectConstructorName{iLoop}, '''', '''');
    VISAAddresses{end+1} = tmp{2};
end
