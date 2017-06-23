require './utils'
n = 15
v = (n%2==0)?(n/2-1):(n/2)
p (n+1).fact.to_f/((1..v).flat_map{|x| (1..n).to_a.combination(x).map{|t| t.reduce(:*)}}.reduce(:+)+1)
