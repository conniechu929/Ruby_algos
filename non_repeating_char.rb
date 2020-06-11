# return the character from the string that is not repeated
def non_repeating(str)
    arr = str.split('')
    char_hash = arr.each_with_object(Hash.new(0)) {|item, hash| hash[item] += 1}
    arr.each do |char|
        if char_hash[char] == 1
            return char
        end
    end
    return null
end
