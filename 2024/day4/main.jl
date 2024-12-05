input = split(readchomp("day4/input.txt"))

# task 1
let text = input
    total = 0
    rows = length(text)
    cols = length(text[1])

    for r in eachindex(text)
        for c in eachindex(text[r])
            text[r][c] == 'X' || continue

            total += (c + 3 <= cols && text[r][c:c+3] == "XMAS") +
                     (c - 3 >= 1 && text[r][c-3:c] == "SAMX") +
                     (r + 3 <= rows && text[r+1][c] == 'M' && text[r+2][c] == 'A' && text[r+3][c] == 'S') +
                     (r - 3 >= 1 && text[r-1][c] == 'M' && text[r-2][c] == 'A' && text[r-3][c] == 'S') +
                     (r + 3 <= rows && c + 3 <= cols && text[r+1][c+1] == 'M' && text[r+2][c+2] == 'A' && text[r+3][c+3] == 'S') +
                     (r + 3 <= rows && c - 3 >= 1 && text[r+1][c-1] == 'M' && text[r+2][c-2] == 'A' && text[r+3][c-3] == 'S') +
                     (r - 3 >= 1 && c + 3 <= cols && text[r-1][c+1] == 'M' && text[r-2][c+2] == 'A' && text[r-3][c+3] == 'S') +
                     (r - 3 >= 1 && c - 3 >= 1 && text[r-1][c-1] == 'M' && text[r-2][c-2] == 'A' && text[r-3][c-3] == 'S')
        end
    end
    println(total)
end


# task 2
let text = input
    total = 0
    rows = length(text)
    cols = length(text[1])

    for r in eachindex(text)
        for c in eachindex(text[r])
            text[r][c] == 'A' || continue

            total += (r + 1 <= rows && c + 1 <= cols && r - 1 >= 1 && c - 1 >= 1 &&
                      ((text[r+1][c+1] == 'M' && text[r-1][c-1] == 'S') || (text[r+1][c+1] == 'S' && text[r-1][c-1] == 'M')) &&
                      ((text[r-1][c+1] == 'S' && text[r+1][c-1] == 'M') || (text[r-1][c+1] == 'M' && text[r+1][c-1] == 'S')))
        end
    end
    println(total)
end