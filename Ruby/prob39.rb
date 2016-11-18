puts (1..999).map{|p| [(1..p/2).select{|a| (p**2 - 2*p*a) % (2*(p-a)) == 0}.length,p]}.sort{|x,y| y[0] <=> x[0]}.first()

 #a**2 + b**2 = (p-a-b)**2
 #b**2 = (p-a)**2 - b * 2*(p-a) +b**2 - a**2
 #b = (p**2 - 2pa) / 2*(p-a)