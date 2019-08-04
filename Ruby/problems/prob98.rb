words = File.open(File.join(__dir__, "../ressources/words.txt"), "r").to_a[0].tr('"',"").split(',')
require_relative '../utilities/stringUtilities'
require_relative '../utilities/sqrttest'
# List of anagrams
anagrams = words.each_with_object(Hash.new{|h, k| h[k] = []}){|w, acc| acc[w.to_unordered_hash].push(w)}.map{|_,v| v}

anagrams.select!{|x| x.length > 1}.sort!{|k1, k2| k2[0].length <=> k1[0].length}
p anagrams

$max_anagram_squares = 0
def find_if_square_pair(w1, w2, accumulator = 0, usable = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0], map_char_int = Hash.new(), is_start = true)
  if is_start
    p w1
    p w2
  end
  if usable.length == 0
    return false
  end
  if w1.length == 0
    if accumulator.issquare? and w2.split('').map{|x| map_char_int[x]}.reduce{|acc, x| acc*10+x}.issquare?
      p map_char_int
      $max_anagram_squares = [$max_anagram_squares, accumulator, w2.split('').map{|x| map_char_int[x]}.reduce{|acc, x| acc*10+x}].max
      return true
    end
    return false
  end
  if map_char_int[w1[0]]
    return find_if_square_pair(w1[1..-1], w2, accumulator*10 + map_char_int[w1[0]], usable, map_char_int, false)
  end
  usable.any?{|x| (not (is_start or w2[0] == w1[0]) or not x == 0) and find_if_square_pair(w1[1..-1], w2 , accumulator * 10 + x, usable - [x], map_char_int.merge({w1[0]=>x}), false)}
end

size = 0
for x in anagrams
  if size != 0 and x[0].length < size
    break
  end
  x.combination(2).each do |w1, w2|
    if find_if_square_pair(w1, w2)
      size = w1.length
      find_if_square_pair(w2, w1)
    end
  end
end
p $max_anagram_squares
