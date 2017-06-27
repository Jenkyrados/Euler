$h = Hash.new(0)
def f(rest, num)
	if num < 2
		return 1
	end
	if $h[[rest,num]] == 0
		d = num%2
		if rest == d
			$h[[rest,num]] = f(0,num/2) + f(1, num/2)
		else
			$h[[rest,num]] = f(rest,num/2)
		end
	end
	return $h[[rest,num]]
end
p f(0,10**25)
