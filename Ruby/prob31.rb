digits = "123456789".split(//)
perms34 = digits.permutation(3).to_a | digits.permutation(4).to_a
perms12 = digits | digits.permutation(2).to_a
perms45 = (digits.permutation(4).to_a | digits.permutation(5).to_a).map{|a| a.join}.sort

puts perms12.map{ |s|
  if s.is_a?(String) then
    s = [s]
  end
  x = s.join.to_i
  perms34.map{ |s2|
    y = s2.join.to_i
    s3 = (x*y).to_s.split(//)
    searchvar = s3.join
    if ((s2 & s) == [] )&&(((s| s2) & s3) == [])&&((s|s2|s3) + digits - ((s|s2|s3) &digits) == [])&&(! (perms45.bsearch{|a| searchvar <=> a}.nil?)) then x*y end
  }.compact!
}.flatten.compact.uniq.reduce(:+)
