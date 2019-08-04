$h = Hash.new(0)
$h[4] = 8
$h[3] = 4
$h[2] = 2
$h[1] = 1
def total(n)
	if $h[n] == 0
		$h[n] = total(n-1)+total(n-2)+total(n-3)+total(n-4)
	end
	return $h[n]
end
n = 50
p total(n)
