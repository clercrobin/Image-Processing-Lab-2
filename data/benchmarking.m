function [  ] = benchmarking( data, mos, cis, figname )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    figure('name',strcat('Exercise 5 Benchmarking method ', figname))
    hold on
    for i = 1:5
        x = data((i-1)*5+1: (i-1)*5+5);
        y = mos((i-1)*5+1: (i-1)*5+5);
        err = cis((i-1)*5+1: (i-1)*5+5);
        errorbar(x,y,err)
    end
    
    legend('Bunny', 'Cube', 'Dragon', 'Sphere', 'Vase','Location','northeast')
    xlabel('Objective score') % x-axis label
    ylabel('MOS') % y-axis label
    hold off


end

