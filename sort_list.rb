# insertion sort
def insertion_sort_list(unsorted_list)
  i = 1
  while i < unsorted_list.length
    current = i
    while current > 0 && unsorted_list[current] < unsorted_list[current-1]
      unsorted_list[current], unsorted_list[current-1] = unsorted_list[current-1], unsorted_list[current]
      current -= 1
    end
    i += 1
  end
  return unsorted_list
end

# selection sort
def selection_sort_list(unsortedList)
  n = unsortedList.length
  i = 0
  while i < n
    minIndex = i
    j = i
    while j < n
      if unsortedList[j] < unsortedList[minIndex]
        minIndex = j
      end
      j += 1
    end
    unsortedList[minIdex], unsortedList[i] = unsortedList[i], unsortedLis[minIndex]
    i += 1
  end
end

# bubble sort
def bubble_sort_list(unsortedList)
  n = unsortedList.length
  i = n-1
  while i >= 0
    swapped = false
    j = 0
    while j < i
      if unsortedList[j] > unsortedList[j+1]
        unsortedList[j], unsortedList[j+1] = unsortedList[j+1], unsortedList[j]
        swapped = true
      end
      j += 1
    end
    if !swapped
      return unsortedList
    end
    i -= 1
  end

  reutn unsortedList
end

# merge sort
def merge_sort(unsortedList)
  n = unsortedList.length

  if n <= 1 
    return unsortedList
  end

  mid = n/2
  leftList = merge_sort(unsortedList[0..mid])
  rightList = merge_sort(unsortedList[mid+1..n-1])

  resultList = []
  leftPointer, rightPointer = 0, 0

  while leftPointer < mid || rightPointer > n-mid do
    if leftPointer == mid 
      resultList << rightList[rightPointer]
      rightPointer += 1
    elsif rightPointer == n-mid
      resultList << leftList[leftPointer]
      leftPointer += 1
    elsif leftList[leftPointer] <= rightList[rightPointer]
      resultList << leftList[leftPointer]
      leftPointer += 1
    else
      resultList << rightList[rightPointer]
      rightPointer += 1
    end
  end
  return resultList
end

# quick sort
def sortListInterval(unsortedList, start, end)
  if end - start <= 1
    return
  end
  # using last element as the pivot
  pivot = unsortedList[end-1]
  startPtr, endPtr = start, end-1

  # Partitioning process
  while startPtr < endPtr do
    # find the next element from the left that is larger than the pivot
    while unsortedList[startPtr] < pivot && startPtr < endPtr do
      startPtr += 1
    end

    # find the next element from the right that is smaller than or equal to the pivot
    while unsortedList[endPtr] >= pivot && startPtr < endPtr do
      endPtr -= 1
    end

    # swap if pointers haven't met
    unsortedList[startPtr], unsortedList[endPtr] = unsortedList[endPtr], unsortedList[startPtr]
  end

  # place pivot in its final position
  unsortedList[startPtr], unsortedList[end-1] = unsortedList[end-1], unsortedList[startPtr]

  # sort left and right of the pivot
  sortListInterval(unsortedList, start, startPtr)
  sortListInterval(unsortedList, startPtr+1, end)

end

def quick_sort(unsortedList)
  sortListInterval(unsortedList, 0, unsortedList.length)
  return unsortedList
end