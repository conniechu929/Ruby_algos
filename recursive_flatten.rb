def flatten(array, result = [])
  array.each do |element|
    if element.class == Array
      flatten(element, result)
    else
      result << element
    end
  end
  result
end