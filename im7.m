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

     Props = regionprops(BW, 'MajorAxisLength', 'MinorAxisLength');
     display(Props.MajorAxisLength/Props.MinorAxisLength);

end
