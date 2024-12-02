input = map(v -> parse.(Int, v), split.(split(readchomp("2024/day2/input.txt"), '\n'), ' '))

# task 1
let reports = input
    safe = 0
    for report in reports
        levelzip = zip(report[1:end-1], report[2:end])
        decreasing = all([(l1 < l2) for (l1, l2) in levelzip])
        increasing = all([(l1 > l2) for (l1, l2) in levelzip])
        differing = all([(1 <= abs(l1 - l2) <= 3) for (l1, l2) in levelzip])

        if (decreasing || increasing) && differing
            safe += 1
        end
    end
    println(safe)
end

# task 2
let reports = input
    safe = 0
    for report in reports
        for i in 0:length(report)
            levelzip = if i == 0
                zip(report[1:end-1], report[2:end])
            else
                r = deleteat!(copy(report), i)
                zip(r[1:end-1], r[2:end])
            end

            decreasing = all([(l1 < l2) for (l1, l2) in levelzip])
            increasing = all([(l1 > l2) for (l1, l2) in levelzip])
            differing = all([(1 <= abs(l1 - l2) <= 3) for (l1, l2) in levelzip])

            if (decreasing || increasing) && differing
                safe += 1
                break
            end
        end
    end
    println(safe)
end