function [ x ] = processar(filename)
    I = imread(filename);
    I = rgb2gray(I);
    I = imfilter(I, fspecial('gaussian'));
    BW = I < 180;
    BW = medfilt2(BW, [3 3]);
    BW = imfill(BW, 'holes');

    % Agafem el tros més gran de la imatge
    CC = bwconncomp(BW);
    npixels = cellfun(@numel, CC.PixelIdxList);
    [v, i] = max(npixels);
    BW(:,:) = 0;
    BW(CC.PixelIdxList{i}) = 1;

    Props = regionprops(BW, 'Area', 'Perimeter');
    compacity = (Props.Perimeter*Props.Perimeter)/Props.Area;

    [f c] = size(I);
    x = struct('compacity', compacity, 'npunxes', get_punxes(BW), 'area', Props.Area/(f*c));
end

