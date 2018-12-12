function [ Iavg ] = findInflection( scans )
%An early attempt to find inflection points of data sets, findInflectiond
%is what we have been using
Itot=0;
    for n=1:size(scans,2)
        string=num2str(scans(n));
        if scans(n)==130
            continue
        end
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
        for m=1:size(vd,1)
            if hd(m)<1000
                if vd(m)>1
                    if vd(m+1)>1
                        if vd(m+2)>1
                            I=hd(m);
                            Itot=Itot+I;
                            break;
                        end
                    end
                end
            end
        end
    end
    Iavg=Itot/n;
    legend;


end






