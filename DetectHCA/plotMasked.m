function [] = plotMasked(img,BW)

% Overlay the binary mask on the grayscale image
maskedImage = imoverlay(img, BW, [1 0 0]); % Red color for overlay

% Display the masked image
figure;
imshow(maskedImage);
title('Grayscale Image with Binary Mask Overlay');