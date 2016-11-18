require './utils'
def dist_21(num)
    return divisors_of(num).reduce(:+)-num
end

puts (1..10000).inject([]){|memo, i| if (dist_21(dist_21(i)) == i && dist_21(i) != i) then memo << i end; memo}.reduce(:+)