%% MyMainScript

tic;
%% Your code here
load('../data/boat.mat');
boat = rescale(imageOrig);

figure, imshow(boat);
myHarrisCornerDetector(boat, 10, 1, 0.15);
myHarrisCornerDetector(boat, 10, 2, 0.15);
myHarrisCornerDetector(boat, 10, 3, 0.15);
toc;
