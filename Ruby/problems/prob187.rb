require 'prime'
pri = []
res = 0
limit = 1e8
Prime.each do |x|
	pri << x
	i = 0
	while i < pri.size && x*pri[i] < limit 
		res += 1
		i += 1
	end
	if x*2 >= limit
		break
	end
end
p res
