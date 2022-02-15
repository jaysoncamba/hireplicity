class SortedArray < Array

  # Assumed that the array is already sorted.

  def contains?(number)
    return false unless number.is_a? Numeric
    return !!(self & [number]).first
  end
end