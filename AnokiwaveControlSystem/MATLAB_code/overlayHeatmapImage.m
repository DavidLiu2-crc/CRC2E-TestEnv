function [h, c] = overlayHeatmapImage(varargin)
% overlayHeatmapImage overlays a 2d heatmap over an image
%
%   overlayHeatmapImage(fig, [x, y], CData, image, [xOriginTX, yOriginRX, beamMode]);
%       fig : figure handle to plot image in
%       [x, y] : a matrix containing two rows, denoting the angles of each peakIndexX
%       CData : 2D matrix containing the heatmap data to generate from
%       image : Image to put in background of plot hFigure
%       [xOriginTX, yOriginRX, beamMode] : a vector containing information about where
%           the TX source is in the picture, and the beam mode to write in title
%

    if narg == 5
        fig = varargin{1};

        arg2 = varargin{2};
        xval = arg2(1, :);
        yval = arg2(2, :);

        MAP = varargin{3};
        IMG = varargin{4};

        arg5 = varargin{5};
        posXOffset = arg5(1);
        posYOffset = arg5(2);
        beamMode = arg5(3);
    end

    % Figure tick resolution
    resX = 20; resY = 10;

    % --- Plot the image in matlab figure
    ax1 = imagesc(IMG);
    [lengthIMGY, lengthIMGX, lengthIMGColor] = size(IMG);

    tickDomainX = -180:resX:180;
    tickDomainY = 90:-resY:-90;
    tickXPos = linspace(1, lengthIMGX, length(tickDomainX));
    tickYPos = linspace(1, lengthIMGY, length(tickDomainY));
    % Configure properties of the figure
    set(gca, 'XTick', tickXPos, 'XTickLabel', tickDomainX);
    set(gca, 'YTick', tickYPos, 'YTickLabel', tickDomainY);
    xlabel('Azimuth (Deg)');
    ylabel('Elevation (Deg)');
    figTitle = sprintf('Beam sweep by Anokiwave (Mode %d)', beamMode);
    title(figTitle, 'FontSize', 15);

    pixelX = abs(tickXPos(2) - tickXPos(1)) / resX; % Number of pixel per Xdegree
    pixelY = abs(tickYPos(2) - tickYPos(1)) / resY; % Number of pixel per Xdegree

    hold on;

    %set y-axis direction / invert
    %set(ax1.Parent, 'YDir', 'normal')

    % --- Algorithm to find peak and back track to find the index of peak
    resHeatX = abs(xval(2) - xval(1));
    resHeatY = abs(yval(2) - yval(1));
    pixelHeatX = resHeatX * pixelX;     % pixel width in X per index
    pixelHeatY = resHeatY * pixelY;     % pixel width in Y per index

    [maxY_, peakY_] = max(MAP, [], 2);
    [maxY, peakIndexY] = max(maxY_);    % peakY index of max of Elevation
    [maxX_, peakX_] = max(MAP, [], 1);
    [maxX, peakIndexX] = max(maxX_);	% peakX index of max of Azimuth

    [lengthMAPX, lengthMAPY] = size(MAP);
    posXIMGOrigin = posXOffset - (peakIndexX-1) * pixelHeatX;
    posYIMGOrigin = posYOffset - (peakIndexY-1) * pixelHeatY;
    posXIMGLimit = posXIMGOrigin + pixelHeatX*lengthMAPX;
    posYIMGLimit = posYIMGOrigin + pixelHeatY*lengthMAPY;
    % Relative pixel information remapped from angles sweeped
    pixelPosX = linspace(posXIMGOrigin, posXIMGLimit, lengthMAPX);
    pixelPosY = linspace(posYIMGOrigin, posYIMGLimit, lengthMAPY);

    % --- Plot the heatmap in matlab figure
    alphaMap = rescale(MAP, 0, 0.6);
    ax2 = imagesc(pixelPosX, pixelPosY, MAP);
    set(ax2,'CDataMapping', 'scaled');
    set(ax2,'AlphaData', alphaMap );
    set(ax2,'AlphaDataMapping', 'none');

    % --- Add the colorbar handle
    colormap(jet);
    c = colorbar();
    c.Colormap = jet;
    caxis([ max(max(MAP))-30  max(max(MAP)) ]);
    ylabel(c, 'Rel. Received Power (dB)');
    set(c, 'FontSize', 12);

    h = [ax1,ax2];
    hold off;
end
