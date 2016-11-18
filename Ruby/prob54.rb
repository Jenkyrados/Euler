def score(hand)
  val = 0
  vals = hand.map{|x| x[0]}
  upvals = vals.reverse
  if hand.all?{|x| x[1]==vals[0]} then #flush
    if vals.each_cons(2).all?{|x,y| x==y-1} then # straight
      if vals[0] == 10 then return [10]  # royal flush
      else return [9,vals[4]]
      end
    end
    val = 6
  end
  if vals.uniq.length == 2 then # only two different cards => four or full house
    if vals[0] == vals[1] && vals[4] == vals[3] then #full house
      return [7,vals[3]] # no need for second value, fulls can't be equal on first
    elsif vals[0] == vals[1] then #four on first card
      return [8,vals[0]]
    else return [8,vals[1]]
    end
  elsif val == 6 then return 6 end # otherwise flush is gud
  if vals.each_cons(2).all?{|x,y| x==y-1} then # straight
    return [5,vals[4]]
  end
  if vals.uniq.length == 3 then # either three of a kind or two pairs
    if vals.count{|a| a==vals[2]} == 3 then
      return [4,vals[2]]
    else return [3,vals[3],vals[1],upvals]
    end
  end
  vals.each_cons(2).each{|x,y| if x == y then return [2,x,upvals] end}
  return [1,upvals]
end
count = 0
File.open('./poker.txt').each do |line|
  s = line.split(' ')
  p1 = s[0..4]
  p2 = s[5..9]
  p1.map!{|a| a.split(//)}.map! do |x,y|
    [case x
      when "T"
        10
      when "J"
        11
      when "Q"
        12
      when "K"
        13
      when "A"
        14
      else x.to_i
    end,y]
  end.sort!
  p2.map!{|a| a.split(//)}.map! do |x,y|
    [case x
       when "T"
         10
       when "J"
         11
       when "Q"
         12
       when "K"
         13
       when "A"
         14
       else x.to_i
     end,y]
  end.sort!
  puts p1.inspect
  puts p2.inspect
  puts score(p1).inspect, score(p2).inspect, score(p1)<=> score(p2)
  if (score(p1) <=> score(p2)) == 1 then count += 1 end
end
puts count