function [BW_out,properties] = filterRegionsUSA(BW_in)
%filterRegions Filter BW image using auto-generated code from imageRegionAnalyzer app.

% Auto-generated by imageRegionAnalyzer app on 14-Oct-2023
%---------------------------------------------------------

BW_out = BW_in;

% Filter image based on image properties.
BW_out = bwpropfilt(BW_out,'Area',[3000, 70045]);

% Get properties.
properties = regionprops(BW_out, {'Area', 'Eccentricity', 'EquivDiameter', 'EulerNumber', 'FilledArea', 'MajorAxisLength', 'MinorAxisLength', 'Orientation', 'Perimeter'});