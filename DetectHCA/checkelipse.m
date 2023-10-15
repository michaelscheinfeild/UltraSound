%186 211 mm
img = imread("D:\simhawk\Task2-20231012T072306Z-001\Task2\image_hc_104_example.jpg");
[h,w,ch]=size(img)
% Extract properties
x_center = an.Position(1); % x-coordinate of the center
y_center = an.Position(2); % y-coordinate of the center
width = an.Position(3)*h;    % Width (major axis)
height = an.Position(4)*w;   % Height (minor axis)
angleR = an.Rotation;

% Convert the angle to radians
angle_rad = deg2rad(angleR);

% Calculate the semi-axes
a = width / 2;  % Semi-major axis
b = height / 2; % Semi-minor axis

% Calculate the perimeter%
%perimeter = 2 * pi * sqrt((a^2 + b^2) / 2);
perimeter = 2 * pi * sqrt(a^2 * sin(angle_rad)^2 + b^2 * cos(angle_rad)^2);

aa=700/2
bb=526/2
perimetersec = 2 * pi * sqrt((aa^2 + bb^2) / 2);

% Display the calculated perimeter
fprintf('Perimeter of the ellipse: %f\n', perimeter);

dpi=144
tomm=25.4
scale=1/2
%186   vs 151 M
mmperimeter = scale*tomm*perimeter/dpi

%211 vs 171
mmperimeterSec = scale*tomm*perimetersec/dpi

%% len
dx = diff(xx);
dy = diff(yy);

% Calculate the Euclidean distances between consecutive points
distances = sqrt(dx.^2 + dy.^2);

% Sum the distances to find the total length of the curve
total_length = sum(distances)

scale*total_length*tomm/dpi

%% 
%hmm  = h/(56.2*10 )
%wmm  = w/(41.2*10) 

%distancesmm = sqrt((dx*hmm).^2 + (dy*wmm).^2)
%total_lengthmm = sum(distancesmm)

% Given data
h_cm = 56.2;     % Height of the image in centimeters
w_cm = 41.2;     % Width of the image in centimeters
scale = 10;      % Scale factor (1 cm = 10 mm)

% Convert image dimensions to millimeters
h_mm = h_cm * scale;  % Height in millimeters
w_mm = w_cm * scale;  % Width in millimeters

% Calculate dx and dy as pixel distances
dx = diff(xx);
dy = diff(yy);

% Calculate the Euclidean distances between consecutive points in millimeters
distances = sqrt((dx / w_mm) .^ 2 + (dy / h_mm) .^ 2);

% Sum the distances to find the total length of the curve in millimeters
total_length = sum(distances);

fprintf('Total Length of the Curve: %.2f mm\n', total_length);

