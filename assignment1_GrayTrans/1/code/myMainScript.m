%% MyMainScript

tic;
%% Your code here
image1 = imread('../data/circles_concentric.png');
imwrite(myShrinkImageByFactorD(2,image1), '../images/undersampled_2.png');
imwrite(myShrinkImageByFactorD(3,image1), '../images/undersampled_3.png');

image2 = imread('../data/barbaraSmall.png');
imwrite(myBilinearInterpolation(image2),'../images/barbaraBig.png');

imwrite(myNearestNeighborInterpolation(image2),'../images/barbaraNearest.png');
toc;