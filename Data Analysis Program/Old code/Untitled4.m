clear;
close all;

start=25;
stop=190;
scans=start:stop;

centers=fakeHysteresis(scans,0);
centers=centers(find(centers));
scans=scans(find(centers));
plot(scans,centers,'*');



Inflections=zeros(stop,1);
for n=start:stop
    Inflections(n)=findInflectiondquiet(n);
end
x=start:stop;
plot(x,Inflections(start:stop),'*')
hold on;
xlabel('scan number')
ylabel('Inflection field value')


% Inflections=zeros(stop,1);
% for n=start:stop
%     Inflections(n)=findInflection(n);
