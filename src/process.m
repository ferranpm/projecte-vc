function [ tipus ] = process(filename)
    I = imread(filename);
    BW = binarize(I);

    if get_punxes(BW) > 10
        tipus = 2;
        return;
    end

    if get_aspect_ratio(BW) > 4
        tipus = 7;
        return;
    end

    % TODO: mirar convexitat per al tipus 10

    tija = size_tija(BW);
    if tija > 800 && tija < 2000
        tipus = '8, 12, 13';
        return;
    end

    tipus = -1;
end
