function [ output_args ] = descnedingCompare( scans )
%This appears to be a mistaken form of descendingCompare, I don't think its
%ever been used
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
    plot(h(size(v,2)/2:end),v(size(v,2)/2:end));
    
end
    legend;


end


end

