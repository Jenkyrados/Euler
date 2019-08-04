require '../utilities/sqrttest'
require 'bigdecimal'
sum = 0
(2..100).each do |s|
  if s.issquare? then next end
  two = BigDecimal.new(2,1000)
  sbig = BigDecimal.new(s,1000)
  x = BigDecimal.new(4*(10**(s.to_s.length/2)),1000)
  tmp = BigDecimal.new(0,1000)
  while x.round(100) != tmp.round(100)
    x,tmp = (x + sbig / x) / two,x
  end

  sum += x.truncate(99).to_s('F').chars.map{|a| a.to_i}.reduce(:+)
end

puts sum