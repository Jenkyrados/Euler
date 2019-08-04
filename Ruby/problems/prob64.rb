isqrttab = (0..100).to_a.flat_map{|a|(a**2..((a+1)**2-1)).map{|_| a}}
count = 0
(2..7).map do |a|
  if isqrttab[a]**2 == a then next nil end
  sequence = []
  num = isqrttab[a]
  denom = 1
  while sequence == [] || sequence.length % 2 == 1 \
        || sequence[0...sequence.length/2] != sequence[sequence.length/2...sequence.length]
    denom = (a-num**2)/denom
    sequence.push([if denom == 1 then num*2 else (num+isqrttab[a])/denom end,num,denom])
    if denom != 1 then
      num = isqrttab[a]-(num+isqrttab[a])%denom
    end
  end
  if (sequence.length/2) % 2 == 1 then count +=1 end
  puts sequence.inspect
end
puts count