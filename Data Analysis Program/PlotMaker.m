clear; close all;
%%About
%This script is being made to make the following plots for the APS April
%2018 data:
% 
% Loops at room T:
% Loops at various current for a given configuration
% 
% 
% Loops in different configurations for a given current
% 
% 
% Loops at different angles (theta) for a give current/configuration
% 
% 
% Sextupole configuration: study as a function of the sample theta
% 
% 
% 
% Loops at low T after FC:
% Loops at various current for a given configuration
% 
% 
% Loops in different configurations for a given current
% 
% 
% Loops at different angles (theta) for a give current/configuration
% 
% 
% The effect of illumination: map as a function of Y and Z
% 
% 
% The effect of illumination: before, during and after illumination
% 
% 
% The effect of illumination: plot loops vs light intensity I0 (detuning study)
% 
% 
% Sextupole configuration: study as a function of the sample theta
% 
% 
% 
% Temperature Comparison:
% Loops at room T, vs loops at low T after FC
% 
%The basic idea is to take info from the logbook and store it as sets of
%scans with various properties, so RoomT is the set of scans taken at RoomT
%That should make it pretty easy to pick the ones we want to plot




%make info matrices
All=24:246;
Good=[98:102,36:50,64:66,69,71,73:79,83:93,95,134:177,179:190,209,220,241,107,108,...
    226,109,110,213,222,243,244,103,104,105,106];
%Bad=[51,127:133,191:193,200,210,228];
All=intersect(All,Good);

%%temperature seperations
RoomT=[197:207,209:225,51:113,226:228,238,24:50,191:196,208,229];
RoomT=intersect(RoomT,All);
FCed=setdiff(All,RoomT);
%FCed=setdiff(FCed,130:134);%130

%%Configuration seperations
ConI12=[237,224,225,98:102];
ConI13=[230:233,239:242,139:190,134:138,124:126,114:123,209:212,214:221,51:97,111:113,228,24:50];
ConI14=[198:207,197,107,108,226,227,238];
ConI23=[109,110];
ConI24=[234,235,236,243,244,246,213,222,223,94];
ConI34=[103,104,105,106];
ConfigUnknown=[191:196,208,229];

%%Current seperations
Cur1=34;
Cur2=35;
Cur3=36;
Cur4=37;
Cur5=38;
Cur10=[39,98,96,111,197,107,109,94];
Cur20=[99,114,64:83,97,112,40,45,198,108,110,103];
Cur30=[100,115,51:57,84,47:50,199,201,204];
Cur35=[206,207,209:228,230:246];
Cur40=[101,116,58,85,41,46,202,205,104];
Cur50=[102,139:190,135:137,125,126,117,59,86,88:93,95,113,203];
Cur60=[118,360,87,42,105];
Cur70=119;
Cur80=[120,61,43,106];
Cur90=121;
Cur100=[134,138,124,122,123,62,63,44];
Curp1=[24,25];
Curp2=26;%I=.1 mA
Curp3=27;
Curp4=28;
Curp5=29;
Curp6=30;
Curp7=31;
Curp8=32;
Curp9=33;
%Curlist=[1;2;3;4;5;10;20;30;40;50;60;70;80;90;100;0.1;0.2;0.3;0.4;0.5;0.6;0.7;0.8;0.9];
%Curlist=[1;2;"3";"4";"5";"10";"20";"30";"40";"50";"60";"70";"80";"90";"100";"p1";"p2";"p3";"p4";"p5";"p6";"p7";"p8";"p9"];

%angle seperations
th27=[221,242,243];
th45=[98,96,111,197,107,109,94,99,114,70,83,97,112,198,108,110,103,100,115,84,199,200,201,204,225,241,209,210,211,212,214,220,206,207,226,244,213,222,101,116,85,202,215,104,102,117,86,88,89,90,91,92,93,95,113,203,118,87,105,119,120,106,121,122,123];
th72=[215,216,217,223,224,227,228,223:238,240,245];
th80=72;
th90=[69,70,71,73,124,126,134:176,179:190,218,239,246];
th95=74;
th100=[75,125];
th105=76;
th108=219;
th110=[77,177];
th115=[24:50,64,78];
th120=79;
th123=65;
th125=[66,80];
th130=[51,52,53,54,67,81];
th135=[55-63,68,82,178];


Sextupole=215:246;
Octupole=25:214;

Lit=[180:190,169:174,177:179,139:159,176];

%%
%my idea is to then use some basic relational algebra
%to get the ones I want to plot
%for example to plot all the loops at 30mA 
%with current from 1 to 4 at room temperature
%you'd say union(RoomT,union(Cur30,ConI14))
%I think then you'd want to average the normalized
%versions of those scans together, and then you'd plot 
%them with other currents or something, for example...
%union(RoomT,union(Cur35,ConI14))
%
%
%So what I need to do next is...
%1)figure out how to normalize the data
%2)implement that
%3)update code that averages scans
%4)update code that plots the averages
%%RoomT: Plot various currents for a given configuraton
%configuration I12
% figure;
% title('I-12  V-34')
% sublist=intersect(RoomT,ConI12);
% hold on
% % %Currents=[Cur1;Cur2;Cur3;Cur4;Cur5;Cur10;Cur20;Cur30;Cur35;Cur40;Cur50;Cur60;Cur70;Cur80;Cur90;Curp1;Curp2;Curp3;Curp4;Curp5;Curp6;Curp7;Curp8;Curp9];
% % for n=1:25
% %     toAvg=intersect(Currents(n),sublist);
% %    if sum(size(toAvg)==0)==0
% %     scanAverage(toAvg);
% %    end
% %    
% %    
% % end
% % legend(Curlistlegend);


figure;
title('Room Temp: I12V34, theta=45');
sublist=intersect(RoomT,ConI12);
sublist=intersect(sublist,Octupole);
sublist=intersect(sublist,th45);
sublist=intersect(sublist,Octupole);



