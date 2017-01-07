clear all; close all;

img_dir = 'images/';
imf = dir(strcat(img_dir, '*.tif'));
n = length(imf);

m = matfile('predictor_1_3_9');
predictor_1_3_9 = m.predictor_1_3_9;

m = matfile('predictor_8_12_13');
predictor_8_12_13 = m.predictor_8_12_13;

for i = 1 : n
     name = imf(i).name;
     tipus = process(strcat(img_dir, name), predictor_1_3_9, predictor_8_12_13);
     class = str2num(get_class(name));
     display({name, class, tipus});
end
