figure;
scan=41;
    [v,f]=scanAverage(scan);
    [v,f]=linearSubtract(v,f,3500);
    %% find cross over point
    x=1;
    while f(x)<0
        x=x+1;
    end
    y=x;
    while f(y)>0
        y=y+1;
    end
    %%
    w=.03;
    %vtry=[-v(1:x-1)+w*ones(size(v(1:x-1)));v(x:end-x-1);(-v(end-x:end))+w*ones(size(v(end-x:end)))];
    %plot(f,v,f,vtry)

    vtry=[-v(1:x-1)+w*ones(size(v(1:x-1)));v(x:y);(-v(y+1:end))+w*ones(size(v(y+1:end)))];
    plot(f,vtry)
    title(num2str(scan));
    
    
