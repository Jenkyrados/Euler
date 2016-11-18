require 'prime'
puts "1234567".split(//).permutation(7).to_a.sort{|x,y| y <=> x}.lazy.select{|a| a.join.to_i.prime?}.first(1)