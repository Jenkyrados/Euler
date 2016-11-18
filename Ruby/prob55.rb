require './utils'
count = 0
(10..9999).each do |n|
  n = n+ n.to_s.reverse.to_i
  iter = 1
  res = true
  while iter < 50 do
    if n.to_s.palindrome? then res = false;break end
    iter += 1
    n = n+n.to_s.reverse.to_i
  end
  if res then count +=1 end
end
puts count