pete = (1..4).to_a.repeated_permutation(9).map{|t|t.reduce(:+)}.each_with_object(Hash.new(0)) { |e, h| h[e] += 1 }
cube = (1..6).to_a.repeated_permutation(6).map{|t|t.reduce(:+)}.each_with_object(Hash.new(0)) { |e, h| h[e] += 1 }

wins = 0
(9..36).each do |p|
	(6...p).each do |c|
		wins += cube[c]*pete[p]
	end
end
p wins.to_f/(pete.values.reduce(:+)*cube.values.reduce(:+))