hold on
toAvg=intersect(sublist,Cur10);
   a(1)=makePlot(toAvg);
   c(1)=findCenters(toAvg);
toAvg=intersect(sublist,Cur20);
    a(2)=makePlot(toAvg);
    c(2)=findCenters(toAvg);
toAvg=intersect(sublist,Cur30);
    a(3)=makePlot(toAvg);
    c(3)=findCenters(toAvg);
toAvg=intersect(sublist,Cur40);
    a(4)=makePlot(toAvg);
    c(4)=findCenters(toAvg);
toAvg=intersect(sublist,Cur50);
    a(5)=makePlot(toAvg);
    c(5)=findCenters(toAvg);


xlabel('Applied Field (Gauss)');
ylabel('Voltage');
legend('10mA','20mA','30mA','40mA','50mA');
hold off;

figure;
b=[10,20,30,40,50];
plot(b,a,'*-');
average(1)=mean(a);
title('Room Temp: I12V34, theta=45');
xlabel('Current (mA)');
ylabel('Average Voltage');

figure;
plot(b,c,'*-');
title('Room Temp: I12V34, theta=45');
xlabel('Current (mA)');
ylabel('loop center (Gauss)');

clear a;
clear b;
clear c;
%%

figure;
title('Room Temp: I13V24, theta=115');
sublist=intersect(RoomT,ConI13);
sublist=intersect(sublist,th115);
sublist=intersect(sublist,Octupole);

hold on
toAvg=intersect(sublist,Curp1);
    a(1)=makePlot(toAvg);
    c(1)=findCenters(toAvg);
toAvg=intersect(sublist,Curp2);
    a(2)=makePlot(toAvg);
    c(2)=findCenters(toAvg);
toAvg=intersect(sublist,Curp3);
    a(3)=makePlot(toAvg);
    c(3)=findCenters(toAvg);
toAvg=intersect(sublist,Curp4);
    a(4)=makePlot(toAvg);
    c(4)=findCenters(toAvg);
toAvg=intersect(sublist,Curp5);
    a(5)=makePlot(toAvg);
    c(5)=findCenters(toAvg);
toAvg=intersect(sublist,Curp6);
    a(6)=makePlot(toAvg);
    c(6)=findCenters(toAvg);
toAvg=intersect(sublist,Curp7);
    a(7)=makePlot(toAvg);
    c(7)=findCenters(toAvg);
toAvg=intersect(sublist,Curp8);
    a(8)=makePlot(toAvg);
    c(8)=findCenters(toAvg);
toAvg=intersect(sublist,Curp9);
    a(9)=makePlot(toAvg);
    c(9)=findCenters(toAvg);
toAvg=intersect(sublist,Cur1);
    a(10)=makePlot(toAvg);
    c(10)=findCenters(toAvg);
toAvg=intersect(sublist,Cur2);
    a(11)=makePlot(toAvg);
    c(11)=findCenters(toAvg);
toAvg=intersect(sublist,Cur3);
    a(12)=makePlot(toAvg);
    c(12)=findCenters(toAvg);
toAvg=intersect(sublist,Cur4);
    a(13)=makePlot(toAvg);
    c(13)=findCenters(toAvg);
toAvg=intersect(sublist,Cur5);
    a(14)=makePlot(toAvg);
    c(14)=findCenters(toAvg);
toAvg=intersect(sublist,Cur10);
    a(15)=makePlot(toAvg);
    c(15)=findCenters(toAvg);
toAvg=intersect(sublist,Cur20);
    a(16)=makePlot(toAvg);
    c(16)=findCenters(toAvg);
toAvg=intersect(sublist,Cur30);
    a(17)=makePlot(toAvg);
    c(17)=findCenters(toAvg);
toAvg=intersect(sublist,Cur40);
    a(18)=makePlot(toAvg);
    c(18)=findCenters(toAvg);
%toAvg=intersect(sublist,Cur50); there aren't any at that angle and 50 mA
    %makePlot(toAvg);
toAvg=intersect(sublist,Cur60);
    a(19)=makePlot(toAvg);
    c(19)=findCenters(toAvg);
toAvg=intersect(sublist,Cur80);
    a(20)=makePlot(toAvg);
    c(20)=findCenters(toAvg);
toAvg=intersect(sublist,Cur100);
    a(21)=makePlot(toAvg);
    c(21)=findCenters(toAvg);
xlabel('Applied Field (Gauss)');
ylabel('Voltage');
 legend('0.1mA','0.2mA','0.3mA','0.4mA','0.5mA','0.6mA','0.7mA','0.8mA','0.9mA','1mA','2mA','3mA','4mA','5mA','10mA','20mA','30mA','40mA','60mA','80mA','100mA');
 hold off


average(2)=mean(a);

b=[.1,.2,.3,.4,.5,.6,.7,.8,.9,1,2,3,4,5,10,20,30,40,60,80,100];
figure;
plot(b,a,'*-');
title('Room Temp: I13V24, theta=115');
xlabel('Current (mA)');
ylabel('Average Voltage');

figure;
plot(b,c,'*-');
title('Room Temp: I13V24, theta=115');
xlabel('Current (mA)');
ylabel('loop center (Gauss)');

clear a;
clear b;
clear c;

%%


