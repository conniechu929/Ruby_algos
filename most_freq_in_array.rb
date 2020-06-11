# return the most freq item from the array

def most_frequent(array)
    array.each_with_object(Hash.new(0)) { |item, hash| hash[item] += 1 }.sort_by {|k, v| -v}.first
end

def most_frequent(array)
    max_count, max_item = -1, nil
    hash = {}
    array.each do |item|
        if !hash[item]
            hash[item] = 1
        else
            hash[item] += 1
        end
        if hash[item] > max_count
            max_count = hash[item]
            max_item = item
        end
    end
    return max_item
end