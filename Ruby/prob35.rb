require 'prime'
puts ((1...1000000).map do |a|
  if a.prime? then
    res = a
    s = a.to_s.split(//).to_a
    for i in (2..s.length)
      s.rotate!(1)
      if !s.join.to_i.prime? then res = nil;break end
    end
    res
  end
end.compact.length)