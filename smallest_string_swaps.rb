# You are given a string s, and an array of pairs of indices 
# in the string pairs where pairs[i] = [a, b] indicates 2 indices(0-indexed) of the string.

# You can swap the characters at any pair of indices in the given pairs any number of times.

# Return the lexicographically smallest string that s can be changed to after using the swaps.

# Example 1:

# Input: s = "dcab", pairs = [[0,3],[1,2]]
# Output: "bacd"
# Explaination: 
# Swap s[0] and s[3], s = "bcad"
# Swap s[1] and s[2], s = "bacd"

def smallest_string_with_swaps(s, pairs)
    @root = []

    for i in (0..s.length-1)
        @root[i] = i
    end

    for a, b in pairs do
        union(a, b)
    end

    hash = {}
    for i in (0..s.length-1)
        parent = find[i]
        if hash[parent]
            hash[parent] << s[i]
        else
            hash[parent] = [s[i]]
        end
    end

    # need to sort the values of the array within the hash
    hash.each do |key, value|
        hash[key] = value.sort {|a, b| b <=> a}
    end

    result = ''
    for i in (0..s.length-1)
        parent = @root[i]
        result << hash[parent].pop
    end

    result
end

def union(pair1, pair2)
    parent_1 = find(pair1)
    parent_2 = find(pair2)
    min = [parent_1, parent_2].min
    max = [parent_1, parent_2].max
    @root[max] = min
end

def find(p)
    while p != @root[p]
        @root[p] = @root[@root[p]]
        p = @root[p]
    end
    p
end