n = 9
array = [1,1,1,1,1,1,1,1,1,1]
(1..n).each do |dig|
	tmp = 0
	(0..9).to_a.each do |i|
		tmp+=array[i]
	       	array[i] = tmp
	end
end
res = array.reduce(:+)
array = [1,1,1,1,1,1,1,1,1,1,1]
(1..n).each do |dig|
	tmp = 0
	(0..10).to_a.reverse.each do |i|
		tmp+=array[i]
	       	array[i]=tmp
	end
end
res += array.reduce(:+)
res -= 10*(n+1)+2
p res
