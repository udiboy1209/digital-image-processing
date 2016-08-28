function [ output ] = myUnsharpMasking( img, s, sigma )

h = fspecial('log', 1.5*[sigma, sigma], sigma);
log_img = imfilter(img, h);
output = img - s * log_img;
end

