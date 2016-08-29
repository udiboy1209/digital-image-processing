function [ output ] = myUnsharpMasking( img, s, sigma )

h = fspecial('log', round(6*[sigma, sigma]), sigma);
log_img = imfilter(img, h);
output = img - s * log_img;
end

