function [ tipus ] = process(filename, predictor)
    I = imread(filename);
    BW = binarize(I);

    aspect = get_aspect_ratio(BW);
    if aspect > 4
        tipus = 7;
        return;
    end

    punxes = get_punxes(BW);
    if punxes >= 6
        tipus = 2;
        return;
    end

    comp = compacity(BW);
    if comp > 200
        tipus = 10;
        return;
    end

    if comp > 50
        tipus = 14;
        return;
    elseif comp < 25 && convex
        tipus = 15;
        return;
    end

    props = get_props(I)';
    [Y scores] = predict(predictor, props);
    if max(scores) >= 0.5
        if iscell(Y)
            Y = Y{1};
        end
        if isstr(Y)
            tipus = str2num(Y);
        else
            tipus = Y;
        end
        return;
    end

    tipus = -1;
end
