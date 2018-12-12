function [avg] = makePlot(scan)
%makePlot takes any number of scans and plots the average value at each field value for the scans you entered
%   It is designed to be used in a setting where you coud use "hold on" and
%   then several calls of makePlot to plot different situations on the same
%   graph
    scanSize=size(scan,2);
    ftotal=zeros(1,501);
    vtotal=zeros(1,501);
    vraw=[];
    for n=1:scanSize
        sc=scan(n);
        file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(sc),'.mat'];
        load(file,'fields','voltage');
        if mean(voltage)<0
            voltage=-voltage;
        end
        vraw=[vraw;voltage];
        voltage=zscore(voltage);
        [f,v]=interp2size(fields,voltage,501);
        ftotal=ftotal+f;
        vtotal=vtotal+v;
    end
    avg=mean(vraw);
    plot(ftotal./n,vtotal./n)
    
    
end

