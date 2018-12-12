clear;close all;
%This is an attempt to subtract the magnetoresistance from a cross scan



%%Find magnetoresistance
vdp=@(R1,R2,r) exp(-pi.*R1./r)+exp(-pi.*R2./r)-1;

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
for n=1:200
v1i=v1(n);v2i=v2(n);v3i=v3(n);v4i=v4(n);
R1=v1i/I;R2=v2i/I;R3=v3i/I;R4=v4i/I;
Ra=mean([v1i,v2i]);Rb=mean([v3i,v4i]);
fun=@(r) vdp(R1,R2,r);
r0=3*(R1+R2);
res(n)=fzero(fun,r0);
f(n)=(f1(n)+f2(n)+f3(n)+f4(n))/4;
end

%%Load cross scan
for scanNo=47
I=.1;

file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(scanNo),'.mat'];
load(file,'fields','voltage');
vscan=voltage;
fscan=fields;
if mean(vscan)<0
    vscan=-vscan;
end
%Normalized before subtraction
% newr=interp1(f,res,fscan);
% vmagneto=a*newr*I;
% vmagneto=zscore(vmagneto);
% vscan=zscore(vscan);
% vnew=vscan-vmagneto;
% vnew=zscore(vnew);
% vnew=smooth(vnew);

%Subtracted before normalization
newr=interp1(f,res,fscan);
a=.5;%a is a proportionality constant, so a% of the current goes through the corners or something
vmagneto=a*newr*I;
vnew=vscan-vmagneto;
vscan=zscore(vscan);
vnew=zscore(vnew);
vnew=smooth(vnew);
vmagneto=zscore(vmagneto);


figure
plot(fscan,vnew,fscan,vscan,fscan,vmagneto)
legend('Magnetoresistance subtracted','Original Scan','magnetoresistance');
title('Magnetoresistance Subtraction')
end
figure;
plot(fscan,vscan-vmagneto)