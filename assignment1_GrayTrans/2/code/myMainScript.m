%% MyMainScript

tic;

image1 = imread('../data/barbara.png');
image2 = imread('../data/TEM.png');
image3 = imread('../data/canyon.png');

%% myLinearContrastStretching

%imshow(image1),colorbar;
%figure,imshow(uint8(myLinearContrastStretching(image1))),colorbar;
%figure,imshow(image2),colorbar;
%figure,imshow(uint8(myLinearContrastStretching(image2))),colorbar;



%% myHE
%figure,imshow(image1);
%figure,imshow(myHE(image1));
%figure,imshow(image2);
%figure,imshow(myHE(image2));
%figure,imshow(image3);
%figure,imshow(myHE(image3));

%% myAHE
%figure,imshow(uint8(myAHE(image1,40)));
%figure,imshow(uint8(myAHE(image2,50)));
figure,imshow(uint8(myCLAHE(image3,30,1000)));


toc;
