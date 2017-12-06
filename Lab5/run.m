%% Exercise 1 Cropping

clear all;
close all;
clc;

rtarget = 384;
ctarget = 528;

kodim03 = imread('./Images/kodim03.png');
kodim23 = imread('./Images/kodim23.png');
kodim03 = rgb2gray(kodim03);
kodim23 = rgb2gray(kodim23);
figure()
imshow(kodim03)
figure()
imshow(kodim23)

[rows3, cols3] = size(kodim03)
[rows23, cols23] = size(kodim23)

figure('name', 'Ex 1.1k3')
rb = 50;
cb = 150;
imshow(kodim03(rb:rb+rtarget, cb:cb+ctarget));
figure('name', 'Ex 1.1k23')
rb = 70;
cb = 70;
imshow(kodim23(rb:rb+rtarget, cb:cb+ctarget));

% The energy of the edges, I take the barycenter.

%% Question 2 
% 
% [Gx, Gy] = imgradientxy(kodim03, 'sobel');
% Gx = abs(Gx);
% Gy = abs(Gy);
% 
% rmax = 1;
% cmax = 1;
% valmax = 0;
% 
% for rb=1:1:(rows3-rtarget)
%     for cb=1:1:(cols3-ctarget)
%         newval = sum(Gx(rb:rb+rtarget, cb:cb+ctarget)+Gy(rb:rb+rtarget, cb:cb+ctarget));
%         if newval>valmax
%             rmax = rb;
%             cmax = cb;
%             valmax = newval;
%         end
%     end
% end
% 
% figure()
% imshow(kodim03(rb:rb+rtarget, cb:cb+ctarget));
% 
% 
% [Gx, Gy] = imgradientxy(kodim23, 'sobel');
% Gx = abs(Gx);
% Gy = abs(Gy);
% 
% rmax = 1;
% cmax = 1;
% valmax = 0;
% 
% for rb=1:1:(rows3-rtarget)
%     for cb=1:1:(cols3-ctarget)
%         newval = sum(Gx(rb:rb+rtarget, cb:cb+ctarget)+Gy(rb:rb+rtarget, cb:cb+ctarget));
%         if newval>valmax
%             rmax = rb;
%             cmax = cb;
%             valmax = newval;
%         end
%     end
% end
% 
% figure()
% imshow(kodim23(rb:rb+rtarget, cb:cb+ctarget));

%% Recursive
[Gx, Gy] = imgradientxy(kodim03, 'sobel');
Gx = abs(Gx);
Gy = abs(Gy);
G = Gx + Gy;
rmax = 1;
cmax = 1;
valmax = 0;



for rb=1:1:(rows3-rtarget)
    newval = sum(sum(G(rb:rb+rtarget, 1:1+ctarget)));
    for cb=2:1:(cols3-ctarget)
        newval = newval-sum(sum(G(rb:rb+rtarget, cb-1)))+sum(sum(G(rb:rb+rtarget, cb+ctarget)));
        if (newval>valmax)
            rmax = rb
            cmax = cb
            valmax = newval;
        end
    end
end

figure('name', 'Ex 1.2k3')
croped = kodim03(rmax:rmax+rtarget, cmax:cmax+ctarget)
imshow(kodim03(rmax:rmax+rtarget, cmax:cmax+ctarget));

%% Recursive version for kodim23
[Gx, Gy] = imgradientxy(kodim23, 'sobel');
Gx = abs(Gx);
Gy = abs(Gy);

G = Gx + Gy;

rmax = 1;
cmax = 1;
valmax = 0;



for rb=1:1:(rows3-rtarget)
    newval = sum(sum(G(rb:rb+rtarget-1, 1:1+ctarget-1)));
    for cb=2:1:(cols3-ctarget)
        newval = newval-sum(sum(G(rb:rb+rtarget-1, cb-1)))+sum(sum(G(rb:rb+rtarget-1, cb+ctarget)));
        if (newval>valmax)
            rmax = rb;
            cmax = cb;
            valmax = newval;
        end
    end
end
croped = kodim23(rmax:rmax+rtarget-1, cmax:cmax+ctarget-1)
figure('name', 'Ex 1.2k23')

imshow(kodim23(rmax:rmax+rtarget-1, cmax:cmax+ctarget-1));


%% Exercise 2 Resizing

% Question 1

kodim03c = imread('./Images/kodim03.png');
kodim23c = imread('./Images/kodim23.png');

figure('name','Ex2k3')
imshow(downsample_custom(kodim03c,2))

figure('name','Ex2k23')
imshow(downsample_custom(kodim23c,2))


%% 2.2

kodim03bilin = bilinearInterpolation(kodim03c, [floor(rows3/2),floor(cols3/2)])
figure('name','Ex2k33')
imshow(kodim03bilin)

figure('name','Mine')
downsampled = downsample_custom(kodim03c,2);
out = bilinearReconstruct( downsampled, 2 )
imshow(out)


%% Exercise 3

[Gx, Gy] = imgradientxy(kodim03, 'sobel');
Gx = abs(Gx);
Gy = abs(Gy);
G = Gx + Gy;

mymap = seam_map(G)