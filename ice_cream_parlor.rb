# Input: arr = [1,2,5,6,4,9], m = 5
# return index as i + 1
# output: 1 5
# NO DUPLICATES, and NO SORTING INDICES


# Complete the icecreamParlor function below.
def icecreamParlor(m, arr)
    result = []
    arr.each_with_index do |value, index|
        for i in (index+1..arr.length - 1)
            if value + arr[i] == m
                result << [index+1, i+1]
            end
        end
    end
    result.flatten().map(&:to_i)
end