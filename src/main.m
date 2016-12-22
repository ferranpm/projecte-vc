clear all; close all;

img_dir = 'images/tests/';
imf = dir(strcat(img_dir, '*.tif'));
n = length(imf);
for i = 1 : n
     name = imf(i).name;
     tipus = process(strcat(img_dir, name));
     class = get_class(name);
     display({name, class, tipus});
end
