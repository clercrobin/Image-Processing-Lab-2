function [ downsampled_image ] = downsample_custom( original_image, factor )
%downsample_custom Downsamples in the two directions
%   original_image
%   factor : integer

downsampled_image = original_image(1:factor:end,1:factor:end,:);

end