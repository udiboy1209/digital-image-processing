function [ contrast ] = myLinearContrastStretching( image )
[M,N,C]=size(image);
contrast=zeros(size(image));

for h=1:C

    maxp = max(max(image(:,:,h)));
    minp = min(min(image(:,:,h)));

    sub = double(ones(M,N));
    image(:,:,h) = image(:,:,h) - sub*minp;

    f = 1.0/(maxp - minp);
    contrast(:,:,h) = image(:,:,h).*f;

end