% figure;
% title('Room Temp: I14V23, theta=45');
% sublist=intersect(RoomT,ConI14);
% sublist=intersect(sublist,th45);
% sublist=intersect(sublist,Octupole);
% 
% hold on
% 
% toAvg=intersect(sublist,Cur10);
%     a(1)=makePlot(toAvg);
%     c(1)=findCenters(toAvg);
% toAvg=intersect(sublist,Cur20);
%     a(2)=makePlot(toAvg);
%     c(2)=findCenters(toAvg);
% toAvg=intersect(sublist,Cur30);
%     a(3)=makePlot(toAvg);
%     c(3)=findCenters(toAvg);
% toAvg=intersect(sublist,Cur35);
%     a(4)=makePlot(toAvg);
%     c(4)=findCenters(toAvg);
% toAvg=intersect(sublist,Cur40);
%     a(5)=makePlot(toAvg);
%     c(5)=findCenters(toAvg);
% toAvg=intersect(sublist,Cur50);
%     a(6)=makePlot(toAvg);
%     c(6)=findCenters(toAvg);
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
% legend('10mA','20mA','30mA','35mA','40mA','50mA');
% hold off
% 
% b=[10,20,30,35,40,50];
% figure;
% plot(b,a,'*-');
% title('Room Temp: I14V23, theta=45');
% xlabel('Current (mA)');
% ylabel('Average Voltage');
% 
% figure;
% plot(b,c,'*-');
% title('Room Temp: I14V23, theta=45');
% xlabel('Current (mA)');
% ylabel('loop center (Gauss)');
% 
% clear a;
% clear b;
% clear c;

%%

figure;
title('Room Temp: I23V14, theta=45');
sublist=intersect(RoomT,ConI23);
sublist=intersect(sublist,th45);
sublist=intersect(sublist,Octupole);
hold on
toAvg=intersect(sublist,Cur10);
    a(1)=makePlot(toAvg);
    c(1)=findCenters(toAvg);
toAvg=intersect(sublist,Cur20);
    a(2)=makePlot(toAvg);
    c(2)=findCenters(toAvg);
xlabel('Applied Field (Gauss)');
ylabel('Voltage');
legend('10mA','20mA');
hold off

b=[10,20];
figure;
plot(b,a,'*-');
title('Room Temp: I23V14, theta=45');
xlabel('Current (mA)');
ylabel('Average Voltage');

figure;
plot(b,c,'*-');
title('Room Temp: I23V14, theta=45');
xlabel('Current (mA)');
ylabel('loop center (Gauss)');

clear a;
clear b;
clear c;

%%



figure;
title('Room Temp: I24V13, theta 45');
sublist=intersect(RoomT,ConI24);
sublist=intersect(sublist,th45);
sublist=intersect(sublist,Octupole);
hold on
toAvg=intersect(sublist,Cur10);
    a(1)=makePlot(toAvg);
    c(1)=findCenters(toAvg);
toAvg=intersect(sublist,Cur35);
    a(2)=makePlot(toAvg);
    c(2)=findCenters(toAvg);
xlabel('Applied Field (Gauss)');
ylabel('Voltage');
legend('10mA','35mA');
hold off

b=[10,20];
figure;
plot(b,a,'*-');
title('Room Temp: I24V13, theta 45');
xlabel('Current (mA)');
ylabel('Average Voltage');

figure;
plot(b,c,'*-');
title('Room Temp: I24V13, theta 45');
xlabel('Current (mA)');
ylabel('loop center (Gauss)');

clear a;
clear b;
clear c;

%%


figure;
title('Room Temp: I34V12, theta=45');
sublist=intersect(RoomT,ConI34);
sublist=intersect(sublist,th45);
sublist=intersect(sublist,Octupole);
hold on
toAvg=intersect(sublist,Cur20);
    a(1)=makePlot(toAvg);
    c(1)=findCenters(toAvg);
toAvg=intersect(sublist,Cur40);
    a(2)=makePlot(toAvg);
    c(2)=findCenters(toAvg);
toAvg=intersect(sublist,Cur60);
    a(3)=makePlot(toAvg);
    c(3)=findCenters(toAvg);
toAvg=intersect(sublist,Cur80);
    a(4)=makePlot(toAvg);
    c(4)=findCenters(toAvg);
xlabel('Applied Field (Gauss)');
ylabel('Voltage');
legend('20mA','40mA','60mA','80mA');

hold off;

b=[20,40,60,80];
figure;
plot(b,a,'*-');
title('Room Temp: I34V12, theta=45');
xlabel('Current (mA)');
ylabel('Average Voltage');

figure;
plot(b,c,'*-');
title('Room Temp: I34V12, theta=45');
xlabel('Current (mA)');
ylabel('loop center (Gauss)');

clear a;
clear b;
clear c;

%%

figure;
title('Room Temp: I13V24, theta=45');
sublist=intersect(RoomT,ConI13);
sublist=intersect(sublist,th45);
sublist=intersect(sublist,Octupole);
hold on
toAvg=intersect(sublist,Cur10);
    a(1)=makePlot(toAvg);
    c(1)=findCenters(toAvg);
toAvg=intersect(sublist,Cur20);
    a(2)=makePlot(toAvg);
    c(2)=findCenters(toAvg);
toAvg=intersect(sublist,Cur30);
    a(3)=makePlot(toAvg);
    c(3)=findCenters(toAvg);
toAvg=intersect(sublist,Cur40);
    a(4)=makePlot(toAvg);
    c(4)=findCenters(toAvg);
toAvg=intersect(sublist,Cur50); 
    a(5)=makePlot(toAvg);
    c(5)=findCenters(toAvg);
toAvg=intersect(sublist,Cur60);
    a(6)=makePlot(toAvg);
    c(6)=findCenters(toAvg);
hold off;
xlabel('Applied Field (Gauss)');
ylabel('Voltage');
legend('10mA','20mA','30mA','40mA','50mA','60mA');

b=[10,20,30,40,50,60];
figure;
plot(b,a,'*-');
title('Room Temp: I13V24, theta=45');
xlabel('Current (mA)');
ylabel('Average Voltage');

figure;
plot(b,c,'*-');
title('Room Temp: I34V12, theta=45');
xlabel('Current (mA)');
ylabel('loop center (Gauss)');

clear a;
clear b;
clear c;

%%

figure;
title('Field Cooled: I13V24, theta=45');
sublist=intersect(FCed,ConI13);
sublist=intersect(sublist,th45);
sublist=intersect(sublist,Octupole);
hold on;

