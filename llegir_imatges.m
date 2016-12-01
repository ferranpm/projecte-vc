clear all; close all;

imf = dir('images/tests/*.tif');
n = length(imf);
Ps = repmat(struct('compacity', 0, 'npunxes', 0, 'area', 0), n, 1);
Classes = cell(1, n);
for i = 1 : n
     name = imf(i).name
     Ps(i) = processar(strcat('images/tests/', name))';
     Classes{i} = get_class(name);
end

Props = cell2mat(struct2cell(Ps))';

display(Props);
display(Classes)

f = TreeBagger(100, Props, Classes);

X = processar('images/l8nr037.tif');

[labels, scores] = predict(f, cell2mat(struct2cell(X))');

f.ClassNames'
table(scores)
