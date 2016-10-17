# Euler problem 4
$res = 0
$n = 1000
($n-1).downto(1) {|tmp| ($n-1).downto(1) {|tmp2| if tmp*tmp2 > $res and palindrome? (tmp*tmp2).to_s then $res = tmp*tmp2 end}}
puts $res