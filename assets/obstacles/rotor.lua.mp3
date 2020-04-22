function getAngle()
	if beat ~= 0 then
		ang = math.pi/4.0*mgGetBeat(0.3) + offset
		if beat > 0 then ang = -ang end
		return ang
	end
	if drive then
	 	return speed*(mgCameraDistance()-0.5) - 1.57 + offset
	end
end

function init()
	cr,cg,cb = mgGetColor("color", 1, 1, 1)
	length = mgGetFloat("length", 1.0)
	arms = mgGetInt("arms", 2)
	speed = -mgGetFloat("speed", 2) * 0.15
	drive = mgGetBool("drive", true)
	width = mgGetFloat("width", 0.1)
	endplate = mgGetBool("endplate", false)
	beat = mgGetInt("beat", 0)
	radius = mgGetFloat("radius", 0.2)
	if mgGetString("offset", "rnd") == "rnd" then
		offset = mgRndFloat(0, 30)
	else
		offset = mgGetFloat("offset", 0)
	end
	thickness = mgGetFloat("thickness", 0.1)

	b = mgCreateBody(0, 0, 0, 0, 0, getAngle())
	mgMaterial("steel")
	mgRoundness(1)
	mgShapeChamfer(0.03)
	mgCreateCylinder(b, radius, thickness+0.03, 0, 0, 0, 0, 1.57, 0)

	if endplate then 
		for i=1, arms do
			ang = (math.pi*2*i)/arms
			r = length+2*width+radius-0.05
			x = math.cos(ang)*r
			y = math.sin(ang)*r
			mgShapeChamfer(0.02)
			mgCreateBox(b, 2*width+0.05, width+0.05, thickness+0.05, x, y, 0, 0, 0, ang)
		end
	end
	mgShapeChamfer(0)

	mgMaterial("glass")
	mgColor(cr,cg,cb)
	
	shape = {}
	for i=1, arms do
		ang = (math.pi*2*i)/arms
		r = length/2+radius-0.05
		x = math.cos(ang)*r
		y = math.sin(ang)*r
		shape[i] = mgCreateBox(b, length/2, width, thickness, x, y, 0, 0, 0, ang)
	end

	mgCreateHingeJoint(b, 0, 0, 0, 0, 0, 0, 1)
	if not drive then
		mgSetAngVel(b, 0, 0, speed)
	end
end

function tick()
	if beat or drive then
		mgRotate(b, 0, 0, getAngle(), 10, 10)
	end
	if not mgIsCleared() then
		broken = true
		for i=1, arms do
			if not mgShapeIsBroken(shape[i]) then
				broken = false
				break
			end
		end
		if broken then
			mgClear()
		end
	end
end


