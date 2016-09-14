%% MyMainScript

tic;
%% Your code here
load('../data/boat.mat');
boat = rescale(imageOrig);

figure, imshow(boat);
title('Original');
myHarrisCornerDetector(boat, 10, 1, 0.15);
toc;
