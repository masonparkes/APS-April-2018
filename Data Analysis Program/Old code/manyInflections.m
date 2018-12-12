%finds and plots the inflection points of the series between start and stop

clear;
close all;

start=25;
stop=236;

Inflections=zeros(stop,1);

tic
for n=start:stop
    Inflections(n)=findInflectiond(n,0);
end
toc

x=start:stop;
plot(x,Inflections(start:stop),'*')
hold on;
xlabel('scan number')
ylabel('Inflection field value')

% Inflections2=zeros(stop,1);
% 
% tic
% for n=start:stop
%     Inflections2(n)=findInflectiondquiet(n);
% end
% toc
% plot(x,Inflections2(start:stop),'g*')
% xlabel('scan number')
% ylabel('Inflection field value')
% legend('center of 2 derivatives','descending derivative')
% 
% Inflections3=zeros(stop,1);
% tic
% for n=start:stop
%     Inflections3(n)=findInflectionaquiet(n);
% end
% toc
% plot(x,Inflections3(start:stop),'r*')
% xlabel('scan number')
% ylabel('Inflection field value')
% legend('center of 2 derivatives','descending derivative','ascending derivative')