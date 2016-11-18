require 'CSV'
x = CSV.read("./cipher.txt").each{|a| a.map!{|w| w.to_i}}
freq = [Hash.new(0),Hash.new(0),Hash.new(0)]
i = 0
x.each do |row|
  row.each{|val| freq[i][val] += 1;i = i+1;i = i%3}
end
freq.map!{|hash| hash.to_a.sort{|x,y|y[1] <=> x[1]}}

key = []
for i in 1..26
  if (freq[0][0][0] ^ (i+'a'.ord)).chr == ' ' then
    key.push(i+'a'.ord)
    break
  end
end
for i in 1..26
  if (freq[1][0][0] ^ (i+'a'.ord)).chr == ' ' then
    key.push(i+'a'.ord)
    break
  end
  end
for i in 1..26
  if (freq[2][0][0] ^ (i+'a'.ord)).chr == ' ' then
    key.push(i+'a'.ord)
    break
  end
end
puts key.inspect
i = -1
x.each do |row|
  puts row.map{|val| i = i+1; i = i%3;(val ^ key[i])}.reduce(:+)
end
=begin
(1..26).each{|a| (1..26).each{|b| (1..26).each do |c|
    i = -1
    key = [a,b,c].map{|t| 'a'.ord+t}
    puts key.inspect
    x.each do |row|
      puts row.map{|val| i = i+1; i = i%3; (val^(key[i])).chr}.join.inspect
    end
  end
}}
=end

