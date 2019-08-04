require_relative '../utilities/sqrttest'
require_relative '../utilities/utils'

=begin
y^2 - y - 2*(x^2 - x) = 0
delta = 1 + 8 (x ^ 2 - x)
y =  (1 + sqrt(delta)) / 2
=end


triangulars = []
found = false
while not found do
  t = @triangle_gen.next
  triangulars.push(t)
  if t%2 == 0 and triangulars.bsearch {|k| k >= t/2} == t/2
    y = isqrt(2*t)
    x = isqrt(t)
    p y
    p x
    p ""
    if y > 10**12
      found = true
    end
  end
end