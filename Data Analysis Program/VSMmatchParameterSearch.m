%%Load the necessary data
vsmdata=csvread("COPDIRMN_FC_300K_00005.csv",1,0);
Mvsm=vsmdata(:,21);
Fvsm=vsmdata(:,14);
sc=197;%the scan were going to try to match
file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(sc),'.mat'];
load(file,'fields','voltage');
if mean(voltage)<0
    voltage=-voltage;
end
Mscan=voltage;
Fscan=fields;
%%ensure they're the same size
[Fvsm,Mvsm]=interp2sizeVSM(Fvsm,Mvsm,101);Mvsm(1)=Mvsm(2);
[Fscan,Mscan]=interp2size(Fscan,Mscan,101);

%noise
noise=rand(size(Mvsm))/8;
newM=Mvsm+noise;
newMtry=zeros(size(newM));
MscanScore=zscore(Mscan);

weight=-1:0.1:1;
spread=-7000:100:7000;
error=zeros(size(weight,2),size(spread,2));
for n=1:size(weight,2)
    for m=1:size(spread,2)
        %%linear component
        linearPart=tanh(Fvsm/spread(m))*weight(n);
        newMtry=-abs(newM+linearPart);
        error(n,m)=sum((zscore(newMtry)-MscanScore).^2);
    end 
end
error=transpose(error);
[W,S]=meshgrid(weight,spread);
hold on;
surf(W,S,error);
xlabel('weight');
ylabel('spread');
zlabel('error');

[M,I]=min(error(:));
[I_row,I_col]=ind2sub(size(error),I);
figure;
hold on;
title('best fit');
linearPart=tanh(Fvsm/spread(I_row))*weight(I_col);
plot(Fvsm,zscore(newM+linearPart),Fscan,MscanScore)
