function [n] = part_inferior(BW)
    [f, c] = size(BW);
    BWN = BW(floor(f/2):end,:);
    BWN = imresize(BWN, [ 300 300 ], 'nearest');
    n = sum(sum(BWN));
end
