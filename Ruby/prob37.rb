require 'prime'
puts ((10..Float::INFINITY).lazy.select do |a|
  if !a.prime? then next false end
  s = a.to_s.split(//).to_a
  s2 = a.to_s.split(//).to_a
  res = true
  for i in 2..a.to_s.length
    s.delete_at(0)
    s2.pop()
    if (!s.join.to_i.prime?) || (!s2.join.to_i.prime?) then res = false end
  end
  next(res)
end.first(11).reduce(:+))
