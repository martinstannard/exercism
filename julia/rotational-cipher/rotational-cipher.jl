function rotate(distance, input)
   map(c -> rotter(distance, c), input)
end

function rotter(distance, char)
    if char < 'A' || char > 'Z'
        char
    else
        println("$char")
        char + distance
    end
end
