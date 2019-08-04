puts ((1..Float::INFINITY).lazy.select do |x|
  s = x.to_s.split(//).sort()
  res = true
  for i in 2..6
    s2 = (i*x).to_s.split(//).sort()
    if s != s2  then res = false; break end
  end
  next res
end.first)