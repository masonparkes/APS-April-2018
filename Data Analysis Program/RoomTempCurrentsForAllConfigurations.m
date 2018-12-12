initializeMatrices;

figure;
All=intersect(RoomT,All);%get only room temp scans
subset=intersect(All,ConI12);%get all I12V34 scans
subset=intersect(subset,th45);%get all with theta=45
hold on;
toPlot=intersect(subset,Cur10);
makePlot(toPlot);
toPlot=intersect(subset,Cur20);
makePlot(toPlot);
toPlot=intersect(subset,Cur30);
makePlot(toPlot);
toPlot=intersect(subset,Cur40);
makePlot(toPlot);
toPlot=intersect(subset,Cur50);
makePlot(toPlot);
xlabel('Applied Field (Gauss)');
ylabel('Voltage');
title('Room Temp: I12V34, theta=45');
legend('10mA','20mA','30mA','40mA','50mA');
hold off;

figure;
subset=intersect(All,ConI13);%get all I13V24 scans
subset=intersect(subset,th115);%get all with theta=115
hold on;
toPlot=intersect(subset,Curp1);
makePlot(toPlot);
toPlot=intersect(subset,Curp2);
makePlot(toPlot);
toPlot=intersect(subset,Curp3);
makePlot(toPlot);
toPlot=intersect(subset,Curp4);
makePlot(toPlot);
toPlot=intersect(subset,Curp5);
makePlot(toPlot);
toPlot=intersect(subset,Curp6);
makePlot(toPlot);
toPlot=intersect(subset,Curp7);
makePlot(toPlot);
toPlot=intersect(subset,Curp8);
makePlot(toPlot);
toPlot=intersect(subset,Curp9);
makePlot(toPlot);
toPlot=intersect(subset,Cur1);
makePlot(toPlot);
toPlot=intersect(subset,Cur2);
makePlot(toPlot);
toPlot=intersect(subset,Cur3);
makePlot(toPlot);
toPlot=intersect(subset,Cur4);
makePlot(toPlot);
toPlot=intersect(subset,Cur5);
makePlot(toPlot);
toPlot=intersect(subset,Cur10);
makePlot(toPlot);
toPlot=intersect(subset,Cur20);
makePlot(toPlot);
toPlot=intersect(subset,Cur30);
makePlot(toPlot);
toPlot=intersect(subset,Cur40);
makePlot(toPlot);
toPlot=intersect(subset,Cur60);
makePlot(toPlot);
toPlot=intersect(subset,Cur80);
makePlot(toPlot);
toPlot=intersect(subset,Cur100);
makePlot(toPlot);
xlabel('Applied Field (Gauss)');
ylabel('Voltage');
title('Room Temp: I13V24, theta=115');
legend('0.1mA','0.2mA','0.3mA','0.4mA','0.5mA', ...
        '0.6mA','0.7mA','0.8mA','0.9mA','1mA','2mA',...
        '3mA','4mA','5mA','10mA','20mA','30mA','40mA',...
        '60mA','80mA','100mA');
    
%This one only does higher current values (I>3mA)    
figure;
subset=intersect(All,ConI13);%get all I13V24 scans
subset=intersect(subset,th115);%get all with theta=115
hold on;
toPlot=intersect(subset,Cur3);
makePlot(toPlot);
toPlot=intersect(subset,Cur4);
makePlot(toPlot);
toPlot=intersect(subset,Cur5);
makePlot(toPlot);
toPlot=intersect(subset,Cur10);
makePlot(toPlot);
toPlot=intersect(subset,Cur20);
makePlot(toPlot);
toPlot=intersect(subset,Cur30);
makePlot(toPlot);
toPlot=intersect(subset,Cur40);
makePlot(toPlot);
toPlot=intersect(subset,Cur60);
makePlot(toPlot);
toPlot=intersect(subset,Cur80);
makePlot(toPlot);
toPlot=intersect(subset,Cur100);
makePlot(toPlot);
xlabel('Applied Field (Gauss)');
ylabel('Voltage');
title('Room Temp: I13V24, theta=115, I>3mA');
legend('3mA','4mA','5mA','10mA','20mA','30mA','40mA',...
        '60mA','80mA','100mA');
    
figure;
subset=intersect(All,ConI13);%get all I13V24 scans
subset=intersect(subset,th45);%get all with theta=45
hold on;
toPlot=intersect(subset,Cur10);
makePlot(toPlot);
toPlot=intersect(subset,Cur20);
makePlot(toPlot);
toPlot=intersect(subset,Cur30);
makePlot(toPlot);
toPlot=intersect(subset,Cur35);
toPlot=setdiff(toPlot,[210,211,212,213,214,215]);%these scans are noisy or otherwise strange looking
makePlot(toPlot);
toPlot=intersect(subset,Cur40);
makePlot(toPlot);
toPlot=intersect(subset,Cur50);
makePlot(toPlot);
toPlot=intersect(subset,Cur60);
makePlot(toPlot);
xlabel('Applied Field (Gauss)');
ylabel('Voltage');
title('Room Temp: I13V24, theta=45');
legend('10mA','20mA','30mA','35mA','40mA',...
        '50mA','60mA');