require './utils'
puts @hexagon_gen.lazy.select{|a| a.triangular? && a.pentagonal? && a.hexagonal?}.first(2)