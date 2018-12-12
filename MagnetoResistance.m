initializeMatrices;

%%Find the sheet resistance as a function of field
vdp=@(R1,R2,r) exp(-pi.*R1./r)+exp(-pi.*R2./r)-1;
%r is the sheet resistance
%R1 is the resistance in one direction (I12V34 & I34V12)
%R2 is the resistance in the perpendicular direction (I14V23 & I23V14)

R1scans=[ConI12,ConI34];
R2scans=[ConI14,ConI23];
R1scans=setdiff(R1scans,[237,224,225]);%Remove some scans that don't seem correct
R2scans=setdiff(R2scans,[198,199,201,202,203,204,205,206,197,226,227,238,109,110,207,200]);%scan 207 didn't make it all the way back to the right field value

[fr1,R1]=avgResistance(R1scans);
[fr2,R2]=avgResistance(R2scans);

figure;
subplot(3,1,1)
title('Resistance 1');
plot(fr1,R1)
subplot(3,1,2)
title('Resistance 2');
plot(fr2,R2);

r=zeros(1,501);
for n=1:501
    fun=@(x) vdp(R1(n),R2(n),x);
    r0=3*(R1(n)+R2(n));
    r(n)=fzero(fun,r0);
    
end

subplot(3,1,3)
plot(fr1,r);
title('Calculated MagnetoResistance');

