require 'prime'
start = Time.now
factors = Hash.new{|hash,key| hash[key] = Array.new()}
max = [0,0]
(2..1000000).each do |n|
  if factors[n] == [] then
    ((2*n)..1000000).step(n).each{|i| (factors[i]).push(n)}
  end
  res = 1r
  res *= n
  factors[n].each do |p,_|
    res *= (1-1r/p)
  end
  max =[max, [n/res,n]].max
end
puts max
puts start-Time.now
start = Time.now
factors = Array.new(1000001){Array.new()}
max = [0,0]
(2..1000000).each do |n|
  if factors[n] == [] then
    ((2*n)..1000000).step(n).each{|i| (factors[i]).push(n)}
  end
  res = 1r
  res *= n
  factors[n].each do |p,_|
    res *= (1-1r/p)
  end
  max =[max, [n/res,n]].max
end
puts max
puts start-Time.now
