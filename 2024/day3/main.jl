input = readchomp("2024/day3/input.txt")

# task 1
let text = input
    re = r"mul\((?<num1>[0-9]+)\,(?<num2>[0-9]+)\)"
    matches = eachmatch(re, text)
    total = sum(matches) do m
        parse(Int, m[:num1]) * parse(Int, m[:num2])
    end
    println(total)
end

# task 2
let text = input
    mulenabled = true
    total = 0
    for i in eachindex(text)
        mul = 0
        try
            if text[i:i+3] == "do()"
                mulenabled = true
            elseif text[i:i+6] == "don't()"
                mulenabled = false
            elseif text[i:i+3] == "mul("
                isnumeric(text[i+4]) || continue
                j = i + 5
                while isnumeric(text[j])
                    j += 1
                end
                if mulenabled
                    mul = parse(Int, text[i+4:j-1])
                end

                text[j] == ',' || continue

                isnumeric(text[j+1]) || continue
                k = j + 2
                while isnumeric(text[k])
                    k += 1
                end
                if mulenabled
                    mul *= parse(Int, text[j+1:k-1])
                end

                text[k] == ')' || continue
                total += mul
            end
        catch e
            break
        end
    end
    println(total)
end