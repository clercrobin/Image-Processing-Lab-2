% Image dithering library
% Written by Michalis Zervos - All rights reserved
% http://michal.is/projects/image-dithering-in-matlab/


%%

clear all;
close all;
clc;

%% Fixed threshols method

% Read images
I1 = imread('Images\lena-y.png');
I2 = imread('Images\wool.png');

% Threshold
T1 = threshold(I1, 0.5);
T2 = threshold(I2, 0.5);

% Compute Mean Squared Error
e1 = msei(I1, T1);
e2 = msei(I2, T2);
me = mean([e1 e2]);
fprintf('Fixed Threshold\n');
fprintf('MSE(lena) = %f\nMSE(wool) = %f\n', e1, e2);
fprintf('Mean: %f\n\n', me);

% Show images
figure; imshow(T1); title(['Lena - Fixed threshold - MSE: ', num2str(e1)]);
figure; imshow(T2); title(['Wool - Fixed threshold - MSE: ', num2str(e2)]);
imwrite(T1, 'FixedThres_Lena.png');
imwrite(T2, 'FixedThres_Wool.png');

%% Random threshold method

% Read images
I1 = imread('Images\lena-y.png');
I2 = imread('Images\wool.png');

ampl1 = 30;
ampl2 = 50;

T1 = randomThreshold(I1, ampl1);
T2 = randomThreshold(I2, ampl2);

% Compute Mean Squared Error
e1 = msei(I1, T1);
e2 = msei(I2, T2);
me = mean([e1 e2]);
fprintf('Random Threshold - Noise amplitude (Lena): %d - Noise amplitude (Wool): %d\n', ampl1, ampl2);
fprintf('MSE(lena) = %f\nMSE(wool) = %f\n', e1, e2);
fprintf('Mean: %f\n\n', me);

% Show images
figure; imshow(T1);
title(['Lena - Threshold on noisy image. Noise amplitude = ', num2str(ampl1), '. MSE: ', num2str(e1)]);
figure; imshow(T2);
title(['Wool - Threshold on noisy image. Noise amplitude = ', num2str(ampl2), '. MSE: ', num2str(e2)]);

imwrite(T1,['ThresholdNoise_Lena', num2str(ampl1), '.png']);
imwrite(T2,['ThresholdNoise_Wool', num2str(ampl2), '.png']);


%% Ordered threshold method with clustered dots

% Ordered threshold method is in orderedThreshold.m

% Read images
I1 = imread('Images\lena-y.png');
I2 = imread('Images\wool.png');

% Apply dithering
T1 = orderedThreshold(I1, 1); 
T2 = orderedThreshold(I2, 1); 

% Compute Mean Squared Error
e1 = msei(I1, T1);
e2 = msei(I2, T2);
me = mean([e1 e2]);
fprintf('Ordered threshold\n');
fprintf('MSE(lena) = %f\nMSE(wool) = %f\n', e1, e2);
fprintf('Mean: %f\n\n', me);

% Show images
figure; imshow(T1); title(['Lena - Ordered Threshold - MSE: ', num2str(e1)]);
figure; imshow(T2); title(['Wool - Ordered Threshold - MSE: ', num2str(e2)]);
imwrite(T1, 'OrderedThreshold_Lena.png');
imwrite(T2, 'OrderedThreshold_Wool.png');

%% Ordered matrix with centered points (central white and balanced central)

% Read images
I1 = imread('Images\lena-y.png');
I2 = imread('Images\wool.png');

  
% Apply dithering
% Central white
T1C = orderedThreshold(I1, 2);
T2C = orderedThreshold(I2, 2);

% Balanced central
T1E = orderedThreshold(I1, 3);
T2E = orderedThreshold(I2, 3);


% Compute Mean Squared Error
e1c = msei(I1, T1C);
e2c = msei(I2, T2C);
e1e = msei(I1, T1E);
e2e = msei(I2, T2E);
me1 = mean([e1c e2c]);
me2 = mean([e1e e2e]);
fprintf('Ordered matrix with central white point\n');
fprintf('MSE(lena) = %f\nMSE(wool) = %f\n', e1c, e2c);
fprintf('Mean: %f\n\n', me1);
fprintf('Ordered matrix with balanced centered point\n');
fprintf('MSE(lena) = %f\nMSE(wool) = %f\n', e1e, e2e);
fprintf('Mean: %f\n\n', me2);

% Show images
figure; imshow(T1C); title(['Lena - Ordered matrix with central white point - MSE: ', num2str(e1c)]);
figure; imshow(T2C); title(['Wool - Ordered matrix with central white point - MSE: ', num2str(e2c)]);

