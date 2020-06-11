# find the most common element between two sorted arrays
def common_elements(arr1, arr2)
    result = []
    hash1 = arr1.each_with_object(Hash.new(0)) {|item, hash| hash[item] += 1}
    hash2 = arr2.each_with_object(Hash.new(0)) {|item, hash| hash[item] += 1}
    hash1.each do |k, v|
        if hash2.has_key?(k)
            result << k
        end
    end
    result
end

def common_elements(arr1, arr2)
    result = []
    i, j = 0, 0

    while i < arr1.length and j < arr2.length do
        if arr1[i] == arr2[j]
            result << arr1[i]
            i+=1
            j+=1
        elsif arr1[i] < arr2[j]
            i += 1
        else
            j+= 1 
        end
    end
    result
end