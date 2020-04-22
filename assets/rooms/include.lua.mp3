
gSegment = {}
gLastSegment = 0
gTotalProb = 0.0


function confSegment(name, prob, times)
	times = times or 1000
	gSegment[#gSegment+1] = {name, prob, times, 0}
	gTotalProb  = gTotalProb + prob
end


function nextSegment()
	s = 0
	if #gSegment == 1 then
		return gSegment[1][1]
	end
	repeat
		p = 0.0
		r = mgRndFloat(0, 1)
		for i=1, #gSegment do
			p = p + gSegment[i][2]/gTotalProb
			if p > r then
				if i == gLastSegment or gSegment[i][4] == gSegment[i][3] then
					break
				else
					s = i
					break
				end
			end
		end
	until s > 0
	gLastSegment = s
	gSegment[s][4] = gSegment[s][4] + 1
	return gSegment[s][1]
end



