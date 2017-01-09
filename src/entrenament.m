clear all; close all;

img_dir = 'images/entrenament/30/';
imf = dir(strcat(img_dir, '*.tif'));
n = length(imf);

props = [];

labels = [];

classes = [ 1 3 4 5 6 8 9 11 12 13 ];

for i = 1 : n
     name = imf(i).name;
     class = str2num(get_class(name));
     C = classes == class;
     if sum(C) ~= 0
         filename = strcat(img_dir, name);
         display({name});
         I = imread(filename);
         props = [ props get_props(I) ];
         labels = [ labels class ];
     end
end

save('props.mat', 'props');
save('labels.mat', 'labels');
