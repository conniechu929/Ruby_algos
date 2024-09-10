def sum_partition(nums)
  # we are getting the minimum value of each pair
  # sorting the array of nums will ensure the minimum values are first
  sorted = nums.sort
  n = nums.length/2
  total = 0

  sorted.each_slice(2) do |i, j|
    total += sorted[i]
  end
  return total
end

#  Example usage:
#  const result: number = arrayPairSum([1, 3, 2, 4]);
#  console.log(result); // Output would be 4, because 1+3 (min of pair (1,2) + min of pair (3,4)) is the largest sum.
