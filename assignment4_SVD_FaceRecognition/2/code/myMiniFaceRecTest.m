function [ min_index ] = myMiniFaceRecTest( x_img,  eigenCoords, eigenVectors)
    x_coord = eigenVectors'*x_img;
    %[M, N] = size(eigenCoords);
    
    coordsDiff = bsxfun(@minus,eigenCoords,x_coord);
    coordsDiffSq = coordsDiff.^2;
    [mininumVal, min_index] = min((sum(coordsDiffSq)));
end

