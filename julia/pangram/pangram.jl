"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    counts = zeros(26)
    for (index, value) in enumerate(lowercase(input))
        i = 'z' - value
        if i >= 0 && i < 26 && counts[i+1] == 0.0
            counts[i+1] = 1
        end
    end
    sum(counts) == 26
end
