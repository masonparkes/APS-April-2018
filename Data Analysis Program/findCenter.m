function centerFirst = findCenter(scan)
%findCenter finds the field value halfway between where 
%the slope is largest on the descending and ascending branch 
%   Noise in the data can sometimes yield a larger slope where we don't
%   want it, to prevent this, we will only look for the max slope
%   between certain field values, some smoothing may be necessary

    file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(scan),'.mat'];
    load(file,'fields','voltage');
    if mean(voltage)<0
        voltage=-voltage;
    end
    voltage=smooth(voltage);
    %voltage=smooth(voltage);
    %voltage=smooth(voltage);
    index=1;
    
%     while  fields(index)<-500
%         index=index+1;
%     end
%     afstart=index;
%     while  fields(index)<500
%         index=index+1;
%     end
%     afend=index;
%     
%     af=fields(afstart:afend);%ascending field values
%     
%     while  fields(index)>500
%         index=index+1;
%     end
%     dfstart=index;
%     while   fields(index)>-500
%         index=index+1;
%     end
%     dfend=index;
%     df=fields(dfstart:dfend);%descending field values
%     av=voltage(afstart:afend);%ascending voltages
%     dv=voltage(dfstart:dfend);%descending voltages

while fields(index)<fields(index+1)
    index=index+1;
end
af=fields(1:index);df=fields(index:end);
av=voltage(1:index);dv=voltage(index:end);


    aslope=diff(av); dslope=diff(dv);
    aslope=abs(aslope); dslope=abs(dslope);
    [~,ia]=max(aslope); [~,id]=max(dslope);
    centerFirst=(af(ia-1)+df(id-1))/2;
    %center=df(id);
    
   alength=size(af,1);
   dlength=size(df,1);
   a2slope=zeros(alength,1);
   d2slope=zeros(dlength,1);
   for n=2:alength-1
      a2slope(n)=av(n+1)-2*av(n)+av(n-1); 
   end
   for n=2:dlength-1
      d2slope(n)=dv(n+1)-2*dv(n)+dv(n-1); 
   end
   
   a2slope=abs(a2slope);
   d2slope=abs(d2slope);
   [~,ia2]=max(a2slope); [~,id2]=max(d2slope);
   centerSecond=(af(ia2-1)+df(id2-1))/2;
    
    
    
%     figure;
%     hold on
%     title('ascending');
%     plot(av-mean(av))
%     plot(abs(diff(av)))
%     plot(a2slope)
%     legend('original scan','absolute value of 1st derivative','absolute value of 2nd derivative')
%     hold off
%     
%     figure;
%     hold on
%     title('descending')
%     plot(dv-mean(dv))  
%     plot(abs(diff(dv)))
%     plot(d2slope)
%     legend('original scan','absolute value of 1st derivative','absolute value of 2nd derivative')
% 
%     hold off
%     
%     
%     figure;
%     hold on;
% plot(fields,voltage);
% title(num2str(scan));
% centersfirst=centerFirst*ones(size(voltage));plot(centersfirst,voltage);
% centersfirst=af(ia)*ones(size(voltage));plot(centersfirst,voltage);
% centersfirst=df(id)*ones(size(voltage));plot(centersfirst,voltage);
% centersfirst=af(ia2)*ones(size(voltage));plot(centersfirst,voltage);
% centersfirst=df(id2)*ones(size(voltage));plot(centersfirst,voltage);
% centersSecond=centerSecond*ones(size(voltage));plot(centersSecond,voltage);
% legend('scan','center','ascending nucleation','descending nucleation','ascending nucleation:2nd','descending nucleation:2nd','centers:2nd');        
% 
end