figure; imshow(T1E); title(['Lena - Ordered matrix with balanced centered point - MSE: ', num2str(e1e)]);
figure; imshow(T2E); title(['Wool - Ordered matrix with balanced centered point - MSE: ', num2str(e2e)]);

imwrite(T1C, 'CentralWhite_Lena.png');
imwrite(T2C, 'CentralWhite_Wool.png');
imwrite(T1E, 'BalancedCentral_Lena.png');
imwrite(T2E, 'BalancedCentral_Wool.png');

%% Diagonal ordered matrix with balanced centered points

% Read images
I1 = imread('Images\lena-y.png');
I2 = imread('Images\wool.png');


% Apply dithering
T1 = orderedThreshold(I1, 4);
T2 = orderedThreshold(I2, 4);

% Compute Mean Squared Error
e1 = msei(I1, T1);
e2 = msei(I2, T2);
me = mean([e1 e2]);
fprintf('Diagonal ordered matrix with balanced centered points\n');
fprintf('MSE(lena) = %f\nMSE(wool) = %f\n', e1, e2);
fprintf('Mean: %f\n\n', me);

% Show images
figure; imshow(T1); title(['Lena - Diagonal ordered matrix with balanced centered point - MSE: ', num2str(e1)]);
figure; imshow(T2); title(['Wool - Diagonal ordered matrix with balanced centered point - MSE: ', num2str(e2)]);
imwrite(T1, 'Diagonal_Lena.png');
imwrite(T2, 'Diagonal_Wool.png');


%% Ordered matrix with dispersed dots

% Read images
I1 = imread('Images\lena-y.png');
I2 = imread('Images\wool.png');

% Apply dithering
T1 = orderedThreshold(I1, 5);
T2 = orderedThreshold(I2, 5);

% Compute Mean Squared Error
e1 = msei(I1, T1);
e2 = msei(I2, T2);
me = mean([e1 e2]);
fprintf('Ordered matrix with dispersed dots\n');
fprintf('MSE(lena) = %f\nMSE(wool) = %f\n', e1, e2);
fprintf('Mean: %f\n\n', me);

% Show images
figure; imshow(T1); title(['Lena - Ordered matrix with dispersed dots - MSE: ', num2str(e1)]);
figure; imshow(T2); title(['Wool - Ordered matrix with dispersed dots - MSE: ', num2str(e2)]);
imwrite(T1, 'Sparse_Lena.png');
imwrite(T2, 'Sparse_Wool.png');



%% "Error diffusion method
I1 = imread('Images\lena-y.png');
I2 = imread('Images\wool.png');


% Compute the images with both filters
T1F1 = errorDiffusion(I1, 1);
T2F1 = errorDiffusion(I2, 1);
T1F2 = errorDiffusion(I1, 2);
T2F2 = errorDiffusion(I2, 2);

% Compute Mean Squared Error
e1f1 = msei(I1, T1F1);
e2f1 = msei(I2, T2F1);
e1f2 = msei(I1, T1F2);
e2f2 = msei(I2, T2F2);
me1 = mean([e1f1 e2f1]);
me2 = mean([e1f2 e2f2]);
fprintf('Error diffusion method - Floyd & Steinberg filter\n');
fprintf('MSE(lena) = %f\nMSE(wool) = %f\n', e1f1, e2f1);
fprintf('Mean: %f\n\n', me1);
fprintf('Error diffusion method - Stucki filter\n');
fprintf('MSE(lena) = %f\nMSE(wool) = %f\n', e1f2, e2f2);
fprintf('Mean: %f\n\n', me2);

% Show images
figure; imshow(T1F1); title(['Lena - Error diffusion with Floyd-Steinberg filter - MSE: ', num2str(e1f1)]);
figure; imshow(T2F1); title(['Wool - Error diffusion with Floyd-Steinberg filter - MSE: ', num2str(e1f1)]);
figure; imshow(T1F2); title(['Lena - Error diffusion with Stucki filter - MSE: ', num2str(e1f2)]);
figure; imshow(T2F2); title(['Wool - Error diffusion with Stucki filter - MSE: ', num2str(e1f2)]);

 
imwrite(T1F1, 'ErrorDiffusionFloyd_Lena.png');
imwrite(T2F1, 'ErrorDiffusionFloyd_Wool.png');
imwrite(T1F2, 'ErrorDiffusionStucki_Lena.png');
imwrite(T2F2, 'ErrorDiffusionStucki_Wool.png');


%%