require 'CSV'
triangles = [1,3,6,10]
trianglecount = 0
CSV.foreach("./words.txt") do |row|
  for word in row do
    val = word.split(//).map{|c| c.ord-'A'.ord + 1}.reduce(:+)
    while val > triangles[triangles.length-1] do
      triangles.push(triangles[triangles.length-1]+triangles.length+1)
    end
    if triangles.bsearch{|a| val <=> a} then trianglecount += 1 end
  end
end
puts trianglecount