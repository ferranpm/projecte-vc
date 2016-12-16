function [ ratio ] = get_aspect_ratio(BW)
    Props = regionprops(BW, 'MajorAxisLength', 'MinorAxisLength');
    ratio = Props.MajorAxisLength/Props.MinorAxisLength;
end
