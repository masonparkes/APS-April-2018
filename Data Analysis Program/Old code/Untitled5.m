close all

scans=[217,223];
string=num2str(scans(1));
        if size(string,2)==2        
            file=['Chesnel_Apr2018.00', string];
        else 
            file=['Chesnel_Apr2018.0', string];
        end
        scan=dlmread(file,' ',180,0);
        v=scan(:,9);
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
        sum=sum+v;
    end
    if size(scans,2)>1
        Vavg=sum./n;
    else
        Vavg=v;
    end
    fields=scan(:,2);
    Vavg=Vavg/mean(Vavg);
    plot(fields,Vavg);
    
    hold on;
    
    [v,f]=scanAverage(scans);
    plot(f,v,'*');
    
    legend('normalized after average','average after normalized')
    hold off;
    
    