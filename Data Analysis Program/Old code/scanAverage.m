function [ Vavg,fields ] = scanAverage(scans)
%This function averages voltages from different scans, scans must have
%similar magnetic field values at each voltage location and must also be
%the same size
%It is also a good way yo extract just the voltage and field data for a
%single scan if you just give it one scan to do.
        string=num2str(scans(1));
        if size(string,2)==2        
            file=['Chesnel_Apr2018.00', string];
        else 
            file=['Chesnel_Apr2018.0', string];
        end
        scan=dlmread(file,' ',180,0);
        v=scan(:,9);
        v=v./mean(v);
        sum=v;
    for n=2:size(scans,2)
        string=num2str(scans(n));
        if size(string,2)==2        
            file=['Chesnel_Apr2018.00', string];
        else 
            file=['Chesnel_Apr2018.0', string];
        end
        scan=dlmread(file,' ',180,0);
        v=scan(:,9);
        v=v./mean(v);
        sum=sum+v;
    end
    if size(scans,2)>1
        Vavg=sum./n;
    else Vavg=v;
    end
    fields=scan(:,2);
    %plot(fields,Vavg);

end

