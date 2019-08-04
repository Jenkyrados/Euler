require 'CSV'
matrix = CSV.read("./matrix.txt").each{|a| a.map!{|x| x.to_i}}

(0..79).reverse_each do |i|
    (0..79).reverse_each do |j|
      if i == 79 && j != 79 then
        matrix[i][j] += matrix[i][j+1]
      elsif j==79 && i!=79 then
        matrix[i][j] += matrix[i+1][j]
      elsif j!= 79 then
        matrix[i][j] += [matrix[i][j+1],matrix[i+1][j]].min
      end
    end
end

puts matrix[0][0]