toAvg=intersect(sublist,Cur20);
    a(1)=makePlot(toAvg);
    c(1)=findCenters(toAvg);
toAvg=intersect(sublist,Cur30);
    a(2)=makePlot(toAvg);
    c(2)=findCenters(toAvg);
toAvg=intersect(sublist,Cur40);
    a(3)=makePlot(toAvg);
    c(3)=findCenters(toAvg);
toAvg=intersect(sublist,Cur50);
    a(4)=makePlot(toAvg);
    c(4)=findCenters(toAvg);
toAvg=intersect(sublist,Cur60);
    a(5)=makePlot(toAvg);
    c(5)=findCenters(toAvg);
toAvg=intersect(sublist,Cur70);
    a(6)=makePlot(toAvg);
    c(6)=findCenters(toAvg);
toAvg=intersect(sublist,Cur80);
    a(7)=makePlot(toAvg);
    c(7)=findCenters(toAvg);
toAvg=intersect(sublist,Cur90);
    a(8)=makePlot(toAvg);
    c(8)=findCenters(toAvg);
toAvg=intersect(sublist,Cur100);
    a(9)=makePlot(toAvg);
    c(9)=findCenters(toAvg);
hold off;

xlabel('Applied Field (Gauss)');
ylabel('Voltage')
legend('20mA','30mA','40mA','50mA','60mA','70mA','80mA','90mA','100mA');

figure;
b=[20,30,40,50,60,70,80,90,100];
plot(b,a,'*-');
title('Field Cooled: I13V24, theta=45');
xlabel('Current (mA)');
ylabel('Average Voltage');

figure;
plot(b,c,'*-');
title('Field Cooled: I13V24, theta=45');
xlabel('Current (mA)');
ylabel('loop center (Gauss)');

clear a;
clear b;
clear c;

%%


% figure;
% sublist=ConI13;%intersect(th45,ConI13);
% sublist=intersect(sublist,Octupole);
% sublist=intersect(sublist,Cur50);
% sublist2=setdiff(sublist,Lit);
% toAvg1=intersect(sublist2,RoomT);
%     a(1)=makePlot(toAvg1);
%     [c(1),d]=findCenters(toAvg1);
% toAvg2=intersect(sublist2,FCed);
%     a(2)=makePlot(toAvg2);
%     [c(2),e]=findCenters(toAvg2);
% toAvg3=intersect(sublist,Lit);
%     a(3)=makePlot(toAvg3);
%     [c(3),f]=findCenters(toAvg3);
%     
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage')
% legend('Room Temp','Field Cooled','Lit');
% 
% b=[1,2,3];
% 
% 
% 
% figure;
% plot(b,c,'*');
% title('I13V24, 50mA Field Cooled vs Room Temp vs Lit');
% xlabel('nothing');
% ylabel('loop center (Gauss)');
% 
% p=25;
% range=[-300 0];
% 
% %Remove outliers
% % d=d(2:9);
% % e=d(3:end);
% % f=[f(1:28);f(31:end)];
% 
% 
% subplot(1,3,1);
% boxplot(d,'Labels',['mean=',num2str(mean(d))]);
% title('Room Temperature');
% ylim(range)
% hold on
% plot(mean(d),'dg')
% %plot(trimmean(d,p),'dc')
% hold off;
% 
% subplot(1,3,2);
% boxplot(e,'Labels',['mean=',num2str(mean(e))]);
% title('Field Cooled');
% ylim(range)
% hold on
% plot(mean(e),'dg')
% %plot(trimmean(e,p),'dc')
% hold off;
% 
% 
% subplot(1,3,3);
% boxplot(f,'Labels',['mean=',num2str(mean(f))]);
% title('Illuminated');
% ylim(range)
% hold on
% plot(mean(f),'dg')
% %plot(trimmean(f,p),'dc')
% legend('mean')
% hold off;
% 
% 
% 
% 
% clear a;
% clear b;
% clear c;
% 
%%Ploting different configurations for the same current

% figure;
% hold on
% title('Room Temp: I=10 mA th=45')
% sublist=intersect(Octupole,RoomT);
% sublist=intersect(sublist,Cur10);
% sublist=intersect(sublist,th45);
% 
% toPlot=intersect(sublist,ConI12);
% makePlot(toPlot);
% % toPlot=intersect(sublist,ConI13);
% % makePlot(toPlot);
% toPlot=intersect(sublist,ConI14);
% makePlot(toPlot);
% toPlot=intersect(sublist,ConI23);
% makePlot(toPlot);
% % toPlot=intersect(sublist,ConI24);
% % makePlot(toPlot);
% hold off
% legend('I12V34','I14V23','I23V24');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage')



