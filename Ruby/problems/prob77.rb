require 'prime'
$hash = Hash.new(0)
def recsums(n,maxsize)
  if n < 0 then return 0 end
  if n == 0 then return 1 end
  if $hash[[n,maxsize]] != 0 then return $hash[[n,maxsize]] end
  if maxsize == 0 then return 0 end
  Prime.each do |a|
    if a > maxsize then break end
    $hash[[n,maxsize]] += recsums(n-a,a)
  end
  return $hash[[n,maxsize]]
end

x = 0
i = 2
while x < 5000
  x = recsums(i,i-1)
  i+=1
end
puts i-1

