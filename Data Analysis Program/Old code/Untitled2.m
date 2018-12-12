close all
clear
[v,f]=scanAverage(40);
plot(f,v,':')
hold on
a=25;
b=75;
v1=v(1:a);
v2=v(a+1:b-1);
v3=v(b:end);
plot(f(1:a),v1,f(a+1:b-1),v2,f(b:end),v3)
hold off;
