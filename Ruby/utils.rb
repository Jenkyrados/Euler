def palindrome?(str)
  str == str.reverse
end

def splitspace(data)
  data.each_line.map{|line| line.split(/\s+/)}
end

def divisors_of(num)
  tmp = Math.sqrt(num)
  if num == 1 then return [1] end
  return (1..tmp.ceil-1).map{|i| if num % i == 0 then [i,num/i] else [] end}.push(if (tmp%1).zero? then [tmp.to_i] else [] end).flatten!
end

triangle = Enumerator.new do |yielder|
  i = 1
  tmp = 1
  loop do
    i = i+1
    tmp = tmp+i
    yielder.yield tmp
  end
end