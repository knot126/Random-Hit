function getX()
	local x = 0
	if wide then
		local b = (mgGetBeat(0.3)+offset) % 8
		if b == 0 then x = -2 end
		if b == 1 then x = -1 end
		if b == 3 then x = 1 end
		if b == 4 then x = 2 end
		if b == 5 then x = 1 end
		if b == 7 then x = -1 end
	else
		local b = (mgGetBeat(0.3)+offset) % 4
		if b == 0 then x = -1 end
		if b == 2 then x = 1 end
	end
	return x
end

function init()
	cr,cg,cb = mgGetColor("color", 0.5, 1.0, 0.5)

	offset = mgGetInt("offset", 0)
	width = mgGetFloat("width", 2.0)
	wide = mgGetBool("wide", true)

	sweeper = mgCreateBody(getX(), 2.05, 0)
	mgMaterial("steel")
	mgColor(0.8, 0.8, 0.8)
	mgStatic(2)
	mgCreateBox(sweeper, 0.42, 0.02, 0.05)
	
	mgStatic(0)
	mgMaterial("glass")
	mgForceLimit(0.1)
	mgColor(cr, cg, cb)
	mgCreateBox(sweeper, 0.4, 1.0, 0.02, 0, -1, 0)
	s = mgCreateBox(sweeper, 0.4, 0.02, 0.04, 0, -2, 0)
end

function tick()
	local x = getX()
	mgMove(sweeper, x, 2.05, 0, 0.13, 5)
	if not mgIsCleared() and mgGetShapeBody(s) ~= sweeper then
		mgClear()
	end
end

