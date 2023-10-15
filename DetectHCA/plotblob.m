function [RGB] =plotblob(binaryImage)
if(sum(binaryImage(:))<10)
    return
end
      % Find connected components
    cc = bwconncomp(binaryImage);
    labeledImage = labelmatrix(cc);
    % Create a random colormap for different colors
    cmap = rand(cc.NumObjects, 3);
    % Colorize the labeled image
    RGB = label2rgb(labeledImage, cmap, 'k', 'shuffle');
    % Display the colorized image
    figure()
    imshow(RGB);
end