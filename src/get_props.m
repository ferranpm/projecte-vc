function [ props ] = get_props(I)
    BW = binarize(I);
    space = get_space(BW);
    aspect = get_aspect_ratio(BW);
    tija = size_tija(BW);
    p = regionprops(BW, 'Extent', 'Solidity');
    props = [ tija; aspect; space; p.Extent; p.Solidity ];
end
