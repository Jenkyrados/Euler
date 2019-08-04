require 'prime'
n = 1000000
primesundern = Prime.take_while{|a| a<n}
puts (primesundern.each_with_index.inject([]) do |memo,a|
  val,index = a
  sum = val
  memo.push([val,1])
  len = 1
  while index+len < primesundern.length && sum + primesundern[index+len-1] < n
    len += 1
    sum += primesundern[index+len-1]
    if sum.prime? then
      memo[-1] = [sum,len]
    end
  end
  memo
end.sort{|x,y| y[1] <=> x[1]}.first)