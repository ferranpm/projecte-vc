clear all; close all;

img_dir = 'images/entrenament/30/';
imf = dir(strcat(img_dir, '*.tif'));
n = length(imf);

props = [];

Y = [];

for i = 1 : n
     name = imf(i).name;
     class = str2num(get_class(name));
     filename = strcat(img_dir, name);
     I = imread(filename);
     BW = binarize(I);
     if class == 1 || class == 3 || class == 5 || class == 6 || class == 8 || class == 9 || class == 11 || class == 12 || class == 13
         props = [ props get_props(I) ];
         Y = [ Y class ];
     end
end
