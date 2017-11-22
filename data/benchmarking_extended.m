function [  ] = benchmarking_extended( data, mos, cis, polys, figname )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    figure('name',strcat('Exercise 5 Benchmarking with the interpolation for method ', figname))
    hold on
    for i = 1:5
        x = data((i-1)*5+1: (i-1)*5+5);
        y = mos((i-1)*5+1: (i-1)*5+5);
        err = cis((i-1)*5+1: (i-1)*5+5);
        errorbar(x,y,err)
    end
    
    for i = 1:5
        x = 0.01:0.01:0.08;
        poly = polys(i,:)
        y1 = polyval(poly,x);
        hold on
        plot (x,y1)
    end
    
    legend('Bunny', 'Cube', 'Dragon', 'Sphere', 'Vase','Bunny_approached', 'Cube_approached', 'Dragon_approached', 'Sphere_approached', 'Vase_approached','Location','northeast')
    xlabel('Objective score') % x-axis label
    ylabel('MOS') % y-axis label
    hold off


end
