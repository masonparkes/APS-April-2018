%Parse logbook
%not in use
%I would use it to store scan information in a matlab format
%so that it would be easier to sort through scans and
%select the ones that I want.
clear;
close all;
data=xlsread('\\ceres\speckle$\APS April 2018\ScanDataLogbook.xlsx');
for n=1:size(data)
    SeriesInfo
    scanNum=data(n,1);
    fieldinfo=data(n,2:6);
    current=data(n,7);
    Iin=data(n,8);
    V=data(n,9);
    theta=data(n,10);
    x=data(n,11);
    y=data(n,12);
    z=data(n,13);
    Intensity=data(n,13);
    T=data(n,14);
    FC=data(n,15);
end

