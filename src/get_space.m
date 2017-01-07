function [ n ] = space(BW)
    [f, c] = size(BW);
    n = (f*c)/sum(sum(BW));
end
