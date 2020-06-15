# Given a string, sort it in decreasing order based on the frequency of characters.

# Example 1:

# Input:
# "tree"

# Output:
# "eert"

# Explanation:
# 'e' appears twice while 'r' and 't' both appear once.
# So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.

# @param {String} s
# @return {String}
def frequency_sort(s)
    hash = {}
    str = s.split('')
    
    str.each do |c|
        if hash[c]
            hash[c] += 1
        else
            hash[c] = 1
        end
    end
    
    h = hash.sort_by{|key, val| -val}
    res = []
    h.each do |key, v|
        res << "#{key}" * v
    end
    return res.join
end