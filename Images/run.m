%% Exercise 1 Template method

clear all;
close all;
clc;

image = imread('./Images/lena.png');
figure('name', 'Exercice 1 with lena Image')


% For Sobel filter
G1 = 1/4*[1 0 -1;2 0 -2; 1 0 -1]; 
G2 = 1/4*[-1 -2 -1; 0 0 0;1 2 1];
p=1;
range = 10:15:80;
for N=range
    edges = edge_detection(image, G1, G2,N, 2);
    subplot(3,length(range),p)
    imshow(edges)
    title(strcat('Sobel with threshold : ', num2str(N)))
    
    p = p+1;
end

% For Prewitt filter
G1 = 1/3*[1 0 -1;1 0 -1; 1 0 -1]; 
G2 = 1/3*[-1 -1 -1;0 0 0;1 1 1]; 
p=1;
for N=range
    edges = edge_detection(image, G1, G2,N, 2);
    subplot(3,length(range),p + length(range))
    imshow(edges)
    title(strcat('Prewitt with threshold : ', num2str(N)))
    
    p = p+1;
end

% For Roberts filter
G1 = [0 0 -1;0 1 0; 0 0 0]; 
G2 = [-1 0 0;0 1 0;0 0 0];
p=1;
for N=range
    edges = edge_detection(image, G1, G2,N, 2);
    subplot(3,length(range),p + 2*length(range))
    imshow(edges)
    title(strcat('Roberts with threshold : ', num2str(N)))
    
    p = p+1;
end

%% Exercise 2 Compass method

clear all;
close all;
clc;

%R45 = [cos(pi/4) -sin(pi/4);sin(pi/4) cos(pi/4)];



image = imread('./Images/road.png');

showEx2(image, 0:50:601, 'Exercise 2')




%% Exercise 3 Laplace operator
clear all;
close all;
clc;


image = imread('./Images/road.png');
sigma = 0.5;
size_log = 2*ceil(sigma/2)+1;

for N=0:5:100
    edges = laplace_operator(image,size_log,sigma,N);
    figure('name', strcat('Exercise 3 with threshold : ', num2str(N)))
    imshow(edges)
end




%% Exercise 4 Frei Chen method
clear all;
close all;
clc;

image = imread('./Images/road.png');

for N=0.2:0.05:0.95
    edges = freichen(image,N);
    figure('name', strcat('Exercise 4 with threshold : ', num2str(N)))
    imshow(edges)
end

























