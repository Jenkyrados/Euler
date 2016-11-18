require './utils'
require '../Ruby/sqrttest'
height = 1500000
sq = isqrt(height)+1
seen = Array.new(height+1){0}
start = Time.now
# Farey enumerator. we only go to the square root
# because the m^2 assures us a nuke on perimeter otherwise
n = 0
m = 1
c = 1
d = sq
while c < sq
  k = ((sq+m).to_f/d).floor
  n,m,c,d = c,d,k*c-n,k*d-m
  if m%2 != 0 && n%2 != 0 then next end
  m2 = m**2
  p = m2*2 + 2*m*n
  if p > height then next end
  seen[p] += 1
  # add 1 to the multiples of the primitive -
  (2..Float::INFINITY).each do |x|
    if p*x > height then break end
    seen[p*x] +=1
  end
end

puts seen.select{|a| a == 1}.length
puts Time.now-start

# m1 != m2
# n1 != n2

# b1 = 2m1n1
# b2 = b1 = 2m2n2
# c1 = m1^2 + n1^2
# c2 = c1 = m2^2 + n1^2

# c1+b1 = c2+b2 => (m1+n1)^2 = (m2+n2)^2 => m1+n1 = m2+n2
# c1-b1 = c2-b2 => (m1-n1)^2 = (m2-n2)^2 => m1-n1 = m2-n2
# Hence m1 = m2 && n1 = n2. Contradiction. So the sequence effectively generates
# the triangles only once each
