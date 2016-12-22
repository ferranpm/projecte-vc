function [ BW ] = binarize(I)
    BW = imfill(biggest_region(I(:,:,2) < 200), 'holes');
end
