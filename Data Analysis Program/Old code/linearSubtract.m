function [ Vadjusted,fields,R0 ] = linearSubtract( v,f,saturation )
%This is designed to subtract Ordinary Hall Effect (OHE)
%OHE causes a linear contribution to the voltage we read as we go through 
%a magnetization loop
%by finding where the field is saturated, and the sample magnetizaion (Ms)
%shouldn't change anymore we can find the slope of the line, the Ordinary
%Hall Coefficient (OHC)

%This code averages the two slope values from the positive and negative
%saturated voltages

%Returned values are the adjusted (flattened ends) voltage, the field
%values for plotting, and the Calculated OHC

if max(f)>saturation
n=1;
stopleft=1;
while f(n)<-saturation && n<size(f,1)
   n=n+1;
   stopleft=n;
end
startleft=n;
while f(n)>-saturation && n<size(f,1)
    n=n+1;
    startleft=n;
end

fpart2=[f(1:stopleft);f(startleft:end)];
vpart2=[v(1:stopleft);v(startleft:end)];
[c,~]=fit(fpart2,vpart2,'poly1');c=coeffvalues(c);
R0left=c(1);
offsetLeft=c(2);

n=1;%reset n to start at beginning again

startright=n;
while f(n)<saturation && n<size(f,1)
   n=n+1;
   startright=n;
end
stopright=n;
while f(n)>saturation&& n<size(f,1)
    n=n+1;
    stopright=n;
end


fpart1=f(startright:stopright);
vpart1=v(startright:stopright);
[c,~]=fit(fpart1,vpart1,'poly1');c=coeffvalues(c);
R0right=c(1);
offsetRight=c(2);




% figure;
% plot(fpart2,vpart2,'b',fpart1,vpart1,'b',f,v,'g:')

R0=(R0right+R0left)/2;
offset=(offsetRight+offsetLeft)/2;



 vladj=v-(R0*f+offset*ones(size(v))); 
% figure; 
% plot(f,vladj);
% legend('adjusted')
% title(['R0= ' num2str(R0)]);

Vadjusted=vladj;
fields=f;
else
    fields=f;
    Vadjusted=v;
end

end

