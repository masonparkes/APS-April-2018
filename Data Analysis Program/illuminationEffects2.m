initializeMatrices;

%%Illumination study

%Detuning
Detuning=180:190;
[~,centers]=findCenters(Detuning);
I0=[250000,177800,84900,62000,44500,28600,22200,16400,14500,12750,9760];
figure;
hold on;
title('Detuning study');
for n=Detuning
   makePlot(n);
   
end
legend('I=250000','I=177800','I=84900','I=62000','I=44500','I=28600','I=22200','I=16400','I=14500','I=12750','I=9760');
xlabel('Applied Field (Gauss)');
ylabel('Voltage');
hold off

figure;
hold on;
title('Detuning study');
plot(I0,centers);
xlabel('Illumination Intensity');ylabel('Calculated Center (V)');
hold off;

%map
figure;
scans=142:158;
ys=[-.6,-1,-1.5,-1.8,-2,-2.2,-2.4,-2.8,-2,-2,-2,-.3,-.6,-.9,-1.2,-1.5,-1.8];
zs=[1,1,.7,.4,.3,.3,.2,0,.1,.5,.7,0,0,0,0,0,0,0,0];
y=-2.8:.1:-.3;
z=0:.1:1;
map=zeros(size(y,2),size(z,2));
for n=1:size(scans,2)
    ynew=find(y==ys(n));
    znew=find(z==zs(n));
    map(ynew,znew)=findCenter(scans(n));
end
map=abs(map);
map=map/max(max(map));
imagesc(map)
%caxis([min(min(map)), max(max(map))]);