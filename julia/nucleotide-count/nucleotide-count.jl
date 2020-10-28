"""
    count_nucleotides(strand)

The frequency of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    counts = Dict('A' => 0, 'C' => 0, 'G' => 0, 'T' => 0)

    for (index, value) in enumerate(strand)
        inc_count(value, counts)
    end
    counts
end

function inc_count(nuc, counts)
    if nuc == 'A'
        counts['A'] += 1
    elseif nuc == 'C'
        counts['C'] += 1
    elseif nuc == 'G'
        counts['G'] += 1
    elseif nuc == 'T'
        counts['T'] += 1
    else
        throw(DomainError(nuc, "Invalid base found."))
    end
end
