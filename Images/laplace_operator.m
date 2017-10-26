function [ edges ] = laplace_operator( image, filter_size, sigma, threshold )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

filter=fspecial('log',[filter_size filter_size],sigma); 
laplac=imfilter(image,filter,'replicate'); 
edges = laplac>threshold;

end

