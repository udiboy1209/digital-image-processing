%% MyMainScript

tic;

image1 = imread('../data/barbara.png');
image2 = imread('../data/TEM.png');
image3 = imread('../data/canyon.png');

figure,imshow(image1),colorbar;
figure,imshow(image2),colorbar;
figure,imshow(image3);

%% myLinearContrastStretching

image1_1=uint8(myLinearContrastStretching(image1));
image2_1=uint8(myLinearContrastStretching(image2));
image3_1=uint8(myLinearContrastStretching(image3));

imwrite(image1_1,'../images/barbaraLinearContrastStretching.png');
imwrite(image2_1,'../images/TEMLinearContrastStretching.png');
imwrite(image3_1,'../images/canyonLinearContrastStretching.png');

figure,imshow(image1_1),colorbar;
figure,imshow(image2_1),colorbar;
figure,imshow(image3_1);


%% myHE

image1_2=uint8(myHE(image1));
image2_2=uint8(myHE(image2));
image3_2=uint8(myHE(image3));

imwrite(image1_2,'../images/barbaraHE.png');
imwrite(image2_2,'../images/TEMHE.png');
imwrite(image3_2,'../images/canyonHE.png');

figure,imshow(image1_2);
figure,imshow(image2_2);
figure,imshow(image3_2);


%% myAHE

image1_3=uint8(myAHE(image1,40));
image2_3=uint8(myAHE(image2,40));
image3_3=uint8(myAHE(image3,40));

imwrite(image1_3,'../images/barbaraAHE.png');
imwrite(image2_3,'../images/TEMAHE.png');
imwrite(image3_3,'../images/canyonAHE.png');

figure,imshow(image1_3);
figure,imshow(image2_3);
figure,imshow(image3_3);

%% myCLAHE

image1_4=uint8(myCLAHE(image1,40,0.004));
image2_4=uint8(myCLAHE(image2,40,0.004));
image3_4=uint8(myCLAHE(image3,40,0.004));

imwrite(image1_4,'../images/barbaraCLAHE.png');
imwrite(image2_4,'../images/TEMCLAHE.png');
imwrite(image3_4,'../images/canyonCLAHE.png');

figure,imshow(image1_4);
figure,imshow(image2_4);
figure,imshow(image3_4);

toc;
