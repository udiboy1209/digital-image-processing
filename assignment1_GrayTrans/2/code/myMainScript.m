%% MyMainScript

tic;
%% Your code here
image1 = imread('../data/barbara.png');
image2 = imread('../data/TEM.png');
image3 = imread('../data/canyon.png');

imshow(uint8(myLinearContrastStretching(image1)));
toc;
