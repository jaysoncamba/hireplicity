class SortedArray < Array

  # Assumed that the array is already sorted.

  # the idea here is to convert the array to hash and use index of the element as keys
  # then get the key using value to get the index.
  # using this route this would be faster if the collection is bigger and the number to search is large as well
  # e.g array = (0..9000) and the number inputted is 8700
  def contains?(number)
    # return !!(self & [number]).first
    return false unless number.is_a? Numeric
    !!hash_value.key(number)
  end
  
  private
  # Memoized hash_value so we dont repeat initialization of the hash
  # This would not be updated whenever we add or remove elements on the array
  def hash_value
    @hash_value ||= Hash[(0...self.size).zip(self)]
  end
end