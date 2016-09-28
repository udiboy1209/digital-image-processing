function [ output ] = rescale( img )
%RESCALE Rescale image to lie in 0 -> 1
M = max(max(img));
m = min(min(img));

output = (double(img)-m)/(M-m);
end

