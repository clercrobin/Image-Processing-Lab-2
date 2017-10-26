function [ edges ] = freichen( image, threshold )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

f0 = 1/(2*sqrt(2))*[1 sqrt(2) 1;0 0 0;-1 -sqrt(2) -1];
f1 = 1/(2*sqrt(2))*[1 0 -1;sqrt(2) 0 -sqrt(2);1 0 -1];
f2 = 1/(2*sqrt(2))*[0 -1 sqrt(2);1 0 -1;-sqrt(2) 1 0];
f3 = 1/(2*sqrt(2))*[sqrt(2) -1 0;-1 0 1;0 1 -sqrt(2)];
f4 = 1/2*[0 1 0;-1 0 -1;0 1 0];
f5 = 1/2*[-1 0 1;0 0 0;1 0 -1];
f6 = 1/6*[1 -2 1;-2 4 -2;1 -2 1];
f7 = 1/6*[-2 1 -2;1 4 1;-2 1 -2];
f8 = 1/3*[1 1 1;1 1 1;1 1 1];


y0=imfilter(image,f0,'replicate'); 
y1=imfilter(image,f1,'replicate'); 
y2=imfilter(image,f2,'replicate'); 
y3=imfilter(image,f3,'replicate'); 
y4=imfilter(image,f4,'replicate'); 
y5=imfilter(image,f5,'replicate'); 
y6=imfilter(image,f6,'replicate'); 
y7=imfilter(image,f7,'replicate'); 
y8=imfilter(image,f8,'replicate'); 


mkl = double(y0.^2+y1.^2);
skl = double(y0.^2+y1.^2+y2.^2+y3.^2+y4.^2+y5.^2+y6.^2+y7.^2+y8.^2);

alpha = (sqrt(double(mkl./skl)));

edges = alpha>threshold;
end

