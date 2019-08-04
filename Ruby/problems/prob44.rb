require './utils'
pentagons = [1,5]
curr = 1
mindiff = Float::INFINITY
while pentagons[curr]-pentagons[curr -1] < mindiff do
  i = 1
  while (pentagons[curr]-pentagons[curr -i] < mindiff )&& (i <= curr) do
    while pentagons[pentagons.length-1] < pentagons[curr] + pentagons[curr-i] do
      pentagons.push((pentagons.length+1)*(3*pentagons.length+2)/2)
    end
    if !(pentagons[curr] + pentagons[curr-i]).pentagonal? then
      i = i+1
      next
    end
    if (pentagons[curr] - pentagons[curr-i]).pentagonal? then
      mindiff = pentagons[curr]-pentagons[curr-i]
      puts mindiff
    end
    i = i+1
  end
  curr+=1
end
puts mindiff