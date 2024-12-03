input = readchomp("2024/day3/input.txt")

# task 1
let text = input
    re = r"mul\((?<num1>[0-9]+)\,(?<num2>[0-9]+)\)"
    total = sum(eachmatch(re, input)) do m
        parse(Int, m[:num1]) * parse(Int, m[:num2])
    end
    println(total)
end

# task 2
let text = input
    re = r"(mul\((?<num1>[0-9]+)\,(?<num2>[0-9]+)\)|don't|do)"
    mulenabled = true
    total = 0
    for m in eachmatch(re, text)
        if m.match == "don't"
            mulenabled = false
        elseif m.match == "do"
            mulenabled = true
        elseif mulenabled
            total += parse(Int, m[:num1]) * parse(Int, m[:num2])
        end
    end
    println(total)
end