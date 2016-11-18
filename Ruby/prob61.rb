require './utils'
require './sqrttest'

$predicates = [Integer.instance_method(:triangular?),Integer.instance_method(:issquare?),Integer.instance_method(:pentagonal?),Integer.instance_method(:hexagonal?),Integer.instance_method(:heptagonal?)]#,Integer:instance_method(:octagonal?)]

def recmethod(curnum,methlist,stock)
  x = curnum.to_s.split(//)[2..3].join.to_i
  if x < 10 then return nil end
  x*=100
  (x..(x+99)).each do |a|
    if stock.length == $predicates.length+1 then
      if a == stock[0][0] then return stock end
    else
      methlist.each_with_index do |meth,index|
        if meth.bind(a).() then
          if methlist.length-1 == index then
            t = recmethod(a,methlist[0...index],stock+[[a,meth]])
          elsif index == 0 then
            t = recmethod(a,methlist[1..(methlist.length-1)],stock+[[a,meth]])
          else
            t = recmethod(a,methlist[0...index] + methlist[(index+1)..(methlist.length-1)],stock+[[a,meth]])
          end
          if !t.nil? then return t end
        end
      end
    end
  end
  return nil
end

@octagon_gen.each do |a|
  if a < 1000 then next end
  if a >9999 then break end
  t =  recmethod(a,$predicates,[[a,Integer.instance_method(:octagonal?)]])
  if !t.nil? then puts t.map{|a| a[0]}.reduce(:+) end
end