function [ output_args ] = PlotRawData( scan_number )
%Plots a single raw data set, doesn't close current data sets so that you
%can use hold on and multiple commands to plot
file=['\\ceres\speckle$\APS April 2018\Generated Data\scan',num2str(scan_number),'.mat'];
load(file,'fields','voltage');
plot(fields,voltage);
legend(num2str(scan_number));
%clear;


end

