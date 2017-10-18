function [ thresholded ] = orderedThreshold( image, S )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here



[rowsS, colsS] = size(S);
[rows, cols] = size(image);

SpavedABitTooLarge = repmat(S, max(ceil(rows/rowsS),ceil(cols/colsS)));
Spaved = SpavedABitTooLarge(1:rows, 1:cols);

n = max(max(S)) + 2 ;
% Quantization step and quantized image (with values in 0,1,2,...,N-1)
pas = 255 ./ (n-1);
SemiQuantized = double(image) ./ pas;

thresholded = SemiQuantized > Spaved;

end

