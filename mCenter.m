global ia;
global id;
global d;

function [outputArg1,outputArg2] = mCenter(scan)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here




d=1;
file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(scan),'.mat'];
    load(file,'fields','voltage');
    if mean(voltage)<0
        voltage=-voltage;
    end
    index=1;
    while fields(index)<fields(index+1)
        index=index+1;
    end
    af=fields(1:index);df=fields(index:end);
    av=voltage(1:index);dv=voltage(index:end);
    aslope=diff(diff(av)); dslope=diff(diff(dv));
    aslope=abs(aslope); dslope=abs(dslope);
    [~,ia]=max(aslope); [~,id]=max(dslope);
    center=(af(ia)+df(id))/2;   
    
    n=1;
    
    while d==1 && n<3
    
    figure('Position',[200 200 700 700]);
    hold on;
plot(fields,voltage);
title(num2str(scan));
centers=center*ones(size(voltage));plot(centers,voltage);
centers=af(ia)*ones(size(voltage));plot(centers,voltage);
centers=df(id)*ones(size(voltage));plot(centers,voltage);
legend('scan','center','ascending nucleation','descending nucleation');        
    uicontrol('Style','pushbutton',...
    'String','Ascending to the left',...
    'Position',[20 0 100 50],...
    'Callback',@(src,evnt)golefta);
uicontrol('Style','pushbutton',...
    'String','Ascending to the right',...
    'Position',[120 0 100 50],...
    'Callback',@(src,evnt)gorighta);
uicontrol('Style','pushbutton',...
    'String','Descending to the left',...
    'Position',[220 0 100 50],...
    'Callback',@(src,evnt)goleftd);
uicontrol('Style','pushbutton',...
    'String','Descending to the right',...
    'Position',[320 0 100 50],...
    'Callback',@(src,evnt)gorightd);
uicontrol('Style','pushbutton',...
    'String','DONE',...
    'Position',[420 0 100 50],...
    'Callback',@(src,evnt)done);
pause;
n=n+1
    end
end

function done
    d=0;
end

function gorightd
    id=id+1;
end

function gorighta
    ia=ia+1;
end

function goleftd
    id=id-1;
end

function golefta
    ia=ia-1;
end



