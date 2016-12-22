function [ BWM ] = biggest_region(BW)
    CC = bwconncomp(BW);
    npixels = cellfun(@numel, CC.PixelIdxList);
    [v, i] = max(npixels);
    BWM = zeros(size(BW));
    BWM(CC.PixelIdxList{i}) = 1;
 end
