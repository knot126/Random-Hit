function getX()
	if beat then
		local x = 0
		local b = (mgGetBeat(0.3)+offset)
		local s = width*2+1
		x = b % (s*2-2)
		if x < s then 
			x = x-width
		else
			x = (s-1)-(x-s+1)-width
		end
		return x
	else
		return math.sin((mgCameraDistance()+offset)*speed*0.5) * width
	end
end

function init()
	cr,cg,cb = mgGetColor("color", 1, 1, 1)
	width = mgGetInt("width", 2)
	height = mgGetFloat("height", 2)
	paneWidth = mgGetFloat("panewidth", 0.4)
	beat = mgGetBool("beat", false)
	speed = mgGetFloat("speed", 1)
	thickness = mgGetFloat("thickness", 0.02)
	strength = mgGetFloat("strength", 0.2)
	blocker = mgGetBool("blocker", false)

	if mgGetString("offset", "rnd") == "rnd" then
		if beat then
			offset = mgRndInt(0, 8)
		else
			offset = mgRndFloat(0, 100)
		end
	else
		offset = mgGetFloat("offset", 0)
	end
	
	sweeper = mgCreateBody(getX(), height+0.05, 0)
	mgMaterial("steel")
	mgColor(0.8, 0.8, 0.8)
	mgStatic(2)
	mgCreateBox(sweeper, paneWidth+0.02, 0.02, thickness + 0.03)
	
	mgStatic(0)
	mgMaterial("glass")
	mgForceLimit(strength)
	mgColor(cr, cg, cb)
	if blocker then
		mgCreateBox(sweeper, paneWidth, 3*height/12, thickness, 0, -3*height/12, 0)
		mgCreateBox(sweeper, paneWidth, 1*height/12, thickness, 0, -11*height/12, 0)
		mgMaterial("steel")
		mgShapeChamfer(0.02)
		block = mgCreateBox(sweeper, paneWidth+0.02, height/6, thickness+0.02, 0, -4*height/6, 0)
		mgShapeChamfer(0.0)
	else
		mgCreateBox(sweeper, paneWidth, height/2, thickness, 0, -height/2, 0)
	end
	s = mgCreateBox(sweeper, paneWidth+0.02, 0.02, 0.04, 0, -height, 0)
	mgCreateSliderJoint(0, sweeper, getX(), height+0.2, 0, 1, 0, 0)
end

function tick()
	local x = getX()
	mgMove(sweeper, x, 2.05, 0, 1.5, 5)
	if blocker then
		if not mgIsCleared() and mgGetShapeBody(block) ~= sweeper then
			mgClear()
		end
	else
		if not mgIsCleared() and mgGetShapeBody(s) ~= sweeper then
			mgClear()
		end
	end
end

