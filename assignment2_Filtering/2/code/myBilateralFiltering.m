function [ output ] = myBilateralFiltering( img, sigma_s, sigma_i)

w = floor(sigma_s*3); % window size = 6 sigma_s
[M, N] = size(img);

% Gaussian weights for space
Gs = fspecial('gaussian', [2*w+1, 2*w+1], sigma_s);

img = padarray(img, [w w], inf);
output = zeros([M,N]);
e = 2*sigma_i^2;
k = sqrt(2*pi)*sigma_i;

for i = 1+w:M+w
    for j = 1+w:N+w
        p = img(i,j);
        
        % Get difference of intensities
        window = img(i-w:i+w,j-w:j+w);
        
        % calculate gaussian weight
        Gi = exp(-(window-p).^2 / e) / k;

        window(window == inf) = 0;
        
        % calculate final pixel value = sum(Gs * Gi * window)
        output(i-w, j-w) = sum(sum(Gs.*Gi.*window));
    end
end

M = max(max(output));
m = min(min(output));

output = output/(M-m);