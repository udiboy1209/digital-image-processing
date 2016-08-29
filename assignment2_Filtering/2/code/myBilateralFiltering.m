function [ output ] = myBilateralFiltering( img, sigma_s, sigma_i)

w = round(sigma_s*3); % window size = 6 sigma_s
[M, N] = size(img);

% Gaussian weights for space
Gs = fspecial('gaussian', [2*w, 2*w], sigma_s);

img = padarray(img, [w w], inf);
output = zeros([M,N]);

for i = 1+w:M+w
    for j = 1+w:N+w
        p = img(i,j);
        
        % Get difference of intensities
        window = img(i-w:i+w-1,j-w:j+w-1);
        
        % calculate gaussian weight
        Gi = exp(-(window-p).^2 / sigma_i.^2) / (2*pi*sigma_i);

        window(window == inf) = 0;
        
        % calculate final pixel value = sum(Gs * Gi * window)
        output(i-w, j-w) = sum(sum(Gs.*Gi.*window));
    end
end

M = max(max(output));
m = min(min(output));

output = output/(M-m);