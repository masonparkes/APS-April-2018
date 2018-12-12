clear;
close all;

vdp=@(R1,R2,r) exp(-pi.*R1./r)+exp(-pi.*R2./r)-1;
figure;
title('MagnetoResistance Plots');

theScan=209;
Iscan=.035;%current for "thescan"

file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(theScan),'.mat'];
load(file,'fields','voltage');
vscan=voltage;
if mean(vscan)<0
    vscan=-vscan;
end
fscan=fields;


scan1=103;
scan2=108;
I=.02;
plotnum=6;
file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(scan1),'.mat'];
load(file,'fields','voltage');
v1=voltage;
f1=fields;
file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(scan2),'.mat'];
load(file,'fields','voltage');
v2=voltage;
f2=fields;
f=zeros(size(f1));
totalr=zeros(size(f1));
res=f;
R1=f;
R2=f;
if mean(v1)<0
    v1=-v1;
end
if mean(v2)<0
    v2=-v2;
end
for n=1:200
v1i=v1(n);v2i=v2(n);R1(n)=v1i/I;R2(n)=v2i/I;
fun=@(r) vdp(R1(n),R2(n),r);
r0=3*(R1(n)+R2(n));
res(n)=fzero(fun,r0);
f(n)=(f1(n)+f2(n))/2;
end
totalr=totalr+res;
subplot(3,2,plotnum);
newr=interp1(f,res,fscan);
newr=smooth(newr);
vmagneto=newr*Iscan;
vnew=vscan-vmagneto;
title([num2str(scan1),'&',num2str(scan2)]);
plot(fscan,vnew/mean(vnew)-1,fscan,vscan/mean(vscan)-1)
xlabel('Applied Field');
ylabel('voltage');
legend('Subtracted','Raw');


scan1=103;
scan2=109;
I=.02;
plotnum=5;
file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(scan1),'.mat'];
load(file,'fields','voltage');
v1=voltage;
f1=fields;
file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(scan2),'.mat'];
load(file,'fields','voltage');
v2=voltage;
f2=fields;
f=zeros(size(f1));
res=f;
if mean(v1)<0
    v1=-v1;
end
if mean(v2)<0
    v2=-v2;
end
for n=1:200
v1i=v1(n);v2i=v2(n);R1=v1i/I;R2=v2i/I;
fun=@(r) vdp(R1,R2,r);
r0=3*(R1+R2);
res(n)=fzero(fun,r0);
f(n)=(f1(n)+f2(n))/2;
end
totalr=totalr+res;
subplot(3,2,plotnum);
newr=interp1(f,res,fscan);
newr=smooth(newr);
vmagneto=newr*Iscan;
vnew=vscan-vmagneto;
title([num2str(scan1),'&',num2str(scan2)]);
plot(fscan,vnew/mean(vnew)-1,fscan,vscan/mean(vscan)-1)
xlabel('Applied Field');
ylabel('voltage');
legend('Subtracted','Raw');

scan1=109;
scan2=98;
I=.01;
plotnum=1;
file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(scan1),'.mat'];
load(file,'fields','voltage');
v1=voltage;
f1=fields;
file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(scan2),'.mat'];
load(file,'fields','voltage');
v2=voltage;
f2=fields;
f=zeros(size(f1));
res=f;
if mean(v1)<0
    v1=-v1;
end
if mean(v2)<0
    v2=-v2;
end
for n=1:200
v1i=v1(n);v2i=v2(n);R1=v1i/I;R2=v2i/I;
fun=@(r) vdp(R1,R2,r);
r0=3*(R1+R2);
res(n)=fzero(fun,r0);
f(n)=(f1(n)+f2(n))/2;
end
totalr=totalr+res;
subplot(3,2,plotnum);
newr=interp1(f,res,fscan);
newr=smooth(newr);
vmagneto=newr*Iscan;
vnew=vscan-vmagneto;
title([num2str(scan1),'&',num2str(scan2)]);
plot(fscan,vnew/mean(vnew)-1,fscan,vscan/mean(vscan)-1)
xlabel('Applied Field');
ylabel('voltage');
legend('Subtracted','Raw');


scan1=99;
scan2=110;
I=.02;
plotnum=3;
file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(scan1),'.mat'];
load(file,'fields','voltage');
v1=voltage;
f1=fields;
file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(scan2),'.mat'];
load(file,'fields','voltage');
v2=voltage;
f2=fields;
f=zeros(size(f1));
res=f;
if mean(v1)<0
    v1=-v1;
end
if mean(v2)<0
    v2=-v2;