% figure;
% hold on
% title('Room Temp: I=20 mA th=45 Cross Configurations')
% sublist=intersect(Octupole,RoomT);
% sublist=intersect(sublist,Cur20);
% sublist=intersect(sublist,th45);
% 
% % toPlot=intersect(sublist,ConI12);
% % makePlot(toPlot);
% toPlot=intersect(sublist,ConI13);
% makePlot(toPlot);
% % toPlot=intersect(sublist,ConI14);
% % makePlot(toPlot);
% % toPlot=intersect(sublist,ConI23);
% % makePlot(toPlot);
% % toPlot=intersect(sublist,ConI34);
% % makePlot(toPlot);
% hold off
% legend('I12V34','I13V24','I14V23','I23V24','I34V12');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage')
% 
% figure;
% hold on
% title('Room Temp: I=20 mA th=45 Parallel Configurations')
% sublist=intersect(Octupole,RoomT);
% sublist=intersect(sublist,Cur20);
% sublist=intersect(sublist,th45);
% 
% toPlot=intersect(sublist,ConI12);
% makePlot(toPlot);
% % toPlot=intersect(sublist,ConI13);
% % makePlot(toPlot);
% toPlot=intersect(sublist,ConI14);
% makePlot(toPlot);
% toPlot=intersect(sublist,ConI23);
% makePlot(toPlot);
% toPlot=intersect(sublist,ConI34);
% makePlot(toPlot);
% hold off
% legend('I12V34','I13V24','I14V23','I23V24','I34V12');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage')
% 
% figure;
% hold on
% title('Room Temp: I=20 mA th=45 Cross Configuration')
% sublist=intersect(Octupole,RoomT);
% sublist=intersect(sublist,Cur20);
% sublist=intersect(sublist,th45);
% 
% % toPlot=intersect(sublist,ConI12);
% % makePlot(toPlot);
% toPlot=intersect(sublist,ConI13);
% makePlot(toPlot);
% toPlot=intersect(sublist,ConI14);
% makePlot(toPlot);
% % toPlot=intersect(sublist,ConI23);
% % makePlot(toPlot);
% % toPlot=intersect(sublist,ConI34);
% % makePlot(toPlot);
% hold off
% legend('I13V24','I14V23');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage')
% 
% figure;
% hold on
% title('Room Temp: I=30 mA th=45')
% sublist=intersect(Octupole,RoomT);
% sublist=intersect(sublist,Cur30);
% sublist=intersect(sublist,th45);
% 
% toPlot=intersect(sublist,ConI12);
% makePlot(toPlot);
% toPlot=intersect(sublist,ConI13);
% makePlot(toPlot);
% toPlot=intersect(sublist,ConI14);
% makePlot(toPlot);
% hold off
% legend('I12V34','I13V24','I14V23');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage')
% 
% figure;
% hold on
% title('Room Temp: I=30 mA th=45')
% sublist=intersect(Octupole,RoomT);
% sublist=intersect(sublist,Cur30);
% sublist=intersect(sublist,th45);
% 
% toPlot=intersect(sublist,ConI12);
% makePlot(toPlot);
% toPlot=intersect(sublist,ConI13);
% makePlot(toPlot);
% toPlot=intersect(sublist,ConI14);
% makePlot(toPlot);
% hold off
% legend('I12V34','I13V24','I14V23');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage')
% 
% figure;
% hold on
% title('Room Temp: I=35 mA th=45')
% sublist=intersect(Octupole,RoomT);
% sublist=intersect(sublist,Cur35);
% sublist=intersect(sublist,th45);
% 
% toPlot=intersect(sublist,ConI12);
% makePlot(toPlot);
% toPlot=intersect(sublist,ConI13);
% makePlot(toPlot);
% toPlot=intersect(sublist,ConI14);
% makePlot(toPlot);
% toPlot=intersect(sublist,ConI24);
% makePlot(toPlot);
% 
% hold off
% legend('I12V34','I13V24','I14V23','I24V13');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage')
% 
% figure;
% hold on
% title('Room Temp: I=35 mA th=72')
% sublist=intersect(Octupole,RoomT);
% sublist=intersect(sublist,Cur35);
% sublist=intersect(sublist,th72);
% 
% toPlot=intersect(sublist,ConI12);
% makePlot(toPlot);
% toPlot=intersect(sublist,ConI13);
% makePlot(toPlot);
% toPlot=intersect(sublist,ConI14);
% makePlot(toPlot);
% 
% hold off
% legend('I12V34','I13V24','I14V23');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage')
% 
% figure;
% hold on
% title('Room Temp: I=35 mA th=27')
% sublist=intersect(Octupole,RoomT);
% sublist=intersect(sublist,Cur35);
% sublist=intersect(sublist,th27);
% 
% toPlot=intersect(sublist,ConI12);
% makePlot(toPlot);
% toPlot=intersect(sublist,ConI13);
% makePlot(toPlot);
% 
% toPlot=intersect(sublist,ConI24);
% makePlot(toPlot);
% 
% hold off
% legend('I12V34','I13V24','I24V13');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage')
% 
% figure;
% hold on
% title('Room Temp: I=40 mA th=45')
% sublist=intersect(Octupole,RoomT);
% sublist=intersect(sublist,Cur40);
% sublist=intersect(sublist,th45);
% 
% toPlot=intersect(sublist,ConI12);
% makePlot(toPlot);
% toPlot=intersect(sublist,ConI13);
% makePlot(toPlot);
% toPlot=intersect(sublist,ConI14);
% makePlot(toPlot);
% toPlot=intersect(sublist,ConI24);
% makePlot(toPlot);
% 
% hold off
% legend('I12V34','I13V24','I14V23','I24V13');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage')
% 
% figure;
% hold on
% title('Room Temp: I=50 mA th=45')
% sublist=intersect(Octupole,RoomT);
% sublist=intersect(sublist,Cur50);
% sublist=intersect(sublist,th45);
% 
% toPlot=intersect(sublist,ConI12);
% makePlot(toPlot);
% toPlot=intersect(sublist,ConI13);
% makePlot(toPlot);
% 
% hold off
% legend('I12V34','I13V24');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage')
% 
% figure;
% hold on
% title('Room Temp: I=60 mA th=45')
% sublist=intersect(Octupole,RoomT);
% sublist=intersect(sublist,Cur60);
% sublist=intersect(sublist,th45);
% 
% toPlot=intersect(sublist,ConI13);
% makePlot(toPlot);
% toPlot=intersect(sublist,ConI34);
% makePlot(toPlot);
% 
% hold off
% legend('I13V24','I34V23');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage')
% 
% %%Same current and configuration different angles
% figure;
% hold on;
% title('Room Temp: I=10, Configuration: I13,V24')
% sublist=intersect(Octupole,RoomT);
% sublist=intersect(sublist,Cur10);
% sublist=intersect(sublist,ConI13);
% 
% toPlot=intersect(sublist,th45);
% makePlot(toPlot);
% toPlot=intersect(sublist,th115);
% makePlot(toPlot);
% 
% hold off
% legend('\theta=45','\theta=115');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
% 
% figure;
% hold on;
% title('Room Temp: I=20, Configuration: I13,V24')
% sublist=intersect(Octupole,RoomT);
% sublist=intersect(sublist,Cur20);
% sublist=intersect(sublist,ConI13);
% 
% toPlot=intersect(sublist,th45);
% makePlot(toPlot);
% toPlot=intersect(sublist,th80);
% makePlot(toPlot);
% toPlot=intersect(sublist,th90);
% makePlot(toPlot);
% toPlot=intersect(sublist,th95);
% makePlot(toPlot);
% toPlot=intersect(sublist,th100);
% makePlot(toPlot);
% toPlot=intersect(sublist,th105);
% makePlot(toPlot);
% toPlot=intersect(sublist,th110);
% makePlot(toPlot);
% toPlot=intersect(sublist,th115);
% makePlot(toPlot);
% toPlot=intersect(sublist,th120);
% makePlot(toPlot);
% toPlot=intersect(sublist,th123);
% makePlot(toPlot);
% toPlot=intersect(sublist,th125);
% makePlot(toPlot);
% toPlot=intersect(sublist,th130);
% makePlot(toPlot);
% toPlot=intersect(sublist,th135);
% makePlot(toPlot);
% 
% 
% hold off
% legend('\theta=45','\theta=80','\theta=90','\theta=95','\theta=100','\theta=105','\theta=110','\theta=115','\theta=120','\theta=123','\theta=125','\theta=130','\theta=135');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
% 
% figure;
% hold on;
% title('Room Temp: I=30, Configuration: I13,V24')
% sublist=intersect(Octupole,RoomT);
% sublist=intersect(sublist,Cur30);
% sublist=intersect(sublist,ConI13);
% 
% toPlot=intersect(sublist,th45);
% makePlot(toPlot);
% toPlot=intersect(sublist,th115);
% makePlot(toPlot);
% toPlot=intersect(sublist,th130);
% makePlot(toPlot);
% toPlot=intersect(sublist,th135);
% makePlot(toPlot);
% 
% hold off
% legend('\theta=45','\theta=115','\theta=130','\theta=135');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
% 
% 
% 
% figure;
% hold on;
% title('Room Temp: I=35, Configuration: I13,V24')
% sublist=intersect(Octupole,RoomT);
% sublist=intersect(sublist,Cur35);
% sublist=intersect(sublist,ConI13);
% 
% toPlot=intersect(sublist,th27);
% makePlot(toPlot);
% toPlot=intersect(sublist,th45);
% makePlot(toPlot);
% toPlot=intersect(sublist,th72);
% makePlot(toPlot);
% toPlot=intersect(sublist,th90);
% makePlot(toPlot);
% toPlot=intersect(sublist,th108);
% makePlot(toPlot);
% 
% hold off
% legend('\theta=27','\theta=45','\theta=72','\theta=90','\theta=108');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
% 
% 
% figure;
% hold on;
% title('Room Temp: I=35, Configuration: I24,V13')
% sublist=intersect(Octupole,RoomT);
% sublist=intersect(sublist,Cur35);
% sublist=intersect(sublist,ConI24);
% 
% 
% toPlot=intersect(sublist,th45);
% makePlot(toPlot);
% toPlot=intersect(sublist,th72);
% makePlot(toPlot);
% 
% 
% hold off
% legend('\theta=45','\theta=72');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
% 
% 
% figure;
% hold on;
% title('Room Temp: I=35, Configuration: I12,V34')
% sublist=intersect(Octupole,RoomT);
% sublist=intersect(sublist,Cur35);
% sublist=intersect(sublist,ConI12);
% 
% 
% toPlot=intersect(sublist,th45);
% makePlot(toPlot);
% toPlot=intersect(sublist,th72);
% makePlot(toPlot);
% 
% 
% hold off
% legend('\theta=45','\theta=72');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
% 
% 
% figure;
% hold on;
% title('Room Temp: I=35, Configuration: I14,V23')
% sublist=intersect(Octupole,RoomT);
% sublist=intersect(sublist,Cur35);
% sublist=intersect(sublist,ConI14);
% 
% toPlot=intersect(sublist,th45);
% makePlot(toPlot);
% toPlot=intersect(sublist,th72);
% makePlot(toPlot);
% 
% hold off
% legend('\theta=45','\theta=72');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
% 
% 
% figure;
% hold on;
% title('Room Temp: I=40, Configuration: I13,V24')
% sublist=intersect(Octupole,RoomT);
% sublist=intersect(sublist,Cur40);
% sublist=intersect(sublist,ConI13);
% 
% toPlot=intersect(sublist,th45);
% makePlot(toPlot);
% toPlot=intersect(sublist,th115);
% makePlot(toPlot);
% toPlot=intersect(sublist,th123);
% makePlot(toPlot);
% 
% hold off
% legend('\theta=45','\theta=115','\theta=123');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
% 
% 
% figure;
% hold on;
% title('Room Temp: I=50, Configuration: I13,V24')
% sublist=intersect(Octupole,RoomT);
% sublist=intersect(sublist,Cur50);
% sublist=intersect(sublist,ConI13);
% 
% toPlot=intersect(sublist,th45);
% makePlot(toPlot);
% toPlot=intersect(sublist,th135);
% makePlot(toPlot);
% 
% 
% hold off
% legend('\theta=45','\theta=135');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
% 
% 
% figure;
% hold on;
% title('Room Temp: I=60, Configuration: I13,V24')
% sublist=intersect(Octupole,RoomT);
% sublist=intersect(sublist,Cur60);
% sublist=intersect(sublist,ConI13);
% 
% toPlot=intersect(sublist,th45);
% makePlot(toPlot);
% toPlot=intersect(sublist,th115);
% makePlot(toPlot);
% toPlot=intersect(sublist,th135);
% makePlot(toPlot);
% 
% hold off
% legend('\theta=45','\theta=115','\theta=135');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
% 
% 
% figure;
% hold on;
% title('Room Temp: I=80, Configuration: I13,V24')
% sublist=intersect(Octupole,RoomT);
% sublist=intersect(sublist,Cur80);
% sublist=intersect(sublist,ConI13);
% 
% toPlot=intersect(sublist,th45);
% makePlot(toPlot);
% toPlot=intersect(sublist,th115);
% makePlot(toPlot);
% toPlot=intersect(sublist,th135);
% makePlot(toPlot);
% 
% hold off
% legend('\theta=45','\theta=115','\theta=135');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
% 
% %%Sextupole configuration
% 
% 
% figure;
% hold on;
% title('Sextupole Configuration: Room Temp, I13V24')
% sublist=intersect(Sextupole,RoomT);
% sublist=intersect(sublist,ConI13);
% sublist=intersect(sublist,Cur35);
% 
% toPlot=intersect(sublist,th27);
% makePlot(toPlot);
% toPlot=intersect(sublist,th45);
% makePlot(toPlot);
% toPlot=intersect(sublist,th72);
% makePlot(toPlot);
% toPlot=intersect(sublist,th90);
% makePlot(toPlot);
% toPlot=intersect(sublist,th108);
% makePlot(toPlot);
% 
% hold off
% legend('\theta=27','\theta=45','\theta=72','\theta=90','\theta=108');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
% 
% figure;
% hold on;
% title('Sextupole Configuration: Room Temp, I24V13')
% sublist=intersect(Sextupole,RoomT);
% sublist=intersect(sublist,ConI24);
% sublist=intersect(sublist,Cur35);
% 
% 
% toPlot=intersect(sublist,th45);
% makePlot(toPlot);
% toPlot=intersect(sublist,th72);
% makePlot(toPlot);
% 
% 
% hold off
% legend('\theta=45','\theta=72');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
% 
% 
% figure;
% hold on;
% title('Sextupole Configuration: Room Temp, I12V34')
% sublist=intersect(Sextupole,RoomT);
% sublist=intersect(sublist,ConI12);
% sublist=intersect(sublist,Cur35);
% 
% 
% toPlot=intersect(sublist,th45);
% makePlot(toPlot);
% toPlot=intersect(sublist,th72);
% makePlot(toPlot);
% 
% 
% hold off
% legend('\theta=45','\theta=72');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
% 
% 
% figure;
% hold on;
% title('Sextupole Configuration: Room Temp, I14V23')
% sublist=intersect(Sextupole,RoomT);
% sublist=intersect(sublist,ConI14);
% sublist=intersect(sublist,Cur35);
% 
% 
% toPlot=intersect(sublist,th45);
% makePlot(toPlot);
% toPlot=intersect(sublist,th72);
% makePlot(toPlot);
% 
% 
% hold off
% legend('\theta=45','\theta=72');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
% 
% 
% %%%%%%Field cooled loops
% 
% %%Same configuration and angle, different currents
% figure;
% title('Field Cooled: I13V24, theta=45');
% sublist=intersect(FCed,ConI13);
% sublist=intersect(sublist,th45);
% sublist=intersect(sublist,Octupole);
% sublist=setdiff(sublist,Lit);
% 
% hold on
% toAvg=intersect(sublist,Cur20);
%     a(1)=makePlot(toAvg);
%     c(1)=findCenters(toAvg);
% toAvg=intersect(sublist,Cur30);
%     a(2)=makePlot(toAvg);
%     c(2)=findCenters(toAvg);
% toAvg=intersect(sublist,Cur40);
%     a(3)=makePlot(toAvg);
%     c(3)=findCenters(toAvg);
% toAvg=intersect(sublist,Cur50);
%     a(4)=makePlot(toAvg);
%     c(4)=findCenters(toAvg);
% toAvg=intersect(sublist,Cur60);
%     a(5)=makePlot(toAvg);
%     c(5)=findCenters(toAvg);
% toAvg=intersect(sublist,Cur70);
%     a(6)=makePlot(toAvg);
%     c(6)=findCenters(toAvg);
% toAvg=intersect(sublist,Cur80);
%     a(7)=makePlot(toAvg);
%     c(7)=findCenters(toAvg);
% toAvg=intersect(sublist,Cur90);
%     a(8)=makePlot(toAvg);
%     c(8)=findCenters(toAvg);
% toAvg=intersect(sublist,Cur100);
%     a(9)=makePlot(toAvg);
%     c(9)=findCenters(toAvg);
% 
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
%  legend('20mA','30mA','40mA','50mA','60mA','70mA','80mA','90mA','100mA');
%  hold off
% 
% b=[20,30,40,50,60,70,80,90,100];
% figure;
% plot(b,a,'*-');
% title('Field Cooled: I13V24, theta=45');
% xlabel('Current (mA)');
% ylabel('Average Voltage');
% 
% % figure;
% % plot(b,c,'*-');
% % title('Field Cooled: I13V24, theta=45');
% % xlabel('Current (mA)');
% % ylabel('loop center (Gauss)');
% 
% clear a;
% clear b;
% clear c;
% 
% figure;
% title('Field Cooled: I13V24, theta=90');
% sublist=intersect(FCed,ConI13);
% sublist=intersect(sublist,th90);
% sublist=intersect(sublist,Octupole);
% sublist=setdiff(sublist,Lit);
% 
% hold on
% 
% toAvg=intersect(sublist,Cur50);
%     a(1)=makePlot(toAvg);
%     c(1)=findCenters(toAvg);
% 
% toAvg=intersect(sublist,Cur100);
%     a(2)=makePlot(toAvg);
%     c(2)=findCenters(toAvg);
% 
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
%  legend('50mA','100mA');
%  hold off
% 
% b=[50,100];
% figure;
% plot(b,a,'*-');
% title('Field Cooled: I13V24, theta=90');
% xlabel('Current (mA)');
% ylabel('Average Voltage');
% 
% % figure;
% % plot(b,c,'*-');
% % title('Field Cooled: I13V24, theta=45');
% % xlabel('Current (mA)');
% % ylabel('loop center (Gauss)');
% 
% clear a;
% clear b;
% clear c;
% 
% 
% %%
% figure;
% hold on;
% title('Field Cooled: I=35 mA, \theta=72');
% sublist=setdiff(FCed,Lit);
% sublist=intersect(sublist,th72);
% sublist=intersect(sublist,Cur35);
% 
% toPlot=intersect(sublist,ConI12);
% makePlot(toPlot);
% toPlot=intersect(sublist,ConI13);
% makePlot(toPlot);
% toPlot=intersect(sublist,ConI24);
% makePlot(toPlot);
% 
% legend('I12V34','I13V24','I24V13');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
% hold off
% 
% %%
% figure;
% hold on;
% title('Field Cooled: I13V24, I=35 mA');
% sublist=setdiff(FCed,Lit);
% sublist=intersect(sublist,ConI13);
% sublist=intersect(sublist,Cur35);
% 
% toPlot=intersect(sublist,th27);
% makePlot(toPlot);
% toPlot=intersect(sublist,th45);
% makePlot(toPlot);
% toPlot=intersect(sublist,th72);
% makePlot(toPlot);
% toPlot=intersect(sublist,th90);
% makePlot(toPlot);
% 
% legend('\theta=27','\theta=45','\theta=72','\theta=90');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
% hold off
% 
% %%Illumination study
% 
% %Detuning
% Detuning=180:190;
% [~,centers]=findCenters(Detuning);
% I0=[250000,177800,84900,62000,44500,28600,22200,16400,14500,12750,9760];
% figure;
% hold on;
% title('Detuning study');
% for n=Detuning
%    makePlot(n);
%    
% end
% legend('I=250000','I=177800','I=84900','I=62000','I=44500','I=28600','I=22200','I=16400','I=14500','I=12750','I=9760');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
% hold off
% 
% figure;
% hold on;
% title('Detuning study');
% plot(I0,centers);
% xlabel('Illumination Intensity');ylabel('Calculated Center (V)');
% hold off;
% 
% %map
% figure;
% scans=142:158;
% ys=[-.6,-1,-1.5,-1.8,-2,-2.2,-2.4,-2.8,-2,-2,-2,-.3,-.6,-.9,-1.2,-1.5,-1.8];
% zs=[1,1,.7,.4,.3,.3,.2,0,.1,.5,.7,0,0,0,0,0,0,0,0];
% y=-2.8:.1:-.3;
% z=0:.1:1;
% map=zeros(size(y,2),size(z,2));
% for n=1:size(scans,2)
%     ynew=find(y==ys(n));
%     znew=find(z==zs(n));
%     map(ynew,znew)=findCenter(scans(n));
% end
% map=abs(map);
% map=map/max(max(map));
% imagesc(map)
% %caxis([min(min(map)), max(max(map))]);
% 
% %
% figure;
% hold on;
% title('Sextupole Configuration: Field Cooled I13V24 I=35mA');
% sublist=setdiff(FCed,Lit);
% sublist=intersect(sublist,Sextupole);
% sublist=intersect(sublist,ConI13);
% sublist=intersect(sublist,Cur35);
% 
% toPlot=intersect(sublist,th27);
% makePlot(toPlot);
% toPlot=intersect(sublist,th45);
% makePlot(toPlot);
% toPlot=intersect(sublist,th72);
% makePlot(toPlot);
% toPlot=intersect(sublist,th90);
% makePlot(toPlot);
% 
% legend('\theta=27','\theta=45','\theta=72','\theta=90');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
% hold off
% 
% figure;
% hold on;
% title('Sextupole Configuration: Field Cooled I24V13 I=35mA');
% sublist=setdiff(FCed,Lit);
% sublist=intersect(sublist,Sextupole);
% sublist=intersect(sublist,ConI24);
% sublist=intersect(sublist,Cur35);
% 
% toPlot=intersect(sublist,th27);
% makePlot(toPlot);
% toPlot=intersect(sublist,th45);
% makePlot(toPlot);
% toPlot=intersect(sublist,th72);
% makePlot(toPlot);
% toPlot=intersect(sublist,th90);
% makePlot(toPlot);
% 
% legend('\theta=27','\theta=45','\theta=72','\theta=90');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
% hold off
% 
% %%Field cooling effects
% figure;
% hold on;
% makePlot([83,112]);
% makePlot(114);
% title('I13V24 \theta=45 I=20mA');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
% legend('Room Temp','Field Cooled');
% hold off;
% 
% 
% figure;
% hold on;
% makePlot(84);
% makePlot(115);
% title('I13V24 \theta=45 I=30mA');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
% legend('Room Temp','Field Cooled');
% hold off;
% 
% figure;
% hold on;
% makePlot(85);
% makePlot(116);
% title('I13V24 \theta=45 I=40mA');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
% legend('Room Temp','Field Cooled');
% hold off;
% 
% figure;
% hold on;
% makePlot([86,88,89,90,91,92,93,95,113]);
% makePlot(117);
% title('I13V24 \theta=45 I=50mA');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
% legend('Room Temp','Field Cooled');
% hold off;
% 
% figure;
% hold on;
% makePlot(87);
% makePlot(118);
% title('I13V24 \theta=45 I=60mA');
% xlabel('Applied Field (Gauss)');
% ylabel('Voltage');
% legend('Room Temp','Field Cooled');
% hold off;

% for n=intersect(All,ConI34)
%     makePlot(n);
%     title(num2str(n));
%     pause;
% end