require './utils'
start = Time.now
vals = Hash.new(0)
sum = 0
(2..999999).each do |n|
  if vals[n] != 0 then next end
  res = [n]
  x = n.to_s.chars.map{|e| e.to_i.fact()}.reduce(:+)
  while vals[x] == 0 && !res.include?(x)
    res.push(x)
    x = x.to_s.chars.map{|e| e.to_i.fact()}.reduce(:+)
  end
  len = res.length + vals[x]
  i = 0
  ind = vals[x] == 0 ? res.find_index(x) : res.length
  while i < res.length && vals[res[i]] == 0
    vals[res[i]] = len
    if res[i] < 1000000 && len == 60 then sum += 1 end
    if i < ind then len -=1 end
    i += 1
  end
end

puts sum
puts Time.now - start