function [ edges ] = compass_edge( image, threshold )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    image=double(image);


    g1=[5,5,5; -3,0,-3; -3,-3,-3];
    g2=[5,5,-3; 5,0,-3; -3,-3,-3];
    g3=[5,-3,-3; 5,0,-3; 5,-3,-3];
    g4=[-3,-3,-3; 5,0,-3; 5,5,-3];
    g5=[-3,-3,-3; -3,0,-3; 5,5,5];
    g6=[-3,-3,-3; -3,0,5;-3,5,5];
    g7=[-3,-3,5; -3,0,5;-3,-3,5];
    g8=[-3,5,5; -3,0,5;-3,-3,-3];


    x1 = conv2(image, g1, 'same');
    x2 = conv2(image, g2, 'same');
    x3 = conv2(image, g3, 'same');
    x4 = conv2(image, g4, 'same');
    x5 = conv2(image, g5, 'same');
    x6 = conv2(image, g6, 'same');
    x7 = conv2(image, g7, 'same');
    x8 = conv2(image, g8, 'same');

    grad=max(x1,x2);
    grad=max(grad,x3);
    grad=max(grad,x4);
    grad=max(grad,x5);
    grad=max(grad,x6);
    grad=max(grad,x7);
    grad=max(grad,x8);
    edges = grad >threshold;
end

