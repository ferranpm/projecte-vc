img_dir = 'images/';
imf = dir(strcat(img_dir, '*.tif'));
n = length(imf);

m = matfile('props');
props = m.props;

m = matfile('labels');
labels = m.Y;

predictor = TreeBagger(150, props', labels);


failed = 0;
unknown = 0;
for i = 1 : n
     name = imf(i).name;
     tipus = process(strcat(img_dir, name), predictor);
     class = str2num(get_class(name));
     if tipus ~= class && tipus ~= -1
         failed = failed + 1;
     elseif tipus == -1
         unknown = unknown + 1;
     end
     display({name, class, tipus});
end

display({n, failed, unknown});
