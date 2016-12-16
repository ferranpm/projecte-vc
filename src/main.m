clear all; close all;

imf = dir('images/tests/*.tif');
n = length(imf);
for i = 1 : n
     name = imf(i).name;
     tipus = process(strcat('images/tests/', name));
     class = get_class(name);
     display({name, class, tipus});
end
