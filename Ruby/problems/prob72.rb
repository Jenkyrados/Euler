require 'prime'
start = Time.now
totient = Array.new(1000001){0}
totient[1] = 1
min = [Float::INFINITY,0]
(2..1000000).each do |n|
  if totient[n] == 0 then
    totient[n] = n-1
    ((2*n)..1000000).step(n).each do |i|
      j = i/n
      if totient[i] != 0 || totient[j] == 0 then
        next
      end
      q = j;
      f = n-1;
      while (q%n == 0)
        f *= n;
        q /= n;
      end
      totient[i] = f* totient[q]
    end
  end
  if totient[n].to_s.chars.sort == n.to_s.chars.sort then
    min =[min, [n.to_r/totient[n],n]].min
  end
  if n%100000 == 0 then puts n; puts start-Time.now end
end
puts totient.reduce(:+)-1
puts start-Time.now