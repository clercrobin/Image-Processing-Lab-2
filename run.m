%% Exercise 1 Fixed threshold method

clear all;
close all;
clc;

lena_png = imread('./Images/lena-y.png');
%imshow(lena_png);
[rows, cols] = size(lena_png)
myMax =  double(max(max(lena_png)));
myMin = double(min(min(lena_png)));
ourRange = [myMin myMax];
halfRange = uint8((myMax + myMin)/2.);
thresholded = lena_png>halfRange;
figure('name', 'Exercise 1')
imshow(thresholded)

%% Exercise 2
clear all;
close all;
clc;

lena_png = imread('./Images/lena-y.png');
%imshow(lena_png);
[rows, cols] = size(lena_png)

for N=1:5:102
    randomed = uint8(unidrnd(N, rows,cols));
    lena_noised = lena_png + randomed;
    myMax = double(max(max(lena_noised)));
    myMin = double(min(min(lena_noised)));
    ourRange = [myMin myMax];
    halfRange = uint8((myMax + myMin)/2.);
    thresholded = lena_noised>halfRange;
    figure('name', strcat('With added noise of maximum amplitude : ', num2str(N)))
    imshow(thresholded)
end

%% Exercise 3
clear all;
close all;
clc;

lena=imread('./Images/lena-y.png'); % Read the ’lena-y.png’ image

S = [34 29 17 21 30 35; 
    28 14 9 16 20 31;
    13 8 4 5 15 19;
    12 3 0 1 10 18;
    27 7 2 6 23 24;
    33 26 11 22 25 32]

thresholded = orderedThreshold(lena, S);
figure('name', 'Exercise 3')
imshow(thresholded)



%% Exercise 4
clear all;
close all;
clc;

lena=imread('./Images/lena-y.png'); % Read the ’lena-y.png’ image

C6 = [34 25 21 17 29 33;
    30 13 9 5 12 24;
    18 6 1 0 8 20;
    22 10 2 3 4 16;
    26 14 7 11 15 28;
    35 31 19 23 27 32]

thresholded = orderedThreshold(lena, C6);
figure('name', 'Exercise 5 : C6')
imshow(thresholded)


E6 = [30 22 16 21 33 35;
    24 11 7 9 26 28;
    13 5 0 2 14 19;
    15 3 1 4 12 18;
    27 8 6 10 25 29;
    32 20 17 23 31 34]

thresholded = orderedThreshold(lena, E6);
figure('name', 'Exercise 5 : E6')
imshow(thresholded)


%% Exercise 5
clear all;
close all;
clc;

lena=imread('./Images/wool.png'); % Read the ’lena-y.png’ image
O81 = [13 9 5 12;
    6 1 0 8;
    10 2 3 4;
    14 7 11 15];

O82 = [18 22 26 19;
    25 30 31 23;
    21 29 28 27;
    17 24 20 16];

O8 = [O81 O82;O82 O81]


thresholded = orderedThreshold(lena, O8);
figure('name', 'Exercise 5 : O8')
imshow(thresholded)

%% Exercise 6
clear all;
close all;
clc;

lena=imread('./Images/lena-y.png'); % Read the ’lena-y.png’ image

D2 = [0 2;
    3 1];

D3 = [8 4 5;
    3 0 1;
    7 2 6]

D6 = [4*D3 (4*D3+2*ones(size(D3)));
    (4*D3+3*ones(size(D3))) (4*D3+ones(size(D3)))]


thresholded = orderedThreshold(lena, D6);
figure('name', 'Exercise 6 : D6')
imshow(thresholded)

%% Exercise 7

clear all;
close all;
clc;

