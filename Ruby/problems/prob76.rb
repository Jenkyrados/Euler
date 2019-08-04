$hash = Hash.new(0)
def recsums(n,maxsize)
  if n < 0 then return 0 end
  if maxsize == 1 then return 1 end
  if n == 0 then return 1 end
  if $hash[[n,maxsize]] != 0 then return $hash[[n,maxsize]] end
  if maxsize == 0 then return 0 end
  (1..maxsize).reverse_each do |a|
    $hash[[n,maxsize]] += recsums(n-a,a)
  end
  return $hash[[n,maxsize]]
end

recsums(100,99)
puts $hash[[100,99]]