function [centers] = fakeHysteresis( scans,q_plot )
%This function tries to turn the data into something that looks  more like
%a hysteresis loop by flipping half of the data values 
%scans-the data sets that you want to look at
%q_plot is whether or not you want to plot the data, enter 1 for a plot to
%appear, enter 0 for no plot
%this function is supposed to return "centers", the centers of the hysteresis
%loops for the scans you gave it, so that it could be used to find the
%exchange bias
close all;
badscans=[127,128,129,130,131,132,133,191,192,193:208];
centers=zeros(size(scans));
legmat=["not","real"];
for n=1:size(scans,2)
    
    scan=scans(n);
    k=find(badscans==scan);
    if size(k,2)~=0
        continue
    end
    string=num2str(scans(n));
    legmat(n)=string;
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
    
% %     y=size(f,1)*(3/4);
% %     x=size(f,1)*(1/4);
    %%
    w=0;
    %vtry=[-v(1:x-1)+w*ones(size(v(1:x-1)));v(x:end-x-1);(-v(end-x:end))+w*ones(size(v(end-x:end)))];
    %plot(f,v,f,vtry)

    vtry=[-v(1:x)+w*ones(size(v(1:x)));v(x+1:y);(-v(y+1:end))+w*ones(size(v(y+1:end)))];
    %g=fit(-f,vtry,'cubicspline');
     
%vtry=vtry-mean(vtry)*ones(size(vtry));
for x=1:1000000
    vtry=smooth(vtry);
end
if q_plot
plot(f,vtry)
     hold on;
end
     
    half=floor(size(v,1)/2);
    [~,i1]=min(abs(vtry(1:half)));
    [~,i2]=min(abs(vtry(half:end)));
    center=f(i1)+f(i2);
    centers(n)=center/2;

%      [~,I]=sort(abs(v));
%      f1=f(I(end));
%      f2=f(I(end-11));
%      centers(n)=mean([f1,f2]);
         
%     Phi1 = @(b,I) -(b(1) .* atan(-b(2)*I+b(3)) - b(1).*I.*b(4));    % Descending
% Phi2 = @(b,I)  (b(1) .* atan(-b(2)*I+b(3)) + b(1).*I.*b(4));    % Ascending
% ixd = fix(length(f)/2);
% vi2 = 1:ixd;
% vi1 = ixd:length(f);
% opts = statset('MaxIter', 1, 'MaxFunEvals', 1);
% B1 = nlinfit(-f(vi1), vtry(vi1), Phi1, ones(4,1));
% B2 = nlinfit(-f(vi2), vtry(vi2), Phi2, ones(4,1));
% FitPhi1 = Phi1(B1,x);
% FitPhi2 = Phi2(B2,x);
%     
%     figure(1)
% plot(-f(vi1), vtry(vi1), -f, FitPhi1, '-r', 'LineWidth', 2)
% hold on
% plot(-f(vi2), vtry(vi2), -f, FitPhi2, '-g', 'LineWidth', 2)
% %hold off
% grid
% %legend('Data', 'Descending', 'Ascending', 'Location', 'NW')
    
end
legend(legmat);

end

