function [ punxes ] = get_punxes(BW)
    BWO = imopen(BW, strel('disk', 10));
    BWN = BW - BWO;
    CC = bwconncomp(BWN);
    npixels = cellfun(@numel, CC.PixelIdxList);
    punxes = sum(npixels >= 100);
end
