% --- Generate file containing array sweep pattern ---
clc; clear all; close all;

% Assume linear sweep across azimuth at given elevation
domain_azimuth = -60:5:60;
domain_elevation = 60:-5:-60;

% Header row with size of matrix
i = 1;
arrayPoints = zeros(length(domain_azimuth) * length(domain_elevation), 2);
arrayPoints(i, 1) = domain_azimuth(1);
arrayPoints(i, 2) = domain_elevation(1);
i = i + 1;
arrayPoints(i, 1) = length(domain_azimuth);
arrayPoints(i, 2) = length(domain_elevation);
i = i + 1;
arrayPoints(i, 1) = domain_azimuth(length(domain_azimuth));
arrayPoints(i, 2) = domain_elevation(length(domain_elevation));

% Iterate and append the angles into a vector of points
index = i;
for i = 1:length(domain_elevation)
    for j = 1:length(domain_azimuth)
        index = index + 1;
        azimuth = domain_azimuth(j);
        elevation = domain_elevation(i);

        [theta, phi] = convert_coord(azimuth, elevation);
        disp(theta + ", " + phi);

        arrayPoints(index, 1) = theta;
        arrayPoints(index, 2) = phi;

    end
end

% Write to csv file
writematrix( arrayPoints, 'anglePoint.csv' )
disp("Generated an array of points");


% Azimuth and Elevation coordinate system change
function [theta, phi] = convert_coord(azim, elev)
    % Convert to cartesian coordinate
    %gx = cosd(azim) * sind(elev);
    %gy = sind(azim) * sind(elev);
    %gz = cosd(elev);

    % Convert to cartesian coordinate TODO: Check the coordinate conversion
    gx = -sind(elev);
    gy = sind(azim) * cosd(elev);
    gz = cosd(azim) * cosd(elev);
    % Convert cartesian to polar coord in PAA
    theta = acosd(gz);
    phi = atan2d(-gx, -gy);
    if (phi < 0)
        phi = phi + 360;
    end

end