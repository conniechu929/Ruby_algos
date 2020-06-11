def permute(result,input)
    if(input.length == 0)
        return
    end

    if(input.length == 1)
        puts result + input[0]
        return
    end

    if(input.length == 2)
        puts result + input[0] + input[1]
        puts result + input[1] + input[0]
        return
    end

    (0...input.length).step(1).each do |i|
        firstpart = result+input[i]
        secondpart = (i > 0 ? input[0..(i-1)] : '') + (input[(i+1)..-1] || '')
        permute(firstpart,secondpart)
    end
end

permute('',gets.chomp)

# for arr
%w[a b c].permutation.map &:join

# for strings
"abc".chars.permutation.map &:join

# RECURSIVELY:
def permutation(string)
    return [string] if string.size < 2
    ch = string[0]
    permutation(string[1..-1]).each_with_object([]) do |perm, result|
        (0..perm.size).each { |i| result << perm.dup.insert(i,ch) }
    end
end