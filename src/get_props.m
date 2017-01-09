function [ props ] = get_props(I)
    BW = binarize(I);
    space = get_space(BW);
    aspect = get_aspect_ratio(BW);
    inferior = part_inferior(BW);
    p = regionprops(BW, 'Extent', 'Solidity');
    props = [ inferior; aspect; space; p.Extent; p.Solidity ];
end
