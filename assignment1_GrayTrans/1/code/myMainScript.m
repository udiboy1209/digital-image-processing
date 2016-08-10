%% MyMainScript

tic;

%% myShrinkImageByFactorD

image1 = imread('../data/circles_concentric.png');
imshow(image1),colorbar;
figure,imshow(image1),colormap(parula(200)),colorbar;

image1_2=myShrinkImageByFactorD(2,image1);
figure,imshow(image1_2),colorbar;
figure,imshow(image1_2),colormap(parula(200)),colorbar;

image1_3=myShrinkImageByFactorD(3,image1);
figure,imshow(image1_3),colorbar;
figure,imshow(image1_3),colormap(parula(200)),colorbar;

imwrite(image1_2, '../images/undersampled_2.png');
imwrite(image1_3, '../images/undersampled_3.png');

%% myBilinearInterpolation

image2 = imread('../data/barbaraSmall.png');
figure,imshow(image2),colorbar;
figure,imshow(image2),colormap(parula(200)),colorbar;

image2_1=uint8(myBilinearInterpolation(image2));
figure,imshow(image2_1),colorbar;
figure,imshow(image2_1),colormap(parula(200)),colorbar;

imwrite(image2_1,'../images/barbaraBig.png');

%% myNearestNeighborInterpolation

image2_2=uint8(myNearestNeighborInterpolation(image2));
figure,imshow(image2_2),colorbar;
figure,imshow(image2_2),colormap(parula(200)),colorbar;

imwrite(image2_2,'../images/barbaraNearest.png');
toc;