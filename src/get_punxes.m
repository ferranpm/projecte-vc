function [ punxes ] = get_punxes(BW)
    BWO = imopen(BW, strel('disk', 10));

    CC = bwconncomp(BWO);
    npixels = cellfun(@numel, CC.PixelIdxList);
    [v, i] = max(npixels);
    BWO(:,:) = 0;
    BWO(CC.PixelIdxList{i}) = 1;

    BWN = medfilt2(BW - BWO, [9 9]);
    BWN = bwmorph(BWN, 'clean');
    CC = bwconncomp(BWN);
    npixels = cellfun(@numel, CC.PixelIdxList);
    punxes = sum(npixels >= 100);
end
