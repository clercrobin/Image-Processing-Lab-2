function [ output_args ] = showEx2( image, range, figname )

figure('name', figname)
p=1;
for N=range
    edges = compass_edge(image, N);
    subplot(ceil(sqrt(length(range))),ceil(sqrt(length(range))),p)
    imshow(edges)
    title(strcat('With threshold : ', num2str(N)))
    p=p+1;
    
end

end

