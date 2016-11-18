require 'Time'

start = Time.now
cubes = Hash.new(-1)
treated = Hash.new(false)
latest = 0
last_len = 1
(1..Float::INFINITY).each do |a|
  t = a**3
  puts a
  len = t.to_s.length
  if len > last_len then
    cubes = Hash.new(0)
    last_len = len
  end
  perm = t.to_s.chars.sort
  cubes[t] = [1,perm]
  res = false
  cubes.each do |key,val|
    if val[1] == perm then
      cubes[key] = [val[0]+1,val[1]]
      if val[0] == 5 then
        puts key
        res = true
      end
      break
    end
  end
  if res then break end
end
puts start-Time.now