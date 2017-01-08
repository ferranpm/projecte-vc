function [ n ] = get_convex(BW)
    X = bwconvhull(BW) - BW;
    C = regionprops(X, 'Area');
    [f, c] = size(BW);
    n = (f*c)/C.Area;
end
