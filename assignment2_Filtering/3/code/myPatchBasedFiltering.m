function [ output ] = myPatchBasedFiltering( img, sigma, window_size, patch_size )

[M, N] = size(img);
w = floor(window_size/2);
p = floor(patch_size/2);

img = padarray(img, [w w], 10000);
output = zeros([M N]);
e = 2*sigma^2;
k = sqrt(2*pi)*sigma;

for i = 1+w:M+w
    for j = 1+w:N+w
        window = img(i-w:i+w, j-w:j+w);
        center_patch = img(i-p:i+p, j-p:j+p);
        intensity = 0;
        weight_sum = 0;
        for k = 1+p:window_size-p
            for l = 1+p:window_size-p
                ssd = sum(sum((window(k-p:k+p, l-p:l+p) - center_patch).^2));
                if ssd > 0
                    weight = exp(-ssd^2/e)/k;
                
                    intensity = intensity + weight * window(k,l);
                    weight_sum = weight_sum + weight;
                end
            end
        end
        
        output(i-w, j-w) = intensity/weight_sum;
    end
end

