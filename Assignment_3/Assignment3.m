function varargout = Assignment3(varargin)
% ASSIGNMENT3 MATLAB code for Assignment3.fig
%      ASSIGNMENT3, by itself, creates a new ASSIGNMENT3 or raises the existing
%      singleton*.
%
%      H = ASSIGNMENT3 returns the handle to a new ASSIGNMENT3 or the handle to
%      the existing singleton*.
%
%      ASSIGNMENT3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASSIGNMENT3.M with the given input arguments.
%
%      ASSIGNMENT3('Property','Value',...) creates a new ASSIGNMENT3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Assignment3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Assignment3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Assignment3

% Last Modified by GUIDE v2.5 14-Feb-2018 09:59:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Assignment3_OpeningFcn, ...
                   'gui_OutputFcn',  @Assignment3_OutputFcn, ...
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

% --- Executes just before Assignment3 is made visible.
function Assignment3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Assignment3 (see VARARGIN)

% Choose default command line output for Assignment3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Assignment3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Assignment3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text



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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text



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
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text



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



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text



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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PPN = str2double(get(handles.edit1,'String')); %returns contents of edit1 as a double
fs = str2double(get(handles.edit2,'String')); %returns contents of edit2 as a double
intfreq = str2double(get(handles.edit3,'String'));% returns contents of edit3 as a double
msec_to_process = str2double(get(handles.edit4,'String')); %returns contents of edit4 as a double
[e_i,e_q,p_i,p_q,l_i,l_q,carrierfq,codefq] = findandtrack(PPN,fs,intfreq,msec_to_process);

%Axes2
%set(handles.axes2,'Children',h1)
axes(handles.axes2)
plot([1:msec_to_process],p_i .^2 + p_q .^ 2, 'g.-',...
    [1:msec_to_process],e_i .^2 + e_q .^ 2, 'bx-',...
    [1:msec_to_process],l_i .^2 + l_q .^ 2, 'r+-');
xlabel('Test')
legend('Test','Location','best')
set(handles.axes2,'FontSize',8)
grid
xlabel('milliseconds')
ylabel('amplitude')
title('Correlation Results')
legend('prompt','early','late')

%Axes3
axes(handles.axes3)
plot([1:msec_to_process],p_i);
grid
xlabel('milliseconds')
ylabel('amplitude')
title('Prompt I Channel')
set(handles.axes3,'FontSize',8)

%Axes4
axes(handles.axes4)
plot([1:msec_to_process],p_q);
grid
xlabel('milliseconds')
ylabel('amplitude')
title('Prompt Q Channel')
set(handles.axes4,'FontSize',8)

%Axes5
axes(handles.axes5)
plot([1:msec_to_process],1.023e6 - codefq);
grid
xlabel('milliseconds')
ylabel('Hz')
title('Tracked Code Frequency (Deviation from 1.023MHz)')
set(handles.axes5,'FontSize',8)

%Axes6
axes(handles.axes6)
plot([1:msec_to_process],carrierfq);
grid
xlabel('milliseconds')
ylabel('Hz')
title('Tracked Intermediate Frequency')
set(handles.axes6,'FontSize',8)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
spacing=-28.1:0.05:1.1; %recognize these spacings are reversed
[a,b]=size(spacing);
spacing2=spacing(find(spacing==(-spacing(end))):end);
[aa,bb]=size(spacing2);

%set filenames
fid1=fopen('OutDI.bin','rb');
fid2=fopen('OutDQ.bin','rb');
fid3=fopen('OutRI.bin','rb');
fid4=fopen('OutRQ.bin','rb');

%set avging - typical value is 200msec
disp('BiStatic Radar Processing')
avgnum = str2double(get(handles.edit6,'String')); %returns contents of edit6 as a double

%get the first set of data to initiate loop
contloop=1;
[corri,cnt]=fread(fid1,avgnum*bb,'float');
if (cnt ~= avgnum*bb)
    fclose all
    disp('got all the data possible corr_dir_in')
    contloop=0;
end
[corrq,cnt]=fread(fid2,avgnum*bb,'float');
if (cnt ~= avgnum*bb)
    fclose all
    disp('got all the data possible corr_dir_qd')
    contloop=0;
end
[corrii,cnt]=fread(fid3,avgnum*b,'float');
if (cnt ~= avgnum*b)
    fclose all
    disp('got all the data possible corr_rfct_in')
    contloop=0;
end
[corrqq,cnt]=fread(fid4,avgnum*b,'float');
if (cnt ~= avgnum*b)
    fclose all
    disp('got all the data possible corr_rfct_in')
    contloop=0;
end

