function [ n ] = get_convex(BW)
    X = bwconvhull(BW) - BW;
    C = regionprops(X, 'Area');
    n = C.Area;
end
