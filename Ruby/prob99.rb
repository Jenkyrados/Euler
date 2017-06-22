maxv = 0
maxexp = 0
maxline = 0
File.foreach("base_exp.txt").with_index do |line,i|
    v,exp = line.split(',').map{|a| a.to_i}
    if maxv == 0 || (maxv < v && maxexp < exp) || Math.log(v,maxv)*exp > maxexp
        maxv = v
        maxexp = exp
        maxline = i
    end
end
p maxv
p maxexp
p maxline
