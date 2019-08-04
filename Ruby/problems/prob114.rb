$h = Hash.new(0)
$h[0] = 1
$h[1] = 1
$h[2] = 1
$h[3] = 2
def total(n)
	if $h[n] == 0 && n > 0
		$h[n] = total(n-1)+(4..n).map{|x| total(n-x)}.reduce(:+)+1
	end
	return $h[n]
end
n = 50
p total(n)
