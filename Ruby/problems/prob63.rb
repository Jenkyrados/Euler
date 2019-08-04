count = 0
(1..9).each do |a| # if a > 9 then each addition to n adds at least one digit, so it never catches up
  n = 1
  while (a**n).to_s.chars.length ==n
    count += 1
    n+=1
  end
end
puts count