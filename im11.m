clear all; close all;

imf = dir('images/tests/l11*.tif');
n = length(imf);
for i = 1 : n
     name = imf(i).name

     I = imread(strcat('images/tests/', name));
     I = rgb2gray(I);

     % h = fspecial('average');
     % I = imfilter(I, h);

     h = fspecial('sobel');
     If = imfilter(I, h);

     If = imdilate(If, strel('disk', 2));

    % If = watershed(If);
     figure; imshow(If, []);

     % % Agafem el tros més gran de la imatge
     % CC = bwconncomp(BW);
     % npixels = cellfun(@numel, CC.PixelIdxList);
     % [v, i] = max(npixels);
     % BW(:,:) = 0;
     % BW(CC.PixelIdxList{i}) = 1;

     % Props = regionprops(BW, 'MajorAxisLength', 'MinorAxisLength');
     % display(Props.MajorAxisLength/Props.MinorAxisLength);

end
