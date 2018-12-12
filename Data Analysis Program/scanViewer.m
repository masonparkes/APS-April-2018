scans=[142:165,169:176];
for scan=scans
    close all;
    makePlot(scan);
    title(scan);
    pause();
end