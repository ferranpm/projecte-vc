img_dir = 'images/';
imf = dir(strcat(img_dir, 'l*nr03*.tif'));
n = length(imf);

m = matfile('props');
props = m.props;

m = matfile('labels');
labels = m.labels;

predictor = TreeBagger(150, props', labels);

items = cell(n, 3);
for i = 1 : n
     name = imf(i).name;
     tipus = process(strcat(img_dir, name), predictor);
     class = str2num(get_class(name));
     items{i,1} = name;
     items{i,2} = class;
     items{i,3} = tipus;
     display({name, class, tipus});
end

labels = [ items{:, 2} ];
guesses = [ items{:, 3} ];
unknown = sum(guesses == -1);
hits = sum(guesses == labels);
display({n, hits, unknown});
