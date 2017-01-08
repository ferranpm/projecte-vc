function [ tipus ] = process(filename, predictor_1_3_9, predictor_8_12_13)
    I = imread(filename);
    BW = binarize(I);

    if get_aspect_ratio(BW) > 4
        tipus = 7;
        return;
    end

    if get_punxes(BW) >= 10
        tipus = 2;
        return;
    end

    if get_convex(BW) <= 5
        tipus = 10;
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
        % tipus = '1-3-9';
        props = regionprops(BW, 'Extent', 'Eccentricity', 'Solidity');
        Y = predict(predictor_1_3_9, cell2mat(struct2cell(props))');
        tipus = str2num(Y{1});
        return;
    end

    tipus = -1;
end
