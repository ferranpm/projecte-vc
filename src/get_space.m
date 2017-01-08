function [ n ] = get_space(BW)
    BWN = imresize(BW, [200 200], 'nearest');
    n = sum(sum(BWN));
end
