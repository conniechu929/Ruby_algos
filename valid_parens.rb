def valid_parens(p)
  stack = []

  p.each_char do |c|
    if c == "(" || c == "{" || c == "["
      stack << c
    else
      if c == ")" && stack.last == "("
        stack.pop
      elsif c == "}" && stack.last == "{"
        stack.pop
      elsif c == "]" && stack.last == "["
        stack.pop
      else
        return false
      end 
    end
  end
  return stack.empty?
end