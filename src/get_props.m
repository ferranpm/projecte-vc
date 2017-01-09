

function [ props ] = get_props(I)
    BW = binarize(I);
    aspect = get_aspect_ratio(BW);
    inferior = part_inferior(BW);
    convex = get_convex(BW);
    p = regionprops(BW, 'Extent', 'Solidity');
    props = [ inferior; convex; aspect; p.Extent; p.Solidity ];
end
