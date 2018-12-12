%first version of data analysis, mostly a sandbox for later ideas

clear; close all;

scan25=dlmread('Chesnel_Apr2018.0025',' ',180);
v25=scan25(:,9);
f25=scan25(:,2);
v25=v25./mean(v25);

scan26=dlmread('Chesnel_Apr2018.0026',' ',180);
v26=scan26(:,9);
f26=scan26(:,2);
v26=v26./mean(v26);

scan27=dlmread('Chesnel_Apr2018.0027',' ',180);
v27=scan27(:,9);
f27=scan27(:,2);
v27=v27./mean(v27);

scan28=dlmread('Chesnel_Apr2018.0028',' ',180);
v28=scan28(:,9);
f28=scan28(:,2);
v28=v28./mean(v28);

scan29=dlmread('Chesnel_Apr2018.0029',' ',180);
v29=scan29(:,9);
f29=scan29(:,2);
v29=v29./mean(v29);

scan30=dlmread('Chesnel_Apr2018.0030',' ',180);
v30=scan30(:,9);
f30=scan30(:,2);
v30=v30./mean(v30);

scan31=dlmread('Chesnel_Apr2018.0031',' ',180);
v31=scan31(:,9);
f31=scan31(:,2);
v31=v31./mean(v31);

scan32=dlmread('Chesnel_Apr2018.0026',' ',180);
v32=scan32(:,9);
f32=scan32(:,2);
v32=v32./mean(v32);

figure;
plot(f25,v25,f26,v26,f27,v27,f28,v28,f29,v29,f30,v30,f31,v31,'c',f32,v32,'k')
title('normalized scan plots')
legend('scan 25','scan 26','scan 27','scan 28','scan 29','scan 30','scan 31','scan 32')

vavg=(v26+v27+v28+v29+v30+v31+v32)./7;

figure;
plot(f25,vavg,f31,v31)
title('average & scan 31')
legend('average','scan 31')