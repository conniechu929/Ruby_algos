# Complete the missingNumbers function below.
def missingNumbers(arr, brr)
    n_hash = arr.each_with_object(Hash.new(0)){|item, hash| hash[item] +=1 }
    m_hash = brr.each_with_object(Hash.new(0)){|item, hash| hash[item] +=1 }
    result = []

    m_hash.each do |key, val|
        if !n_hash[key] || n_hash[key] / val != 1 
            result << key
        end
    end
    result.sort
end