end
for n=1:200
v1i=v1(n);v2i=v2(n);R1=v1i/I;R2=v2i/I;
fun=@(r) vdp(R1,R2,r);
r0=3*(R1+R2);
res(n)=fzero(fun,r0);
f(n)=(f1(n)+f2(n))/2;
end
totalr=totalr+res;
subplot(3,2,plotnum);
newr=interp1(f,res,fscan);
newr=smooth(newr);
vmagneto=newr*Iscan;
vnew=vscan-vmagneto;
title([num2str(scan1),'&',num2str(scan2)]);
plot(fscan,vnew/mean(vnew)-1,fscan,vscan/mean(vscan)-1)
xlabel('Applied Field');
ylabel('voltage');
legend('Subtracted','Raw');


scan1=98;
scan2=107;
I=.01;
plotnum=2;
file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(scan1),'.mat'];
load(file,'fields','voltage');
v1=voltage;
f1=fields;
file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(scan2),'.mat'];
load(file,'fields','voltage');
v2=voltage;
f2=fields;
f=zeros(size(f1));
res=f;
if mean(v1)<0
    v1=-v1;
end
if mean(v2)<0
    v2=-v2;
end
for n=1:200
v1i=v1(n);v2i=v2(n);R1=v1i/I;R2=v2i/I;
fun=@(r) vdp(R1,R2,r);
r0=3*(R1+R2);
res(n)=fzero(fun,r0);
f(n)=(f1(n)+f2(n))/2;
end
totalr=totalr+res;
subplot(3,2,plotnum);
newr=interp1(f,res,fscan);
newr=smooth(newr);
vmagneto=newr*Iscan;
vnew=vscan-vmagneto;
title([num2str(scan1),'&',num2str(scan2)]);
plot(fscan,vnew/mean(vnew)-1,fscan,vscan/mean(vscan)-1)
xlabel('Applied Field');
ylabel('voltage');
legend('Subtracted','Raw');

scan1=99;
scan2=108;
plotnum=4;
I=.02;
file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(scan1),'.mat'];
load(file,'fields','voltage');
v1=voltage;
f1=fields;
file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(scan2),'.mat'];
load(file,'fields','voltage');
v2=voltage;
f2=fields;
f=zeros(size(f1));
res=f;
if mean(v1)<0
    v1=-v1;
end
if mean(v2)<0
    v2=-v2;
end
for n=1:200
v1i=v1(n);v2i=v2(n);R1=v1i/I;R2=v2i/I;
fun=@(r) vdp(R1,R2,r);
r0=3*(R1+R2);
res(n)=fzero(fun,r0);
f(n)=(f1(n)+f2(n))/2;
end
totalr=totalr+res;
subplot(3,2,plotnum);
newr=interp1(f,res,fscan);
newr=smooth(newr);
vmagneto=newr*Iscan;
vnew=vscan-vmagneto;
title([num2str(scan1),'&',num2str(scan2)]);
plot(fscan,vnew/mean(vnew)-1,fscan,vscan/mean(vscan)-1)
xlabel('Applied Field');
ylabel('voltage');
legend('Subtracted','Raw');


scan1=103;
scan2=99;
scan3=110;
scan4=108;
I=.02;
file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(scan1),'.mat'];
load(file,'fields','voltage');
v1=voltage;
f1=fields;
file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(scan2),'.mat'];
load(file,'fields','voltage');
v2=voltage;
f2=fields;
file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(scan3),'.mat'];
load(file,'fields','voltage');
v3=voltage;
f3=fields;
file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(scan4),'.mat'];
load(file,'fields','voltage');
v4=voltage;
f4=fields;
f=zeros(size(f1));
res=f;
if mean(v1)<0
    v1=-v1;
end
if mean(v2)<0
    v2=-v2;
end
if mean(v3)<0
    v3=-v3;
end
if mean(v4)<0
    v4=-v4;
end
errorA=f;
errorB=errorA;
for n=1:200
v1i=v1(n);v2i=v2(n);v3i=v3(n);v4i=v4(n);
R1=v1i/I;R2=v2i/I;R3=v3i/I;R4=v4i/I;
Ra=mean([R1,R2]);Rb=mean([R3,R4]);
errorA(n)=(R1-R2)*100/Ra;errorB(n)=(R3-R4)*100/Rb;
fun=@(r) vdp(R1,R2,r);
r0=3*(R1+R2);
res(n)=fzero(fun,r0);
f(n)=(f1(n)+f2(n)+f3(n)+f4(n))/4;
end
figure;
plot(f,res)
title('Magnetoresistance');
xlabel('Applied Field');
ylabel('Resistance');



