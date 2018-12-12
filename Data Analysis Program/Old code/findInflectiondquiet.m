function [ Inflection ] = findInflectiondquiet( scans )
%
%uses the derivative of the voltage to find the field value where the strong
%feature occurs in the data. We can use this to find the exchange bias,
%same as findInflectiond, but without printing out a graph
Ih=0;
for n=1:size(scans,2)
    string=num2str(scans(n));
    if scans(n)==130
        break
    end
    if size(string,2)==2        
          file=['Chesnel_Apr2018.00', string];
    elseif n==130
        continue;
    else 
        file=['Chesnel_Apr2018.0', string];
    
    end
    scan=dlmread(file,' ',180,0);
    v=scan(:,9);
    h=scan(:,2);
    v=v./mean(v);
    vd=v(ceil(size(v,1)/2):end);
    hd=h(ceil(size(v,1)/2):end);
    step=-mean(diff(hd));
    dvdh=diff(vd)./step;
    
       
    
    s=size(vd,1);
    half=floor(s/2);
    reduceddvdh=dvdh(half-floor(.05*s):half+floor(.05*s));
    [~,I]=max(reduceddvdh);
    I=I+half-floor(.05*s)-1;
    hd(I);
    
    Ih=Ih+hd(I);
    
    
end
    Inflection=Ih/n;
   





end

