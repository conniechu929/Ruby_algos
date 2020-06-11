def formingMagicSquare(s)
    pre = [
            [[8, 1, 6], [3, 5, 7], [4, 9, 2]],
            [[6, 1, 8], [7, 5, 3], [2, 9, 4]],
            [[4, 9, 2], [3, 5, 7], [8, 1, 6]],
            [[2, 9, 4], [7, 5, 3], [6, 1, 8]], 
            [[8, 3, 4], [1, 5, 9], [6, 7, 2]],
            [[4, 3, 8], [9, 5, 1], [2, 7, 6]], 
            [[6, 7, 2], [1, 5, 9], [8, 3, 4]], 
            [[2, 7, 6], [9, 5, 1], [4, 3, 8]],
            ]
    totals = []
    pre.each do |p|
        total = 0
        for p_row, s_row in p.zip(s)
            for i, j in p_row.zip(s_row)
                if i != j
                    total += [i, j].max - [i,j].min
                end
            end
        end
        totals << total
    end
    return totals.min
end
