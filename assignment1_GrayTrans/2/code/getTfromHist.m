function [ T ] = getTfromHist( hist )
T = cumsum(hist);
T = uint8((T/(T(end)))*255);
end

