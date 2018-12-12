clear;
close all;

[v,f]=scanAverage(140:160);
[v,f]=linearSubtract(v,f,3500);
%% find cross over point
x=7;
while v(x)<v(end-x)
    x=x+1;
end
x=x+5;
y=size(v,1)/2;
y=y+40;
while v(y)<v(end-y)
    y=y+1;
end
%%
y=y+1;
w=.03;
%vtry=[-v(1:x-1)+w*ones(size(v(1:x-1)));v(x:end-x-1);(-v(end-x:end))+w*ones(size(v(end-x:end)))];
%plot(f,v,f,vtry)

vtry=[-v(1:x-1)+w*ones(size(v(1:x-1)));v(x:y);(-v(y+1:end))+w*ones(size(v(y+1:end)))];
plot(f,v,f,vtry)
figure;
vtry=[-v(1:x)+w*ones(size(v(1:x)));v(x+1:y-1);(-v(y:end))+w*ones(size(v(y:end)))];
plot(f,v,f,vtry)


