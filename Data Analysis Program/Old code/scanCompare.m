function [ output_args ] = scanCompare( scans )
%scanCompare 
%enter in the scans you want to plot next to each other
%   reads any number of scans and plots them with each other. Plots are
%   normalized by deviding by the mean before plotting.
close all;
figure;
hold on
ledgmat=["not","real"];
for n=1:size(scans,2)
    string=num2str(scans(n));
    ledgmat(n)=string;
    if size(string,2)==2        
          file=['Chesnel_Apr2018.00', string];
    else 
        file=['Chesnel_Apr2018.0', string];
    end
    scan=dlmread(file,' ',180,0);
    v=scan(:,9);
    h=scan(:,2);
    v=v./mean(v);
    plot(h,v);
    
end
    legend(ledgmat);


end

