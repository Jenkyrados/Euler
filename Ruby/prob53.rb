count = 0
(23..100).each do |n|
  val = n
  (2..n).each do |i|
    val *= n-i+1
    val /= i
    if val > 1000000 then count+=1 end
  end
end
puts count