function [ tija ] = size_tija(BW)
     BWO = imopen(BW, strel('disk', 16));
     BWN = BW - BWO;
     BWN = biggest_region(BWN);
     Props = regionprops(BWN, 'Perimeter');
     tija = Props.Perimeter;
end
