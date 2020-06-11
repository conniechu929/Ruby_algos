# Given two strings s1 and s2, write a function to return true if s2 contains the permutation of s1.
# In other words, one of the first string's permutations is the substring of the second string.

# Example 1:

# Input: s1 = "ab" s2 = "eidbaooo"
# Output: True
# Explanation: s2 contains one permutation of s1 ("ba").
# Example 2:

# Input:s1= "ab" s2 = "eidboaoo"
# Output: False

# @param {String} s1
# @param {String} s2
# @return {Boolean}
def check_inclusion(s1, s2)
    return true if s1.empty?
    return false if s2.empty?
    
    state = Array.new((?a..?z).to_a.length,0)
    template = Array.new((?a..?z).to_a.length, 0)
    a = s2.chars
    
#   fill template with with s1
    s1.chars.each do |ch|
        template[ch.ord - ?a.ord] += 1
    end
    
#   set state for first interval
    i, j = 0, 0
    state[a[0].ord - ?a.ord] += 1

#   check if interval meets the criteria
    criteria_check = ->(){state.each_with_index.all?{|v, i| v <= template[i]}}
    
#   return true check
    check_true = ->(){state == template}
    
    while i < a.size and j < a.size
        if criteria_check.()
            return true if check_true.()
            j += 1
            state[a[j].ord - ?a.ord] += 1 if j < a.size
        elsif i == j
            j+=1
            state[a[j].ord - ?a.ord] += 1 if j < a.size
            state[a[i].ord - ?a.ord] -= 1
            i += 1
        else
            state[a[i].ord - ?a.ord] -= 1
            i += 1
        end
    end
    false
end