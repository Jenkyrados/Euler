primes = [2,3,5,7,11,13,17]

reses = []
primes.each do |a|
  res = [a]
  while res[res.length-1] < 987
    res.push(res.length*a+a)
  end
  puts res.inspect, a
  reses.push(res)
end
reses[0].select!{|a| a >100}
reses.each{|t| t.select!{|a| a > 10 && a.to_s.split(//).uniq.length == a.to_s.split(//).length}}
reses.each{|t| puts t.inspect}

a = "1406357289".split(//)
for i in (1..7)
  if [a[i],a[i+1],a[i+2]].join.to_i % primes[i-1] != 0 then print i;res = false end
end
puts ("0123456789".split(//).permutation.to_a.select do |a|
  res = true
  if a[0] == "0" then next false end
  for i in (1..7)
    if [a[i],a[i+1],a[i+2]].join.to_i % primes[i-1] != 0 then res = false end
  end
  if res then puts a.inspect end
  next res
end.map{|a| a.join.to_i}.reduce(:+))