
function current = getCurrent(scan)
%getCurrent Takes a scan number and returns the current that it was taken
%at
    initializeMatrices;
    if find(Curp1==scan)
        current=.1;
    
    elseif find(Curp2==scan)
        current=.2;
    elseif find(Curp3==scan)
        current=.3;
    elseif find(Curp4==scan)
        current=.4;
    elseif find(Curp5==scan)
        current=.5;
    elseif find(Curp6==scan)
        current=.6;
    elseif find(Curp7==scan)
        current=.7;
    elseif find(Curp8==scan)
        current=.8;
    elseif find(Curp9==scan)
        current=.9;
    elseif find(Cur1==scan)
        current=1;
    elseif find(Cur2==scan)
        current=2;
    elseif find(Cur3==scan)
        current=3;
    elseif find(Cur4==scan)
        current=4;
    elseif find(Cur5==scan)
        current=5;
    elseif find(Cur10==scan)
        current=10;
    elseif find(Cur20==scan)
        current=20;
    elseif find(Cur30==scan)
        current=30;
    elseif find(Cur35==scan)
        current=35;
    elseif find(Cur40==scan)
        current=40;
    elseif find(Cur50==scan)
        current=50;
    elseif find(Cur60==scan)
        current=60;
    elseif find(Cur70==scan)
        current=70;
    elseif find(Cur80==scan)
        current=80;
    elseif find(Cur90==scan)
        current=90;
    elseif find(Cur100==scan)
        current=100;
    else
        throw(MException('MATLAB:odearguments:InconsistentDataType','scan %g not found in current lists',scan));
    end
end

