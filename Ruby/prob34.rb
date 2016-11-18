require './utils'
puts 9.fact * 6 # shows that at max, 7 digit numbers are possible (after that, the factorial of their digits is under their digits)
puts ((3..2540160).inject [] do |memo, a|
  if a.to_s.split(//).map { |s| s.to_i.fact }.reduce(:+) == a then
    puts a; memo.push(a)
  end; memo
end.compact.reduce(:+))