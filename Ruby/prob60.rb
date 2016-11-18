require 'prime'

def calc
  sets = Hash.new(false)
  primes=[]
  minsum = Float::INFINITY
  minres = []
  Prime.each do |p|
    puts p
    tmpres=[]
    if p > minsum then return [minsum,minres] end
    primes.push(p)
    s = p.to_s
    for elem in primes
      if (elem.to_s + s).to_i.prime? && (s + elem.to_s).to_i.prime? then
        sets[[elem,p]] = true
        tmpres.push(elem)
      end
    end
    puts tmpres.length
    for c in tmpres.combination(4)
      if c.combination(2).to_a.all?{|t| sets[t]} then
        if minsum > c.reduce(:+)+p then
          minsum = c.reduce(:+)+p
          minres = c+[p]
          puts minres.inspect,minsum
          puts
        end
      end
    end

  end
end

puts calc