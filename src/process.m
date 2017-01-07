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

    comp = compacity(BW);
    if comp > 50
        tipus = 14;
        return;
    elseif comp < 25
        tipus = 15;
        return;
    end

    if get_space(BW) > 3.4
        tipus = 5;
        return;
    end

    if tija == 0
        tipus = '1,3,9';
        return;
    end

    tipus = -1;
end
