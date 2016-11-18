# took 150 secs
start = Time.now
res = 0
found = Hash.new(false)
(2..12000).each do |d|
  x = d.to_r
  ((x/3).ceil..(x/2).floor).each do |n|
    quot = n/x
    if quot != 1r/3 && quot != 1r/2 && !found[quot] then found[quot] = true;res+= 1 end
  end
  puts d
end
puts res
puts start-Time.now