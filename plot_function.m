clear all; close all;

base_path = './images/tests/';
imf = dir(strcat(base_path, '/*.tif'));
n = length(imf);

X = [];
Y = [];

for i = 1 : n
     name = imf(i).name;
     I = imread(strcat(base_path, name));
     BW = binarize(I);

     cla = str2num(get_class(name));
     res = get_punxes(BW);
     X = [X cla];
     Y = [Y res];
     display({name, cla, res});
end

scatter(X, Y);
set(gca, 'XTick', 0:15);
grid on;
