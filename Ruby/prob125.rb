require './utils'
sums = []
count = 0
sum = 0
h = Hash.new(false)
(1..10000).each do |x|
	sums.map!{|t|t+x*x}
	sums.select!{|v| v < 1e8}
	sums.each do |p|
		if p.to_s.palindrome? && !h[p]
			h[p] = true
			sum += p
			count +=1
		end
	end
	sums << x*x
end
p count
p sum
