require 'prime'
n = 100
lim = 1000000000
nums = [1]
Prime.take_while{|t|t<=n}.each do |f|
	tmp = f
	# stock the newly created elements in a separate array
	# so as to avoid duplicates
	new = []
	# iterate on the powers of the prime
	while tmp <= lim
		# add all the possible new numbers that can be made from the
		# combination of numbers generated from previous factors
		# and from the current power of the factor
		# but only if they do not exceed the limit
		new.concat nums.flat_map{|x| (x*tmp<=lim)?[x*tmp]:[]}
		tmp *=f
	end
	nums.concat new
end
p nums.size
