require 'prime'
puts (1..Float::INFINITY).lazy.select{|t| \
    Prime.prime_division(t).length == 4 && \
    Prime.prime_division(t+1).length == 4 && \
    Prime.prime_division(t+2).length == 4 && \
    Prime.prime_division(t+3).length == 4}.first