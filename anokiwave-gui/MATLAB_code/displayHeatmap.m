% Display a heatmap image over top of image
clear; close all; clc;

% --- Find the results folder in local directory
cd Results
path_ImgCam = dir('*Panoramic*.jpg');
% --- What to do when more than one input file found
if numel(path_ImgCam) > 1
    disp('More than one dataset found:');
    for n = 1:numel(path_ImgCam)
        currentLine = sprintf("File %d: %s", n-1, path_ImgCam(n).name);
        disp(currentLine);
    end
    userPick = input('Pick a file value to display data: ');
end
% Load the files into local workspace
ImgPanorama = imread(path_ImgCam(userPick+1).name);

dataFile = sprintf('anokiSweepData%d.mat', userPick);
load (dataFile);

cd ..

% Set the point in image where TX is centered
xOffset = 900; yOffset = 390;

fig = figure(1);
fig.WindowState = 'maximized';

% Call user-defined plot function
figPropertites = [xOffset; yOffset; modeBeam + 1];
figAxes = [domain_azim; domain_elev];
[h, c] = overlayHeatmapImage(fig, figAxes, matrix_peakImpulsePower, ImgPanorama, figPropertites);

%Save the result
saveas(fig, 'Output\CapturedResult00.jpg');
