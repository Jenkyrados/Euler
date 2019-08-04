res = 2r/5
(2..1000000).each do |d|
  ((res*d).ceil..d).each do |n|

    if n.to_r/d >= 3r/7 then break end
    if n.to_r/d > res then res = n.to_r/d end
  end
end
puts res