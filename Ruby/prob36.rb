require './utils'
puts ((1..1000000).select{|a| a.to_s.palindrome? && a.to_s(2).palindrome?}.reduce(:+))