function [ output_args ] = ProcessData( scan_number )
%Takes the data from the original data folder and saves a field/voltage
%data set in the generated data folder


string=num2str(scan_number);
if size(string,2)==2
    string=['00',string];
elseif size(string,2)==3
        string=['0',string];
else 
    %invalid data
end
file=['\\ceres\speckle$\APS April 2018\APS Raw Data\Chesnel_Apr2018.',string];
data=dlmread(file,' ',180,0);
fields=data(:,2);
voltage=data(:,9);
%newdata=[fields,voltage];
savefile=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(scan_number),'.mat'];
save( savefile, 'fields','voltage')

clear;
close all;


end

