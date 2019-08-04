class String
  def palindrome?
    self == self.reverse
  end
  def to_unordered_hash
    @first_36_primes ||= [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97,101,103,107,109,113,127,131,137,139,149,151]
    res = 1
    self.downcase.split('').each do |x|
          res *= @first_36_primes[x.ord - "a".ord]
    end
    res
  end
end