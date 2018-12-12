%script designed to plot the Hall Coefficients from the data found, I don't
%think it works all the way and I haven't used it in a while.
clear; close all;

start=25;
stop=140;
R0=zeros(stop,1);
for n=start:stop
    string=num2str(n);
    if n==130||n==127||n==129||n==128||n==131||n==132||n==133
        continue
    end
    if size(string,2)==2        
        file=['Chesnel_Apr2018.00', string];
    else 
        file=['Chesnel_Apr2018.0', string];
    end
    scan=dlmread(file,' ',180,0);
    v=scan(:,9);
    v=v./mean(v);
    h=scan(:,2);
    [~,~,RH]=linearSubtract(v,h,3500);
    R0(n)=RH;
end
plot(start:stop,R0(start:stop),'*');
title('Hall Coefficient from different scans')