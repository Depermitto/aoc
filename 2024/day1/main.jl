input = map(s -> parse(Int, s), split(readchomp("2024/day1/input.txt")))

list1 = input[1:2:end]
list2 = input[2:2:end]

# task 1
let l1 = sort(list1), l2 = sort(list2)
    totaldist = 0
    for (x, y) in zip(l1, l2)
        totaldist += abs(x - y)
    end
    println(totaldist)
end

# task 2
let l1 = list1, l2 = list2
    counter = Dict{Int,Int}()
    for y in l2
        if haskey(counter, y)
            counter[y] += 1
        else
            counter[y] = 1
        end
    end

    totalsim = sum(x -> get(counter, x, 0) * x, l1, init=0)
    println(totalsim)
end
