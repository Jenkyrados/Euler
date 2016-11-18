frac = 1r
count = 0
for _ in (1..1000)
  frac = 1+1/(1+frac)
  if frac.denominator.to_s.length < frac.numerator.to_s.length then count+=1 end
end
puts count