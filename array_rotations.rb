# check if the arrays are a rotation of each other
# assume there are no duplicates
def is_rotation(arr1, arr2)
    return false if arr1.length != arr2.length
    key, key_i = arr1[0], -1
    for i in (0..arr2.length - 1)
        if key == arr2[i]
            key_i = i
            break
        end
    end
    
    if key_i == -1
        return false
    end

    for i in (0..arr1.length - 1)
        j = (key_i + i) % arr1.length
        if arr1[i] != arr2[j]
            return false
        end
    end
    return true
end