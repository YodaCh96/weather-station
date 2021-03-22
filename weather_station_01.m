% Task 1.1
% Import data from MET Office Weather Data
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
weatherD = readtable("C:\Users\Ioannis\Desktop\Github_Repos\MATLAB\Wetterstation\MET_Office_Weather_Data.csv", opts);

% Clear temporary variables
clear opts

% Task 1.2
% Print summary of table
summary(weatherD);

% Task 1.3
% A new variable is created here, which contains only valid values
wDfixed = rmmissing(weatherD);

% The number of removed lines is printed here
removedRows = height(weatherD) - height(wDfixed);

% Task 1.4
% The table is sorted by year and month
% sortedD = sortrows(wDfixed, [1 2]);            
sortedD = sortrows(wDfixed, {'year', 'month'});

% The maximal temperature over the years is displayed here.
plot( sortedD.year, sortedD.tmax);

% Task 1.5
groupSum = groupsummary(wDfixed, 'station');
[~, index] = max(groupSum.GroupCount);
maxStation = groupSum.station(index);
maxStationD = wDfixed(wDfixed.station==maxStation,:);

% Task 1.6
meanTemp = groupsummary( wDfixed, 'year', 'mean', {'tmax', 'tmin'}); 
plot(meanTemp.year, meanTemp.mean_tmax, "-*");
hold on;
plot(meanTemp.year, meanTemp.mean_tmin, "-^" );

% Task 1.7
% wDfixed.AvgTemp = (wDfixed.tmax + wDfixed.tmin)/2;
medianTemp = groupsummary( wDfixed, 'year', 'median', {'tmax', 'tmin'}); 
plot(medianTemp.year, medianTemp.median_tmax, "-+");    
plot(medianTemp.year, medianTemp.median_tmin, "-<" );
hold off;

% Task 1.8
meanRainPerStation = groupsummary(wDfixed, {'station', 'year'}, 'mean', 'rain');
[~, idxMin] = min( meanRainPerStation.mean_rain );
[~, idxMax] = max( meanRainPerStation.mean_rain );
minRainS = wDfixed.station(idxMin);
maxRainS = wDfixed.station(idxMax);

% Task 1.9
scatter(maxStationD.tmax, maxStationD.rain, 'filled');
title('Scatterplot temperature vs amount of water')
ylabel('amount of water')
xlabel('temperature')

% Task 1.10
minD = wDfixed(wDfixed.station == minRainS,:);
maxD = wDfixed(wDfixed.station == maxRainS,:);
ismember(minD, wDfixed);
minAndMaxD = union(minD, maxD);
boxplot(minAndMaxD.tmax, minAndMaxD.station);
