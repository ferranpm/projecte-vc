function [ n ] = compacity(BW)
    Props = regionprops(BW, 'Area', 'Perimeter');
    n = (Props.Perimeter*Props.Perimeter)/Props.Area;
end
