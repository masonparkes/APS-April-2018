function [fields,resistance] = avgResistance(scans)
%avgResistance takes any number of scans, divides each voltage value in the
%scan by the resistance used for that scan to give the resistance. It then
%averages all the points together to get the average resistance of the
%given scans as a function of applied field.
    newlength=501;
    length=size(scans,2);
    ftotal=zeros(1,newlength);
    rtotal=zeros(1,newlength);
    for n=1:length
        sc=scans(n);
        file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(sc),'.mat'];
        load(file,'fields','voltage');
        if mean(voltage)<0
            voltage=-voltage;
        end
        [f,v]=interp2size(fields,voltage,newlength);
        ftotal=ftotal+f;
        r=v./getCurrent(sc);
        rtotal=rtotal+r;
    end
    fields=ftotal./n;
    resistance=rtotal./n;
        
end

