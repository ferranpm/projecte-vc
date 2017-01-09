function [n] = part_inferior(BW)
    [f, c] = size(BW);
    BWN = BW(floor(f/2):end,:);
    n = sum(sum(BWN));
end
