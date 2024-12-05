begin
    input = split(readchomp("day5/input.txt"), keepempty=true)
    point_of_disagreement = findfirst(isempty, input)

    rules = split.(input[1:point_of_disagreement-1], '|')
    updates = split.(input[point_of_disagreement+1:end], ',')
end

function isupdategood(update::Vector{T}, rules::Vector{Vector{T}}) where {T<:AbstractString}
    for i in eachindex(update), j in i+1:length(update)
        any(r -> r[1] == update[i] && r[2] == update[j], rules) || return false
    end
    true
end

# task 1
begin
    total = 0
    for update in updates
        if isupdategood(update, rules)
            total += parse(Int, update[ceil(Int, length(update) / 2)])
        end
    end
    println(total)
end

# task 2
let updates = copy.(updates)
    total = 0
    for update in updates
        if !isupdategood(update, rules)
            for i in eachindex(update), j in i+1:length(update)
                if any(r -> r[1] == update[j] && r[2] == update[i], rules)
                    update[i], update[j] = update[j], update[i]
                end
            end

            if isupdategood(update, rules)
                total += parse(Int, update[ceil(Int, length(update) / 2)])
            end
        end
    end
    println(total)
end