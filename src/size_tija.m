function [ tija ] = size_tija(BW)
     BWO = imopen(BW, strel('disk', 20));

     CC = bwconncomp(BWO);
     npixels = cellfun(@numel, CC.PixelIdxList);
     [v, i] = max(npixels);
     BWO(:,:) = 0;
     BWO(CC.PixelIdxList{i}) = 1;

     BWN = medfilt2(BW - BWO, [9 9]);
     BWN = bwmorph(BWN, 'clean');

     CC = bwconncomp(BWN);
     npixels = cellfun(@numel, CC.PixelIdxList);
     [v, i] = max(npixels);
     BWN(:,:) = 0;
     BWN(CC.PixelIdxList{i}) = 1;

     Props = regionprops(BWN, 'Perimeter');
     tija = Props.Perimeter;
end
