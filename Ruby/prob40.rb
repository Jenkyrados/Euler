arr = []
i = 1
while arr.length < 1000000 do
  arr.push(*i.to_s.split(//))
  i+=1
end
puts [arr[0],arr[9],arr[99],arr[999],arr[9999],arr[99999],arr[999999]].map{|a| a.to_i}.reduce(:*)