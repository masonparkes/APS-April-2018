clear;
close all;

yspace=-3:.1:.6;%This will include all the y values
zspace=0:.1:1;%This will include all the x values
values=zeros(size(zspace,2),size(yspace,2));

ys=[-.6,-1,-1.5,-1.8,-2,-2.2,-2.4,-2.5,-2,-2,-2,-.3,-.6,-.9,-1.2,-1.5,-1.8];
%values in y's are the y coordinates of scans 142-158
zs=[1,1,.7,.4,.3,.3,.2,0,.1,.5,.7,0,0,0,0,0,0];
%values in z's are the z coordinates of scans 142-158

scans=142:158;

for n=1:17
    scan=scans(n);
    center=findCenter(scan);
    bools1=yspace<(ys(n)+1e-10);
    bools2=yspace>(ys(n)-1e-10);
    bools=~abs(bools1-bools2);
    y=find(bools);
    bools1=zspace<(zs(n)+1e-10);
    bools2=zspace>(zs(n)-1e-10);
    bools=~abs(bools1-bools2);
    z=find(bools);
    values(z,y)=center;
end
figure;
values=zeros2avg(values);
imagesc(yspace,zspace,values);
xlabel('y');
ylabel('z');
%If I continue with other points in the logbook, which I'm not sure if the
%beam was on or not, I can find additional data points

yspace=-3:.1:1;%This will include all the y values
zspace=0:.1:5;%This will include all the x values
values=zeros(size(zspace,2),size(yspace,2));

ys=[-.6,-1,-1.5,-1.8,-2,-2.2,-2.4,-2.5,-2,-2,-2,-.3,-.6,-.9,-1.2,-1.5,-1.8,-1.8,.6,0,-.6,-1.2,-1.8,-2.5,.6,.6,-.6,-1.8,-.6,-.6,.6,.6];
%values in y's are the y coordinates of scans 142-158
zs=[1,1,.7,.4,.3,.3,.2,0,.1,.5,.7,0,0,0,0,0,0,0,1,1,1,1,1,1,1,2,2,2,4,5,1,1];
%values in z's are the z coordinates of scans 142-158

scans=[142:165,169:176];

for n=1:size(scans,2)
    scan=scans(n);
    center=findCenter(scan);
    bools1=yspace<(ys(n)+1e-10);
    bools2=yspace>(ys(n)-1e-10);
    bools=~abs(bools1-bools2);
    y=find(bools);
    bools1=zspace<(zs(n)+1e-10);
    bools2=zspace>(zs(n)-1e-10);
    bools=~abs(bools1-bools2);
    z=find(bools);
    values(z,y)=center;
end

%values=interpolateOverZeros(values);
figure;
values=zeros2avg(values);
imagesc(yspace,zspace,values);
xlabel('y');
ylabel('z');

function map=zeros2avg(map)
        s=size(map);
        num=0;
        by=0;
        for i=1:s(1)
            for j=1:s(2)
                if map(i,j)~=0
                    num=num+map(i,j);
                    by=by+1;
                end
            end
        end
        av=num/by;
        for i=1:s(1)
            for j=1:s(2)
                if map(i,j)==0
                    map(i,j)=av;
                end
            end
        end
end

