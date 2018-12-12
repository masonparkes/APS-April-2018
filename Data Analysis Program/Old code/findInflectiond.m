function [ Inflection,Ih ] = findInflectiond( scans,q_plot )
close all
%uses the derivative of the voltage to find the field value where the strong
%feature occurs in the data. We can use this to find the exchange bias
Ih=zeros(size(scans));
figure;
hold on;
legmat=["my","dog"];
for n=1:size(scans,2)
    string=num2str(scans(n));
    legmat(2*n-1)=string+"d";
    legmat(2*n)=string+ "a";
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
    va=v(1:ceil(size(v,1)/2));
    ha=h(1:ceil(size(v,1)/2));
    stepd=mean(diff(hd));
    stepa=mean(diff(ha));
    
    dvddh=diff(vd)./stepd;
    dvadh=diff(va)./stepa;
    %one of these is probablt better, but I don't know which
%     dvddh=diff(vd)./diff(hd);
%     dvadh=diff(va)./diff(ha);
    
    
    
    hd=hd(1:end-1)+diff(hd);
    ha=ha(1:end-1)+diff(ha);

    
    if q_plot
        
        plot(hd,dvddh,'o',ha,dvadh,'*')
        
    end
    
   
    
    s=size(vd,1);
    half=floor(s/2);
    space=.25;
    
    rdvddh=dvddh(half-floor(space*s):half+floor(space*s));
    rhd=hd(half-floor(space*s):half+floor(space*s));
    [~,Id]=max(abs(rdvddh));
    
    
    rdvadh=dvadh(half-floor(space*s):half+floor(space*s));
    [~,Ia]=max(abs(rdvadh));
    rha=ha(half-floor(space*s):half+floor(space*s));
    
    Ih(n)=(rhd(Id)+rha(Ia))./2;
    
    
    
end
    Inflection=mean(Ih);
    if q_plot
        legend(legmat);
    end



end

