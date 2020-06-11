def binary_search(n, arr)
  middle = arr.length / 2
  i = 0
  j = arr.length - 1

  while i < j
    if arr[middle] == n
      return true
    elsif arr[middle] < n
      i = middle + 1
      middle = i + j / 2
    else
      j = middle - 1
      middle = i + j / 2
    end
  end
  false
end 

def binary_search(array, key)
  low, high = 0, array.length - 1
  while low <= high
    mid = (low + high) >> 1
    case key <=> array[mid]
      when 1
        low = mid + 1
      when -1
        high = mid - 1
      else
        return mid
    end
  end
end


arr = [1,3,4,12,16,21,34,45,55,76,99,101]
key = 3
p binary_search(arr, key)
