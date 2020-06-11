# Input:
# 20 => n
# Input is an array containing subarrays [['0', 'ab'],['6', 'cd'],['0', 'ef'],['6', 'gf']...]
# Array :
# 0 ab
# 6 cd
# 0 ef
# 6 gh
# 4 ij
# 0 ab
# 6 cd
# 0 ef
# 6 gh
# 0 ij
# 4 that
# 3 be
# 0 to
# 1 be
# 5 question
# 1 or
# 2 not
# 4 is
# 2 to{-truncated-}

# Complete the countSort function below.
def countSort(arr)
    count = Array.new(arr.length) { [] } # this creates an array and different arrays in it
    half = (arr.length/2) - 1
    puts count

    for i in 0..arr.length - 1
        index = arr[i][0].to_i
        if count[index].class != String
            count[index] << ''
        end
        if i <= half
            count[index] << '- '
        else
            count[index] << arr[i][1] + ' '
        end
    end

    result = []
    for i in 0..count.length - 1
        if !count[i].nil?
            result << count[i]
        end
    end
    
    puts result.join('')
end