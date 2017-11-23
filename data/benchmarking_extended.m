function [  ] = benchmarking_extended( data, mos, cis,poly1,poly3, figname )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    f = figure('name',strcat('Exercise 5 Benchmarking with the interpolation for method ', figname))
    hold on
    mat = [data,mos]
    [~,idx]= sort(mat(:,1));
    sortedmat=mat(idx,:);
    for i = 1:5
        x = data((i-1)*5+1: (i-1)*5+5);
        y = mos((i-1)*5+1: (i-1)*5+5);
        err = cis((i-1)*5+1: (i-1)*5+5);
        errorbar(x,y,err, 'LineStyle','None')
    end
    y1 = polyval(poly1,sortedmat(:,1));
    y3 = polyval(poly3,sortedmat(:,1));
    plot (sortedmat(:,1),y1)
    plot (sortedmat(:,1),y3)
    
    
    
    legend('Bunny', 'Cube', 'Dragon', 'Sphere', 'Vase','Location','northeast')
    xlabel('Objective score') % x-axis label
    ylabel('MOS') % y-axis label


end

