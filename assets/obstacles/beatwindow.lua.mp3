function getRot()
	if (mgGetBeat(0.25)+offset) % 4 < beat then
		return 0
	else
		return -math.pi/2
	end
end

function init()
	cr,cg,cb = mgGetColor("color", 1, 1, 1)
	offset = mgGetFloat("offset", 0)
	beat = mgGetFloat("beat", 2)
	width = mgGetFloat("width", 4)

	b = mgCreateBody(0, 0.1, 0, 0, 0, 0)
	mgMaterial("steel")	
	mgMask(0)
	mgCreateBox(b, width/2, 0.1, 0.05)

	mgMaterial("glass")
	mgColor(cr, cg, cb)
	mgCreateBox(b, width/2, 0.7, 0.04, 0, 0.8, 0)
	
	mgCreateHingeJoint(b, 0, 0, 0, 0, 1, 0, 0)
	mgRotate(b, angle, 0, 0, 100, 7)
end

function tick()
	r = getRot()
	mgRotate(b, r, 0, 0, 2.0, 8)
	local cx, cy, cz = mgGetCameraPos()
	if not mgIsCleared() and not mgBodyContainsPoint(b, cx, 1, 0) then
		mgClear()
	end
end

