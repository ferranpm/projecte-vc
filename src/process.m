function [ tipus ] = process(filename)
    I = imread(filename);
    BW = binarize(I);

    if get_punxes(BW) > 14
        tipus = 2;
        return;
    end

    if get_aspect_ratio(BW) > 4
        tipus = 7;
        return;
    end

    if get_convex(BW) > 1000000
        tipus = 10;
        return;
    end

    tija = size_tija(BW);
    if tija > 800 && tija < 2000
        tipus = '8, 12, 13';
        return;
    end

    tipus = -1;
end
