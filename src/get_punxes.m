function [ punxes ] = get_punxes(BW)
    BWO = imopen(BW, strel('disk', 5));
    BWN = BW - BWO;
    CC = bwconncomp(BWN);
    npixels = cellfun(@numel, CC.PixelIdxList);
    punxes = sum(npixels >= 50);
end
