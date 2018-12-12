function [ output_args ] = descendCompare( scans )
%Plots the descending parts of each data set given in scans
figure;
hold on;
for n=1:size(scans,2)
    string=num2str(scans(n));
    if size(string,2)==2        
          file=['Chesnel_Apr2018.00', string];
    else 
        file=['Chesnel_Apr2018.0', string];
    end
    scan=dlmread(file,' ',180,0);
    v=scan(:,9);
    h=scan(:,2);
    v=v./mean(v);
    vd=v(floor(size(v,1)/2):end);
    hd=h(floor(size(v,1)/2):end);
    plot(hd,vd);
    
end
    legend;


end




