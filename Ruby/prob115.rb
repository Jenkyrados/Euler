$h = Hash.new(0)
$h[0] = 1
$h[1] = 1
$h[2] = 1
def total(m,n)
	if $h[n] == 0 && n > 0
		$h[n] = total(m,n-1)
		if m <= n
			$h[n]+=1
		end
		if m+1 <=n
			$h[n] += ((m+1)..n).map{|x| total(m,n-x)}.reduce(:+)
		end
	end
	return $h[n]
end
(1..Float::INFINITY).each do |v|
	if total(50,v) > 1000000
		p v
		break
	end
end
