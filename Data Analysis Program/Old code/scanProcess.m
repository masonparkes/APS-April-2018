function [ I ] = scanProcess( scan )
%prototype code that can be used to process a scan and extract everything
%we  want from it.
    [v,f]=scanAverage(scan);
    [v,f]=linearSubtraction(v,f,3500);
    I=findInflectiond(scan);
    plot(v,f)
    
    

end

