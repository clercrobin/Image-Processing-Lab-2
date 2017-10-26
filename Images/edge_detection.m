function [ edges ] = edge_detection( image, template1, template2, threshold, norm )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

edge_x = conv2(image, template1, 'same');
edge_y = conv2(image, template2, 'same');

if norm == 2
    grad = sqrt(edge_x.^2 + edge_y.^2);
elseif norm == 1
    grad = abs(edge_x) + abs(edge_y); 
end

edges = grad>threshold;

end

