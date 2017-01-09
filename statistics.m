for i = 1:15
    indexes = labels == i;
    gues = guesses(indexes);
    miss = sum((gues ~= i) & (gues ~= -1));
    hit = sum(gues == i);
    ignored = sum(gues == -1);
    display({i, hit, miss, ignored})
end

Thits = sum(guesses == labels);
Tmiss = sum((guesses ~= labels) & (guesses ~= -1));
display({Thits, Tmiss, sum(guesses == -1)})
