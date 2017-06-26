$h = Hash.new(0)
$maxiter = 30
def prizeGen(iter,consA,loss)
	if iter == $maxiter
		return 1
	end
	if $h[[iter,consA,loss]] == 0
		$h[[iter,consA,loss]]+=prizeGen(iter+1,0,loss)
		if consA != 2
			$h[[iter,consA,loss]]+=prizeGen(iter+1,consA+1,loss)
		end
		if !loss
			$h[[iter,consA,loss]]+=prizeGen(iter+1,0,true)
		end
	end
	return $h[[iter,consA,loss]]
end
p prizeGen(0,0,false)
