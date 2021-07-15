"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    counts = zeros(Bool,26)
    for (index, value) in enumerate(input)
        i = 'z' - lowercase(value)
        if i >= 0 && i < 26
            counts[i+1] = true
        end
    end
    sum(counts) == 26
end
