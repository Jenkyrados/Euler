require 'prime'
pcount = 0
diag_count = 1
prevsquarecorner = 1
len = 2
while pcount.to_r / diag_count > 1r/10 || pcount == 0
  for _ in (1..4)
    prevsquarecorner += len
    if prevsquarecorner.prime? then pcount += 1 end
  end
  diag_count += 4
  len+=2
end
len -=2
puts len+1
