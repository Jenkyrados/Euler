count = 1
prod = 1r
iter = 2
while count <=4 do
  s = iter.to_s.split(//)
  for i in 12...iter
    s2 = i.to_s.split(//)
    for c in s & s2
      if c != "0" && ((s2 - [c]).join.to_f / (s-[c]).join.to_f).eql?(i.to_f/iter.to_f) then
        count += 1
        prod *= i
        prod /= iter
      end
    end
  end

  iter+=1
end

puts prod