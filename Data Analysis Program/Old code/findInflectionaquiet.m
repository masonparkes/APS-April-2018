function [ Inflection ] = findInflectionaquiet( scans )
%the same as findInflectiona but without displaying a graph
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
    vd=v(ceil(1:size(v,1)/2));
    hd=h(ceil(1:size(v,1)/2));
    step=mean(diff(hd));
    dvdh=diff(vd)./step;
    
       
    
    s=size(vd,1);
    half=floor(s/2);
    reduceddvdh=dvdh(half-floor(.25*s):half+floor(.25*s));
    [~,I]=max(abs(reduceddvdh));
    I=I+half-floor(.25*s)-1;
    hd(I);
    
    Ih=Ih+hd(I);
    
    
end
    Inflection=Ih/n;
   






end

