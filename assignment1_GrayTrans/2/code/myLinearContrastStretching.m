function [ contrast ] = myLinearContrastStretching( image )

maxp = max(max(image));
minp = min(min(image));

sub = uint8(ones(size(image)));
image = image - sub*minp;

f = 255/(maxp - minp);
contrast = image.*f;

