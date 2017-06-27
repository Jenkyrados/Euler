factors = Hash.new(0)
previous = 0
cons = 0
(2...10000000).each do |p|
	if p%100000 == 0
		p p
	end
	factors[p*p] +=1
	((p*p+p)...10000000).step(p).each{|n| factors[n] += 2}
	if previous == factors[p]+1
		cons+=1
	end
	previous = factors[p]+1
end
p cons

