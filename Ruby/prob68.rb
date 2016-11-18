n = 5
pos = [0]*(n*2)
placed = Hash.new(false)
#$pos[0] = 6
$maxstring = 0
def recinside(i,n,pos,placed)
  (1..(n*2)).reverse_each do |a|
    if placed[a] then next end
    pos[i] = a
    placed[a] = true
    if i == (n*2-1) then recoutside(0, 0,n,pos,placed) else recinside(i+1,n,pos,placed) end
    placed[a] = false
  end
end

def recoutside(i,sum,n,pos,placed)
  (1..(n*2)).reverse_each do |a|
    if placed[a] then next end
    pos[i] = a
    placed[a] = true
    if sum != 0 && a+pos[i+n]+pos[if(i==n-1) then n else i+n+1 end] != sum then placed[a] = false;next end

    if i==n-1 then
      s = []
      x = pos[0...n].each_with_index.min[1]
      for i in x..(x+n-1)
        s.push(pos[i%n],pos[i%n+n],pos[if (i%n)==n-1 then n else i%n+n+1 end])
      end
      puts s.inspect
      if s.join.length == 16 then $maxstring = [$maxstring,s.join.to_i].max end
    else
      recoutside(i+1,a+pos[i+n]+pos[i+n+1],n,pos,placed)
    end
    placed[a] = false
  end
end

recinside(n,n,pos,placed)
puts $maxstring