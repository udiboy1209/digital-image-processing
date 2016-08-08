function [ T ] = getTfromHistCL( hist, thresh )
B = hist;
[i] = find(hist>thresh);
hist(i) = thresh;
B = B - hist;
hist = hist + sum(B)/255;

T = cumsum(hist);
T = uint8((T/(T(end)))*255);
end

