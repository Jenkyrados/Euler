#hypothesis : 73162890
res = "73162890"
File.open('./keylog.txt').each do |line|
  j = 0
  for i in 0..9
    if res[i] == line[j] then
      j+=1
    end
  end
  if j < 2 then puts line; puts "NOOOO" end
end