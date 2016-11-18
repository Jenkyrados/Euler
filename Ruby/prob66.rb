require './utils'
max = [0,0]
isqrttab = (0..100).to_a.flat_map{|a|(a**2..((a+1)**2-1)).map{|_| a}}
(2..1000).map do |a|
  if isqrttab[a]**2 == a then next nil end
  num = isqrttab[a]
  denom = 1
  conv2num = 0
  conv2denom = 1
  conv1num = 1
  conv1denom = 0
  convnum = isqrttab[a]*conv1num + conv2num
  conv1num,conv2num = convnum,conv1num
  convdenom = isqrttab[a]*conv1denom + conv2denom
  conv1denom,conv2denom =convdenom,conv1denom
  while convnum**2 - a * convdenom**2 != 1
    denom = (a-num**2)/denom
    an = if denom == 1 then num*2 else (num+isqrttab[a])/denom end
    convnum = an*conv1num + conv2num
    conv1num,conv2num = convnum,conv1num
    convdenom = an*conv1denom + conv2denom
    conv1denom,conv2denom =convdenom,conv1denom
    if denom != 1 then
      num = isqrttab[a]-(num+isqrttab[a])%denom
    end
  end
  max = [max,[convnum,a]].max
end

puts max