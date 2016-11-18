require 'prime'
Prime.take_while{|t| t < 10000}.each do |p|
  perms = p.to_s.split(//).permutation.to_a.map{|a| a.join.to_i}.select{|a| a.prime? && a > 1000}.sort
  for s in perms
    if s > p && perms.bsearch{|val| (2*s-p) <=> val} then puts [p,s,2*s-p].join(" ") end
  end
end