loopcnt=1;
while (contloop==1) %infinite loop to continue while data in the files
    
    corri=reshape(corri,bb,avgnum);
    corrq=reshape(corrq,bb,avgnum);
    corrii=reshape(corrii,b,avgnum);
    corrqq=reshape(corrqq,b,avgnum);
    
    %----------------------------------------------------------------------
    
    coherent=0;  %set equal to 1 for coherent, or 0 for noncoherent
    if (coherent)
        for inda = 1:avgnum
            [signmax,signind]=max(abs(corri(:,inda)));
            if (corri(signind,inda) >= 0)
                %no need to do anything as already post
            else
                %flip sign to make it pos
                corri(:,inda) = -1 .* corri(:,inda);
                corrq(:,inda) = -1 .* corrq(:,inda);
                corrii(:,inda) = -1 .* corrii(:,inda);
                corrqq(:,inda) = -1 .* corrqq(:,inda);
            end
        end
        di2=sum((corri'));
        dq2=sum((corrq'));
        ri2=sum((corrii'));
        rq2=sum((corrqq'));
    else
        di2=sum(abs(corri'));
        dq2=sum(abs(corrq'));
        ri2=sum(abs(corrii'));
        rq2=sum(abs(corrqq'));
    end
    %----------------------------------------------------------------------
    
    %do the averaging
    %reorder
    di2=di2(bb:-1:1);
    dq2=dq2(bb:-1:1);
    d3=sqrt(di2 .* di2 + dq2 .* dq2);
    d3save(loopcnt,:)=d3;
    
    %find max and normalize
    ddmax=max(d3);
    di2=di2 ./ ddmax;
    dq2 = dq2 ./ ddmax;
    d3 = d3 ./ ddmax;
    
    %do avg
    %reorder
    ri2=ri2(b:-1:1);
    rq2=rq2(b:-1:1);
    r3=sqrt(ri2 .* ri2 + rq2 .* rq2);
    r3save(loopcnt,:)=r3;
    
    %find max and normalize
    rrmax=max(r3); %use for normalization
    [rrmaxrat,jj]=max(r3(66:b)); %use for max ratio
    ii=jj+55;
    ri2=ri2 ./ rrmax;
    rq2 = rq2 ./ rrmax;
    r3 = r3 ./ rrmax;
    
    %plot correlation results
    %figure(100)
    
    %direct signal
    dmin=min([di2 dq2]);
    d3min=min([d3]);
    axes(handles.axes7)
    plot(spacing2,di2,'r.');hold on
    plot(spacing2,di2,'c');hold off
    axis([(spacing2(1)-0.1) (spacing2(end)+0.1) (dmin-0.05) 1.05])
    title('direct (I)')
    set(gca,'Fontsize',8)
    
    axes(handles.axes11)
    plot(spacing2,dq2,'g.');hold on
    plot(spacing2,dq2,'c');hold off
    axis([(spacing2(1)-0.1) (spacing2(end)+0.1) (dmin-0.05) 1.05])
    title('direct (Q)')
    set(gca,'Fontsize',8)
    
    axes(handles.axes13)
    plot(spacing2,d3,'b.');hold on
    plot(spacing2,d3,'m');hold off
    axis([(spacing2(1)-0.1) (spacing2(end)+0.1) (d3min-0.05) 1.05])
    powerrat(loopcnt) = rrmaxrat / ddmax;
    title(['reflected/direct ratio: ',num2str(powerrat(loopcnt))])
    rmin=min([ri2 rq2]);
    r3min=min([r3]);
    set(gca,'Fontsize',8)
    
    axes(handles.axes12)
    plot(-spacing(end:-1:1),ri2,'r.');hold on
    plot(-spacing(end:-1:1),ri2,'c');hold off
    axis([(-spacing(end)-0.1) (-spacing(1)+0.1) (rmin-0.05) 1.05])
    title('reflect (I)')
    set(gca,'Fontsize',8)
    
    axes(handles.axes9)
    plot(-spacing(end:-1:1),rq2,'g.');hold on
    plot(-spacing(end:-1:1),rq2,'c');hold off
    axis([(-spacing(end)-0.1) (-spacing(1)+0.1)  (rmin-0.05) 1.05])
    title('reflect (Q)')
    set(gca,'Fontsize',8)
    
    axes(handles.axes13)
    subplot(224),plot(-spacing(end:-1:1),r3,'b.');hold on
    subplot(224),plot(-spacing(end:-1:1),r3,'m');hold off
    axis([(-spacing(end)-0.1) (-spacing(1)+0.1)  (r3min-0.05) 1.05])
    set(gca,'Fontsize',8)
    %set lower bound on where max can be, in case of direct creeping in
    spthresh=find(spacing > 0.75);
    lwbnd=spthresh(1);
    upbnd=b;
    pathdelay(loopcnt)=293*ii*0.05;
    title(['reflected composite; path delay of ',num2str(pathdelay(loopcnt),6),'m '])
    xlabel(['time elapsed : ',num2str(loopcnt*avgnum/(60*1000),4),' min; Int#:',int2str(loopcnt)])
    
    [corri,cnt]=fread(fid1,avgnum*bb,'float');
    if (cnt ~= avgnum*bb)
        disp('  got all the data possible corr_dir_in')
        contloop=0;
    end
    [corrq,cnt]=fread(fid2,avgnum*bb,'float');
    if (cnt ~= avgnum*bb)
        disp('  got all the data possible corr_dir_qd')
        contloop=0;
    end
    [corrii,cnt]=fread(fid3,avgnum*b,'float');
    if (cnt ~= avgnum*b)
        disp('  got all the data possible corr_rfct_in')
        contloop=0;
    end
    [corrqq,cnt]=fread(fid4,avgnum*b,'float');
    if (cnt ~= avgnum*b)
        disp('  got all the data possible corr_rfct_in')
        contloop=0;
    end
    loopcnt = loopcnt +1 ;
    
    pause(0.001)
end
loopcnt=loopcnt-1;  %adjust for not doing one last iteration

%draw fig of path delay as function of time
figure(200)
subplot(2,1,1),plot((1:loopcnt)*(avgnum/1000),pathdelay,'c');hold on
subplot(2,1,1),plot((1:loopcnt)*(avgnum/1000),pathdelay,'c.');
title(['Estimated Path Delay for Reflected Signal (',int2str(avgnum),' msec avg)'])
ylabel('meters')
xlabel('seconds')
grid
subplot(2,1,2),plot((1:loopcnt)*(avgnum/1000),powerrat,'b.');hold on
subplot(2,1,2),plot((1:loopcnt)*(avgnum/1000),powerrat,'g');hold off
title(['Amplitude Ratio ((reflected max)/(direct max))'])
ylabel('ratio')
xlabel('seconds')
grid
fclose all;


function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
