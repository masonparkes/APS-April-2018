%Comparison between two series that needed more work done than the other
%series

clear;
close all;
scans=[220,223];
scan220=dlmread('Chesnel_Apr2018.0220',' ',180,0);
scan223=dlmread('Chesnel_Apr2018.0223',' ',180,0);
v220=scan220(:,9);
%offset the scan until it's at zero
while mean(v220)>.0000001
    v220=v220-.00000001*ones(size(v220));
end
while mean(v220)<.0000001
    v220=v220+.00000001*ones(size(v220));
end
v223=scan223(:,9);
while mean(v223)>.0000001
    v223=v223-.00000001*ones(size(v223));
end
while mean(v223)<.0000001
    v223=v223+.00000001*ones(size(v223));
end
v220=v220./max(v220);
v223=v223./max(v223);
h220=scan220(:,2);
h223=scan223(:,2);
% v220=v220./mean(v220);
% v223=v223./mean(v223);
%v220=-v220+2*ones(size(v220));
plot(h220,-v220,h223,v223)

    