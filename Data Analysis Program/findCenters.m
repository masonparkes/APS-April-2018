function [avgCenter,centers] = findCenters(scans)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    scanSize=size(scans,2);
    centers=zeros(scanSize,1);
    for n=1:scanSize
        centers(n)=findCenter(scans(n));
    end
    avgCenter=mean(centers);
    
end

