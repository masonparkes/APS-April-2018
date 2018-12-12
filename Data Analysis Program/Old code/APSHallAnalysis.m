%early attempt to find remove linear and possible quadratic terms from the
%data

clear; close all;

scan=dlmread('Chesnel_Apr2018.0040',' ',180,0);
v=scan(:,9);
f=scan(:,2);
v=v./mean(v);

figure;
plot(f,v)
title('scan 40')



start=38;
stop=62;
fpart=f(start:stop);
vpart=v(start:stop);
[c,~]=fit(fpart,vpart,'poly1');
c=coeffvalues(c);
R0right=c(1);
offsetRight=c(2);

start=1;
stop=8;
fpart=[f(start:stop);f(end-stop-start:end)];
vpart=[v(start:stop);v(end-start-stop:end)];
[c,~]=fit(fpart,vpart,'poly1');
c=coeffvalues(c);
R0left=c(1);
offsetLeft=c(2);

R0=(R0right+R0left)/2;
offset=(offsetRight+offsetLeft)/2;

vladj=v-(R0*f+offset*ones(size(v))); 
figure; 
plot(f,vladj); 
title(['R0= ' num2str(R0)]);

Q=60;
vqadj=v-(R0*f+offset*ones(size(v)))-Q*(vladj).^2; 
figure; 
plot(f,vqadj); 
title(['R0= ' num2str(R0),' Q=',num2str(Q)]);
tic
for n=0:1000002
    
    vqadj=v-Q*(vqadj).^2; 
    
end
toc
figure; 
plot(f,vqadj); 
title([num2str(n),' iterative quad adjustments']);

