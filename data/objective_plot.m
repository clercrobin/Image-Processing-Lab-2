function [  ] = objective_plot( data,configuration_lut, figname )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    figure('name',strcat('Question 4 ', figname))
    hold on
    for i = 1:5
        x = configuration_lut((i-1)*5+1: (i-1)*5+5);
        y = data((i-1)*5+1: (i-1)*5+5);
        plot(x,y)
    end
    
    legend('Bunny', 'Cube', 'Dragon', 'Sphere', 'Vase','Location','northwest')
    ylabel('Objective score') % x-axis label
    xlabel('Configuration') % y-axis label
    hold off

end

