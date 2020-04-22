function init()
	pStart = mgGetBool("start", true)
	pEnd = mgGetBool("end", true)

	mgMusic("14")
	mgReverb(0.2, 0.8, 0.3)
	mgEcho(0.3, 0.2, 0.5, 0.5)
	mgFogColor(1.8, 1.6, 0.9, .05, -0.5, -0.5)
	
	confSegment("basic/basic/chasms", 1)
	
	l = 0
	
	l = l + mgSegment("credits/start", -l)	
	l = l + mgSegment("credits/1", -l)	
	l = l + mgSegment("credits/2", -l)	
	l = l + mgSegment("credits/3", -l)	
		
	mgLength(l)
end

function tick()
end
