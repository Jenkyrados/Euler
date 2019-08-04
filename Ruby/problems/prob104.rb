$h = Hash.new(0)
$h[1] = 1
$h[2] = 1

def fib(n)
	if $h[n] == 0
		if n %2 == 0
			$h[n] = fib(n/2)*(2*fib(n/2+1)-fib(n/2))
		else
			$h[n] = fib(n/2)*fib(n/2) + fib(n/2+1)*fib(n/2+1)
		end
	end
	return $h[n]
end

res = 0
prev2 = 1
prev = 1
(3..Float::INFINITY).each do |x|
	t,prev,prev2 = prev+prev2,prev+prev2,prev 
	if x< 20
		next
	end
	prev %= 1000000000
	prev2 %= 1000000000
	t %= 1000000000
	last = t.to_s
	if (1..9).all?{|d| last[d.to_s]}
		# calc
		t = fib(x)
		first = t.to_s[0,9]
		if (1..9).all?{|d| first[d.to_s]}
			res = x
			break
		end
	end
end
p res

