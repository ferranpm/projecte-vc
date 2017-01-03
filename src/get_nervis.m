function [ n ] = get_nervis(G)
    [~, threshold] = edge(G, 'canny');
    BWs = edge(G, 'canny', threshold * 4.5);
    se90 = strel('line', 5, 150);
    se0 = strel('line', 3, 0);
    BW = imdilate(BWs, [se90 se0]);
    % TODO: Buscar una manera de calcular el num de nervis
    n = sum(sum(bwmorph(BW, 'branchpoints')));
end
