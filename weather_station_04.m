% Task 4.1
opts = delimitedTextImportOptions("NumVariables", 8);

% Specify range and delimiter
opts.DataLines = [2, Inf];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["year", "month", "tmax", "tmin", "af", "rain", "sun", "station"];
opts.VariableTypes = ["int16", "int8", "double", "double", "categorical", "double", "double", "categorical"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["af", "station"], "EmptyFieldRule", "auto");

% Import the data
data = readtable("C:\Users\Ioannis\Desktop\Github_Repos\MATLAB\Wetterstation\MET_Office_Weather_Data.csv", opts);

% Clear temporary variables
clear opts

% Task 4.2
data = rmmissing(data);

% Task 4.3
data = data(:,{'year', 'month', 'station', 'tmin','tmax','rain','sun'});

% Task 4.4
stationSummaryMonth = groupsummary(data, {'station','month'}, {'median', 'mean', 'sum' }, {'rain','sun','tmin','tmax'});
[maxVal, idx] = max( stationSummaryMonth.sum_rain );

% Task 4.5
stationSummaryYear = groupsummary(data, {'station','year'}, {'median', 'mean' ,'sum' }, {'rain','sun','tmin','tmax'});
maxRainStation = stationSummaryMonth(idx,'station').station;

maxRainStationYearData = stationSummaryYear(stationSummaryYear.station==maxRainStation,:);

% Task 4.6
tiledlayout(2,1);

% Task 4.7
l1 = nexttile;
plot(l1, maxRainStationYearData.year,maxRainStationYearData.median_tmin);
hold on;
plot(l1, maxRainStationYearData.year,maxRainStationYearData.median_tmax);
hold off;
title(l1,"Temperature development" );
xlabel(l1,"observation period (years)");
ylabel(l1,"temperature (degree C)");
legend(l1,"median tmin", "median tmax");

% Task 4.8
l2 = nexttile;
yyaxis left;
plot(l2, maxRainStationYearData.year, maxRainStationYearData.median_sun);
ylabel(l2, "sun shine duration (h)");
yyaxis right
plot(l2, maxRainStationYearData.year, maxRainStationYearData.median_rain);
ylabel(l2,"rain fall (inch)");

title(l2, "Sun and rain");
xlabel(l2, "observation period (years)");

legend(l2, "sun shine", "rain fall");
