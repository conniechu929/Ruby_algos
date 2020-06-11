# LINEAR SEARCH: is an inefficient (brute force) search because it will compare to the 
# item you are trying to find to every item in the array
def linear_search(array, key)
    if array.index(key).nil?
        return -1
    else
        return "#{key} at index #{array.index(key)}"
    end
end

# with out ruby helper methods
def raw_linear_search(array, key)
    i = 0
    while i < array.length
        if array[i] == key
            return "#{key} at index #{array.index(key)}"
        end
        i += 1
    end
    return -1
end

arr = [7, 6, 25, 19, 8, 14, 3, 16, 2, 0]
key = 3
p linear_search(arr, key)