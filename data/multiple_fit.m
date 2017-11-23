function [ p1, p3 ] = multiple_fit( data, mos )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    mat = [data,mos]
    [~,idx]= sort(mat(:,1));
    sortedmat=mat(idx,:);
    p1 = polyfit(sortedmat(:,1),sortedmat(:,2),1);
    p3 = polyfit(sortedmat(:,1),sortedmat(:,2),3);
end