% Matlab Implementation of Error diffusion using Floyd's and Steinberg's...
% filter weights.
lena_png=(imread('./Images/lena-y.png'));
myMax =  double(max(max(lena_png)));
myMin = double(min(min(lena_png)));
ourRange = [myMin myMax];
halfRange = uint8((myMax + myMin)/2.);
[rows, cols] = size(lena_png);
thresholded = zeros(rows,cols);
for i = 1 : rows
   for j = 1 : cols
       if(lena_png(i,j) < halfRange )
           thresholded(i,j)=0;
       else 
           thresholded(i,j) = 255;
       end
       error = lena_png(i,j) - thresholded(i,j);
       
       % Let us propagate the error to the neighbors
       if(j < cols) % If we are not at the end of the column
           lena_png(i,j+1) =  ((7/16 *error)+lena_png(i,j+1)); 
       end
       if(i<rows) % If you are not at the last line
           lena_png(i+1,j) = lena_png(i+1,j) + (5/16 *error);
           if (j > 1) % If we are not at the first column
               lena_png(i+1,j-1) = lena_png(i+1,j-1) + (3/16 *error);
           end
           if (j<cols) % If we are not at the end of the column
               lena_png(i+1,j+1) = lena_png(i+1,j+1) + (1/16 *error);
           end
           
       end
           
           
       
   end
end
 
figure('name', 'Exercise 7 Floyd')
imshow(thresholded);

%% Exercise 7 - 2

clear all;
close all;
clc;

% Matlab Implementation of Error diffusion using Floyd's and Steinberg's...
% filter weights.
lena_png=(imread('./Images/lena-y.png'));
myMax =  double(max(max(lena_png)));
myMin = double(min(min(lena_png)));
ourRange = [myMin myMax];
halfRange = uint8((myMax + myMin)/2.);
[rows, cols] = size(lena_png);
thresholded = zeros(rows,cols);
normalization = 42;
for i = 1 : rows
   for j = 1 : cols
       if(lena_png(i,j) < halfRange )
           thresholded(i,j)=0;
       else 
           thresholded(i,j) = 255;
       end
       error = lena_png(i,j) - thresholded(i,j);
       
       % Let us propagate the error to the neighbors
       % Works on each column
       if(j < cols - 1) % If we are not at more than two columns from the last
           lena_png(i,j+2) =  lena_png(i,j+2) + (4/normalization *error); 
       end
       if(j < cols) % If we are not at the last the column
           lena_png(i,j+1) =  lena_png(i,j+1) + (8/normalization *error); 
       end
       
       if(i<rows) % If you are not at the last line
           lena_png(i+1,j) = lena_png(i+1,j) + (8/normalization *error);
           if (j > 2) % If we are not at the first column
               lena_png(i+1,j-2) = lena_png(i+1,j-2) + (2/normalization *error);
           end
           if (j > 1) % If we are not at the first column
               lena_png(i+1,j-1) = lena_png(i+1,j-1) + (4/normalization *error);
           end
           if (j<cols) % If we are not at the end of the column
               lena_png(i+1,j+1) = lena_png(i+1,j+1) + (4/normalization *error);
           end
           if (j<cols-1) % If we are not at the end of the column
               lena_png(i+1,j+2) = lena_png(i+1,j+2) + (2/normalization *error);
           end
           
       end
       
       if(i<rows-1) % If you are not just before the last line
           lena_png(i+2,j) = lena_png(i+2,j) + (4/normalization *error);
           if (j > 2) % If we are not at the first column
               lena_png(i+2,j-2) = lena_png(i+2,j-2) + (1/normalization *error);
           end
           if (j > 1) % If we are not at the first column
               lena_png(i+2,j-1) = lena_png(i+2,j-1) + (2/normalization *error);
           end
           if (j<cols) % If we are not at the end of the column
               lena_png(i+2,j+1) = lena_png(i+2,j+1) + (2/normalization *error);
           end
           if (j<cols-1) % If we are not at the end of the column
               lena_png(i+2,j+2) = lena_png(i+2,j+2) + (1/normalization *error);
           end
           
       end
       
       
           
           
       
   end
end
 
figure('name', 'Exercise 7 Stucki')
imshow(thresholded);


