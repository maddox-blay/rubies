def bubble_sort(_array)
  swapped = false
  sorted = false
  until sorted
    swapped = false
    _array.each_with_index do |item, i|
      if _array[i + 1] && (item > _array[i + 1])
        _array[i], _array[i + 1] = _array[i + 1], _array[i]
        swapped = true
      end
    end
    unless swapped
      sorted = true
    end
  end
  return _array
end
