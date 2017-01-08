function [ n ] = get_convex(BW)
    X = bwconvhull(BW) - BW;
    n = sum(sum(imresize(X, [256 256], 'nearest')));
end
