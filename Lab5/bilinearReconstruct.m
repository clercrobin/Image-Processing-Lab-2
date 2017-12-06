function [ out ] = bilinearReconstruct( image, factor )

    [rows, cols,chan] = size(image);

    out = zeros(rows*factor, cols*factor, chan);

    out(1:factor:end,1:factor:end,:) = image;

    for x=1:1:rows-1
        for y=1:1:cols*factor-1
            out(2*x,y,:) = (0.5*out(2*x-1,y,:)+0.5*out(2*x+1,y,:));
        end
    end
    

    for y=1:1:cols-1
        for x=1:1:rows*factor-1
            out(x,2*y,:) = (0.5*out(x,2*y-1,:)+0.5*out(x,2*y+1,:));
        end
    end
    
    out = out/255
    
%     for x=1:1:rows-1
%         for y=1:1:cols*factor-1
% 
%             out(2*x,y,:) = 0.5*out(2*x-1,y,:)+0.5*out(2*x+1,y,:);
%         end
%     end

end

