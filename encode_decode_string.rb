# Design an algorithm to encode a list of strings to a string. 
# The encoded string is then sent over the network and is decoded back to the original list of strings.

# Please implement encode and decode
def encode(str)
  res = ""
  str.each do |s|
    res << s.length.to_s + "#" + s
  end
  res
end

def decode(str)
  res, i = [], 0

  # our string looks like "4#love3#you"
  while i < str.length
    j = i
    while str[j] != "#"
      j += 1
    end
    len = str[i..j-1].to_i
    res << str[j+1..j + 1 + len-1]
    i = j + 1 + len
  end
  
  return res
end