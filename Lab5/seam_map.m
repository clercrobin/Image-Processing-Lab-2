function [ result ] = seam_map( energies )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

    [rows, cols] = size(energies)
    mat = zeros(rows, cols+2);

    mat(:,1) = Inf(rows,1);
    mat(:,cols+2) = Inf(rows,1);
    mat(1,2:cols+1) = energies(1,:);

    for i=2:1:rows
        for 1=2:1:cols
            i
            j
            mat(i,j)=energies(i,j-1)+min(mat(i-1,j),min(mat(i,j),mat(i+1,j)));
        end
    end
    
    result = mat(:,2:cols+1);
end

