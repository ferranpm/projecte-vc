clear all; close all;

img_dir = 'images/entrenament/30/';
imf = dir(strcat(img_dir, '*.tif'));
n = length(imf);

props_1_3_9 = [];
props_8_12_13 = [];

Y_1_3_9 = [];
Y_8_12_13 = [];

for i = 1 : n
     name = imf(i).name;
     class = str2num(get_class(name));
     filename = strcat(img_dir, name);
     I = imread(filename);
     BW = binarize(I);
     if class == 1 || class == 3 || class == 9
         props = regionprops(BW, 'Extent', 'Eccentricity', 'Solidity');
         props_1_3_9 = [ props_1_3_9 cell2mat(struct2cell(props)) ];
         Y_1_3_9 = [ Y_1_3_9 class ];
     elseif class == 8 || class == 12 || class == 13
         props = regionprops(BW, 'Extent', 'Eccentricity', 'Solidity');
         props_8_12_13 = [ props_8_12_13 cell2mat(struct2cell(props)) ];
         Y_8_12_13 = [ Y_8_12_13 class ];
     end
end

predictor_1_3_9 = TreeBagger(100, props_1_3_9', Y_1_3_9);
predictor_8_12_13 = TreeBagger(100, props_8_12_13', Y_8_12_13);
