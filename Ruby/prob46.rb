require 'prime'
require './sqrttest'
puts issquare(25)
puts (9..Float::INFINITY).step(2).lazy.map{|a| a.to_i}.select{|a| !a.prime?} \
    .select{|a| (3..a).step(2).lazy.select{|b| b.prime? && issquare((a-b)/2)}.first.nil?} \
    .first
