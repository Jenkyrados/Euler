require './utils'
# TODO : Make faster
# index = sum to make, index 2 = biggest coin allowed
# original, working but too slow implem
=begin
  $hash = [[1],[0,1]]

  def make_change(n)
    sum = 0
    $hash.push([0]*(n+1))
    for c in (1..n)
      if n-c < c then
        $hash[n][c] = $hash[n-c][n-c] + $hash[n][c-1]
      else
        $hash[n][c] = $hash[n-c][c] + $hash[n][c-1]
      end
    end
  end
=end

#cache perms
p = [0]*100000
p[0] = p[1] = 1

# cache pentagons
penta = [0]*100000
len = 0

start = Time.now
x = 1
i = 2
while x %1000000 != 0
  x = 0
  k = 1
  it = 1
  (0..Float::INFINITY).lazy.each do |n|
    if n == len then
      penta[n] = (k*(3*k-1)/2)
      len+=1
    end
    if penta[n] > i then break end
    x += it * p[i-penta[n]]
    k = -k
    if n %2 == 1 then k+=1; it *= -1 end
  end
  p[i] = x
  i+=1
end
puts i-1
puts Time.now - start