lines = [2]
(1..33).each do |a|
  lines.push(1,2*a,1)
end
lines = lines[0...99]
r = 1r
lines.reverse.each do |a|
  r = a + 1/r
end
puts r.numerator.to_s.chars.map{|a| a.to_i}.reduce(:+)