require 'CSV'
# A, B, C are all lists of two elements (each being a point)
def contains_origin(a, b, c)
  # t[0] = -x
  # t[1] = +x
  # t[2] = -y
  # t[3] = +y
  t = [false] * 4
  for x in [a, b, c].combination(2)
    p1, p2 = x
    if p1[0] == p2[0]
      if p1[1] * p2[1] <= 0
        if p1[0] < 0
          t[0] = true
        elsif p1[0] > 0
          t[1] = true
        end
      end
    elsif p1[1] == p2[1]
      if p1[0] * p2[0] <= 0
        if p1[1] < 0
          t[2] = true
        elsif p1[0] < 0
          t[3] = true
        end
      end
    else
      coeff = (p1[1] - p2[1])*1.0/(p1[0] - p2[0])
      bias = (p2[0] * p1[1] - p1[0] * p2[1])*1.0/(p2[0] - p1[0])
      if p1[0] * p2[0] <= 0
        if bias < 0
          t[2] = true
        elsif bias > 0
          t[3] = true
        end
      end
      if p1[1] * p2[1] <= 0
        valx0 = -bias/coeff
        if valx0 < 0
          t[0] = true
        elsif valx0 > 0
          t[1] = true
        end
      end
    end
  end
  return t.all?
end

p contains_origin([-340, 495], [-153, -910], [835, -947])
p contains_origin([-175, 41], [-421, -714], [574, -645])

acc = 0
CSV.foreach("../ressources/p102_triangles.txt") do |row|
  triangle = row.map{|x| x.to_i}
  triangle = triangle.each_slice(2)
  if contains_origin(*triangle)
    acc += 1
  end
end
p acc