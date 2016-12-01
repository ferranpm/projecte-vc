function [x] = get_class(name)
    match = regexp(name, '\d+', 'match');
    x = match{1};
end
