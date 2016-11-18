require 'prime'
puts (Prime.lazy.select do |a|
  scons = a.to_s.split(//)
  combs = (1..(scons.length-1)).flat_map{|n| (0..(scons.length-2)).to_a.combination(n).to_a}
  res = false
  for el in combs
    s=a.to_s.split(//)
    if !el.all?{|i| s[i] == s[el[0]]} then next end
    if el[0] == 0 then
      if (1..9).select{|b| el.each{|i| s[i]=b};s.join.to_i.prime?}.length >= 8 then
        res = true
        puts el.inspect
        puts (1..9).map{|b| el.each{|i| s[i] = b};if s.join.to_i.prime? then s.join.to_i end}.compact.inspect
        break
      end
    elsif (0..9).select{|b| el.each{|i| s[i]=b};s.join.to_i.prime?}.length >= 8  then
      res = true
      puts el.inspect
      puts (0..9).map{|b| el.each{|i| s[i] = b};if s.join.to_i.prime? then s.join.to_i end}.compact.inspect
      break
    end
  end
  next res
end.first)