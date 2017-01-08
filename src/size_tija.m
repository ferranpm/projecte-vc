function [ tija ] = size_tija(BW)
     BW = imresize(BW, [200 200], 'nearest');
     BWO = imopen(BW, strel('disk', 16));
     BWN = BW - BWO;
     [f, c] = size(BW);
     BWN(1:floor(f/2), 1:c) = 0;
     tija = sum(sum(BWN));
end
