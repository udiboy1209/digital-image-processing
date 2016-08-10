function [ interpolated ] = myNearestNeighborInterpolation( image )

[M, N, C] = size(image);
interpolated_cols = zeros(3*M-2, N, C);
interpolated_cols(1:3:end,:,:) = image(:,:,:);
interpolated_cols(2:3:end,:,:) = image(1:end-1,:,:);
interpolated_cols(3:3:end,:,:) = image(2:end,:,:);

interpolated = zeros(3*M-2, 2*N-1, C);
interpolated(:,1:2:end,:) = interpolated_cols(:,:,:);
interpolated(:,2:2:end,:) = interpolated_cols(:,1:end-1,:);


end

