function [ polys ] = multiple_fit( data, mos, degree )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    polys = zeros(5,degree+1)
    for i = 1:5
        x = data((i-1)*5+1: (i-1)*5+5);
        y = mos((i-1)*5+1: (i-1)*5+5);
        poly = polyfit(x,y,degree);
        polys(i,:)=poly;

    end

end

