
function [allFields,allVoltages] = scanAverage(scans)
%averages the voltage readings for the scans you tell it to do and returns
%the data the same way it gets saved in 
%   Detailed explanation goes here

%     scanSize=size(scans);
%     maxsize=0;
%     for n=1:scanSize(2)
%             scanNum=scans(n);
%             file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(scanNum),'.mat'];
%             load(file,'fields','voltage');
%             if size(voltage,1)>maxsize
%                maxsize=size(voltage,1);
%                
%             end
%             %if I order them from big matrices from small, and then do them
%             %in that order, then interpolation should work a little bit
%             %better.  
%             
%     end
    
    

        scanSize=size(scans,2);
        weight=1/scanSize;
        scanNum=scans(1);
        file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(scanNum),'.mat'];
        load(file,'fields','voltage');
        allFields=fields;
        allVoltages=voltage;
        allVoltages=zscore(allVoltages);
        for n=2:scanSize
            scanNum=scans(n);
            file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(scanNum),'.mat'];
            load(file,'fields','voltage');
%             allFields=[allFields;fields];
%             allVoltages=[allVoltages;voltage];
            voltage=zscore(voltage);
            if size(allVoltages,1)>size(voltage,1)
                scans(n)
                voltage=interp1(fields,voltage,allFields/n); 
                allVoltages=allVoltages+voltage;
                fields=interp1(fields,1:size(allFields,1));
                allFields=allFields*(n+1)/n;
            elseif size(allVoltages,1)<size(voltage,1)
                scans(n)
                inter=interp1(allFields/n,allVoltages/n,fields);
                allVoltages=inter*n;
                allVoltages=allVoltages+voltage;
                inter=interp1(allFields/n,1:size(fields,1))';
                allFields=inter*n;
                
            else
                allFields=allFields+fields;
                allVoltages=allVoltages+voltage;
            end
%             if maxsize~=size(voltage,1)
%                 
%                 fstep=20/maxsize;            
%                 newfields1=-5+fstep:fstep:5;
%                 newfields2=5:-fstep:-5+fstep;
%                 newfields=cat(2,newfields1,newfields2);
%                 newfields=newfields';           
%                 voltage=interp1(fields,voltage,newfields);
%             end
            
            
        end
        allVoltages=allVoltages/scanSize;
        allFields=allFields/scanSize;
        %allFields=allFields/mean(allFields)-1;
        %Norm1=allVoltages/max(allVoltages);
        %Norm2=2*(allVoltages-min(allVoltages))/(max(allVoltages)-min(allVoltages))-1;
        Norm3=zscore(allVoltages);
        %Norm4=allVoltages/mean(allVoltages)-1;
        %figure('Name',['Scan: ',num2str(scans)]);
        %subplot(3,1,2);
        %plot(allFields,Norm1,allFields,Norm2,allFields,Norm3);
        %legend('Divided by max voltage','range set from -1 to 1','z-scores');
        %allVoltages=mean(allVoltages)
        %title('Normalized data')
        %subplot(3,1,1);
        if mean(voltage)<0
            voltage=-voltage;
        end
        plot(fields,voltage)
        %title('Raw Data')
        %subplot(3,1,3)
        %plot(allFields,Norm4);
        %title('Normalized by mean')
        %plot(allFields,Norm3);
        
end

