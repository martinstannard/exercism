function score(x, y)
    distance = sqrt((x*x) + (y*y))
    if distance <= 1
        10
    elseif distance <= 5
        5
    elseif distance <= 10
        1
    else
        0
    end
end
