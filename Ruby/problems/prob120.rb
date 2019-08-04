res = 0
(3..1000).each do |n|
  res += n*n-n
  if n%2 == 0 
    res -= n
  end
end
puts res
