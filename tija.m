clear all; close all;

imf = dir('images/tests/*.tif');
n = length(imf);
for i = 1 : n
     name = imf(i).name

     I = imread(strcat('images/tests/', name));
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
     display(Props.Perimeter);

end

