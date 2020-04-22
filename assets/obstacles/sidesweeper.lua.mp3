function init()
	cr,cg,cb = mgGetColor("color", 0.5, 1.0, 0.5)

	offset = math.random(0, 100)
	width = mgGetFloat("width", 2.0)

	a = mgCreateBody()
	mgMaterial("steel")
	mgColor(0.8, 0.8, 0.8)
	mgStatic(1)
	mgCreateBox(a, 5, 0.02, 0.1, 0, 2.1, 0)

	mgStatic(2)
	sweeper = mgCreateBody(math.sin(mgTime()+offset), 2.05, 0)
	mgCreateBox(sweeper, 0.42, 0.02, 0.05)
	
	mgStatic(0)
	mgMaterial("glass")
	mgForceLimit(0.1)
	mgColor(cr, cg, cb)
	mgCreateBox(sweeper, 0.4, 1.0, 0.02, 0, -1, 0)
end

function tick()
	local x = width*math.sin(mgTime()+offset)
	mgMove(sweeper, x, 2.05, 0, 1)
end

