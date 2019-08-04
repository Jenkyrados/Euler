res=0
(1..Float::INFINITY).inject(0) do |mem,v|
	up = false
	down = up
	v.to_s.chars.each_cons(2) do |x,y|
		if x < y 
			up = true
		elsif x > y
			down = true
		end
		if down && up
			break
		end
	end
	if down && up 
		mem += 1
	end
	if mem.to_r / v == 99r/100
		res = v
		break
	end
	mem
end
p res
