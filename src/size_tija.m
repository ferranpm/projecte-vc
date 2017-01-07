function [ tija ] = size_tija(BW)
     BWO = imopen(BW, strel('disk', 16));
     BWN = BW - BWO;
     BWN = biggest_region(BWN);
     [f, c] = size(BW);
     BWN(1:(f/2), 1:c) = 0;
     Props = regionprops(BWN, 'Perimeter');
     [x, y] = size(Props);
     if x == 0
         tija = 0;
     else
         tija = Props.Perimeter;
     end
end
