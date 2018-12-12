initializeMatrices;

figure;
hold on
title('Room Temp: I=10 mA th=45')
sublist=intersect(Octupole,RoomT);
sublist=intersect(sublist,Cur10);
sublist=intersect(sublist,th45);

toPlot=intersect(sublist,ConI12);
makePlot(toPlot);
toPlot=intersect(sublist,ConI13);
makePlot(toPlot);
toPlot=intersect(sublist,ConI14);
makePlot(toPlot);
toPlot=intersect(sublist,ConI23);
makePlot(toPlot);
toPlot=intersect(sublist,ConI24);
makePlot(toPlot);
hold off
legend('I12V34','I14V23','I23V24');
xlabel('Applied Field (Gauss)');
ylabel('Voltage')



figure;
hold on
title('Room Temp: I=20 mA th=45 Cross Configurations')
sublist=intersect(Octupole,RoomT);
sublist=intersect(sublist,Cur20);
sublist=intersect(sublist,th45);

toPlot=intersect(sublist,ConI12);
makePlot(toPlot);
toPlot=intersect(sublist,ConI13);
makePlot(toPlot);
toPlot=intersect(sublist,ConI14);
makePlot(toPlot);
toPlot=intersect(sublist,ConI23);
makePlot(toPlot);
toPlot=intersect(sublist,ConI34);
makePlot(toPlot);
hold off
legend('I12V34','I13V24','I14V23','I23V24','I34V12');
xlabel('Applied Field (Gauss)');
ylabel('Voltage')

figure;
hold on
title('Room Temp: I=20 mA th=45 Parallel Configurations')
sublist=intersect(Octupole,RoomT);
sublist=intersect(sublist,Cur20);
sublist=intersect(sublist,th45);

toPlot=intersect(sublist,ConI12);
makePlot(toPlot);
toPlot=intersect(sublist,ConI13);
makePlot(toPlot);
toPlot=intersect(sublist,ConI14);
makePlot(toPlot);
toPlot=intersect(sublist,ConI23);
makePlot(toPlot);
toPlot=intersect(sublist,ConI34);
makePlot(toPlot);
hold off
legend('I12V34','I13V24','I14V23','I23V24','I34V12');
xlabel('Applied Field (Gauss)');
ylabel('Voltage')

figure;
hold on
title('Room Temp: I=20 mA th=45 Cross Configuration')
sublist=intersect(Octupole,RoomT);
sublist=intersect(sublist,Cur20);
sublist=intersect(sublist,th45);

toPlot=intersect(sublist,ConI12);
makePlot(toPlot);
toPlot=intersect(sublist,ConI13);
makePlot(toPlot);
toPlot=intersect(sublist,ConI14);
makePlot(toPlot);
toPlot=intersect(sublist,ConI23);
makePlot(toPlot);
toPlot=intersect(sublist,ConI34);
makePlot(toPlot);
hold off
legend('I13V24','I14V23');
xlabel('Applied Field (Gauss)');
ylabel('Voltage')


figure;
hold on
title('Room Temp: I=30 mA th=45')
sublist=intersect(Octupole,RoomT);
sublist=intersect(sublist,Cur30);
sublist=intersect(sublist,th45);

toPlot=intersect(sublist,ConI12);
makePlot(toPlot);
toPlot=intersect(sublist,ConI13);
makePlot(toPlot);
toPlot=intersect(sublist,ConI14);
makePlot(toPlot);
hold off
legend('I12V34','I13V24','I14V23');
xlabel('Applied Field (Gauss)');
ylabel('Voltage')

figure;
hold on
title('Room Temp: I=35 mA th=45')
sublist=intersect(Octupole,RoomT);
sublist=intersect(sublist,Cur35);
sublist=intersect(sublist,th45);


toPlot=intersect(sublist,ConI13);
makePlot(toPlot);
toPlot=intersect(sublist,ConI24);
makePlot(toPlot);

hold off
legend('I13V24','I24V13');
xlabel('Applied Field (Gauss)');
ylabel('Voltage')


figure;
hold on
title('Room Temp: I=40 mA th=45')
sublist=intersect(Octupole,RoomT);
sublist=intersect(sublist,Cur40);
sublist=intersect(sublist,th45);

toPlot=intersect(sublist,ConI12);
makePlot(toPlot);
toPlot=intersect(sublist,ConI13);
makePlot(toPlot);
toPlot=intersect(sublist,ConI14);
makePlot(toPlot);

hold off
legend('I12V34','I13V24','I14V23');
xlabel('Applied Field (Gauss)');
ylabel('Voltage')

figure;
hold on
title('Room Temp: I=50 mA th=45')
sublist=intersect(Octupole,RoomT);
sublist=intersect(sublist,Cur50);
sublist=intersect(sublist,th45);

toPlot=intersect(sublist,ConI12);
makePlot(toPlot);
toPlot=intersect(sublist,ConI13);
makePlot(toPlot);

hold off
legend('I12V34','I13V24');
xlabel('Applied Field (Gauss)');
ylabel('Voltage')

figure;
hold on
title('Room Temp: I=60 mA th=45')
sublist=intersect(Octupole,RoomT);
sublist=intersect(sublist,Cur60);
sublist=intersect(sublist,th45);

toPlot=intersect(sublist,ConI13);
makePlot(toPlot);
toPlot=intersect(sublist,ConI34);
makePlot(toPlot);

hold off
legend('I13V24','I34V23');
xlabel('Applied Field (Gauss)');
ylabel('Voltage')