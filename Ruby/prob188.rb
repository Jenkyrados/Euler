require './utils'
def totient(n)
	l = n.primefactors
	(n*l.map{|x| 1-1r/x}.reduce(:*)).to_i
end
def modtetration(n,it,mod)
	if it == 1
		return n
	end
	if mod == 1
		return 0
	end
	t = totient(mod)
	x = modtetration(n,it-1,t)
	x = x % t
	return modexp(n,x,mod)
end
p modtetration(1777,1855,100000000)
