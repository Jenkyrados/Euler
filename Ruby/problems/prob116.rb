$r = Hash.new(0)
$r[2] = 2
$r[1] = 1
def red(n)
	if $r[n] == 0
		$r[n] = red(n-1)+red(n-2)
	end
	return $r[n]
end
$g = Hash.new(0)
$g[3] = 2
$g[2] = 1
$g[1] = 1
def green(n)
	if $g[n] == 0
		$g[n] = green(n-1)+green(n-3)
	end
	return $g[n]
end
$b = Hash.new(0)
$b[4] = 2
$b[3] = 1
$b[2] = 1
$b[1] = 1
def blue(n)
	if $b[n] == 0
		$b[n] = blue(n-1)+blue(n-4)
	end
	return $b[n]
end
n = 50
p (red(n)+blue(n)+green(n)-3)
