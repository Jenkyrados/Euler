require 'CSV'
require 'algorithms'
include Containers
Matrix = CSV.read("./matrix2.txt").each{|a| a.map!{|x| x.to_i}}
#Matrix = [[131,673,234,103,18],[201,96,342,965,150],[630,803,746,422,111],[537,699,497,121,956],[805,732,524,37,331]]
height = Matrix.length
class PriorityQueue
  def next_key
    return @heap.next_key
  end
end
res = Float::INFINITY
# from exit, what are the min paths leading to column?
(0..79).each do |e|
  stock = Array.new(height){Array.new(height){0}}
  stock[e][height-1] = Matrix[e][height-1]
  to_do = PriorityQueue.new
  to_do.push([e,height-1],Matrix[e][height-1])
  while !to_do.empty?
    if to_do.next_key < -1*res then break end
    i,j = to_do.pop
    # if we hit the left col, it's the first hit.
    # We can't do better folks
    if j == 0 then res = [res,stock[i][j]].min; break end
    if i > 0 then
      t = Matrix[i-1][j] + stock[i][j]
      if stock[i-1][j] == 0 || t < stock[i-1][j] then
        stock[i-1][j] = t
        to_do.push([i-1,j],-t)
      end
    end
    if j > 0 then
      t = Matrix[i][j-1] + stock[i][j]
      if stock[i][j-1] == 0 || t < stock[i][j-1] then
        stock[i][j-1] = t
        to_do.push([i,j-1],-t)
      end
    end
    if i < height-1 then
      t = Matrix[i+1][j] + stock[i][j]
      if stock[i+1][j] == 0 || t < stock[i+1][j] then
        stock[i+1][j] = t
        to_do.push([i+1,j],-t)
      end
    end
  end
end
puts res