clear;
close all;

scantotal=149;
start=134;

Inflections=zeros(scantotal,1);
for n=start:scantotal
    Inflections(n)=findInflectiondquiet(n);
end
x=start:scantotal;
plot(x,Inflections(start:scantotal),'*')
xlabel('scan number')
ylabel('Inflection field value')