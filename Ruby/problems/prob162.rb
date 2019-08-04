$h = Hash.new(0)
def f(hasA,has0,has1,hasd,iterleft)
	if iterleft == 0
		if !(hasA && has0 && has1)
			return 0
		else
			return 1
		end
	end
	if $h[[hasA,has0,has1,hasd,iterleft]] == 0
		# if we have seen only one char
		$h[[hasA,has0,has1,hasd,iterleft]] += f(true,has0,has1,true,iterleft-1)
		$h[[hasA,has0,has1,hasd,iterleft]] += f(hasA,has0,true,true,iterleft-1)
		$h[[hasA,has0,has1,hasd,iterleft]] += f(hasA,hasd,has1,hasd,iterleft-1)
		$h[[hasA,has0,has1,hasd,iterleft]] += f(hasA,has0,has1,true,iterleft-1)*13
	end
	return $h[[hasA,has0,has1,hasd,iterleft]]
end
p "%X" % f(false,false,false,false,16)
