function getRot()
	return mgCameraDistance()*speed-offset
 end

function init()
	cr,cg,cb = mgGetColor("color", 1, 1, 1)
	height = mgGetFloat("height", 2)
	width = mgGetFloat("width", 3)
	speed = mgGetFloat("speed", 1)
	offset = mgGetFloat("offset", 0)

	t = 0.05
	body = mgCreateBody(0, 0, 0, 0, getRot(), 0)
	mgMaterial("steel")
	mgShapeChamfer(0.01)
	mgRoundness(1)
	s1 = mgCreateCylinder(body, 0.2, t+0.01, 0, t, 0, 0, 0, 1.57)
	s2 = mgCreateCylinder(body, 0.2, t+0.01, 0, height-t, 0, 0, 0, 1.57)
	mgRoundness(0)
	mgCreateBox(body, width/2, t, t, 0, t, 0)
	mgCreateBox(body, width/2, t, t, 0, height-t, 0)
	mgShapeChamfer(0)

	mgMaterial("glass")
	mgColor(cr, cg, cb)
	
	plateWidth = 0.4
	mgCreateBox(body, plateWidth, height/2-2*t, 0.02, -width/2+plateWidth+0.02, height/2, 0)
	mgCreateBox(body, plateWidth, height/2-2*t, 0.02, width/2-plateWidth-0.02, height/2, 0)
	mgCreateHingeJoint(body, 0, 0, 0, 0, 0, 1, 0)
	mgCreateHingeJoint(body, 0, 0, height, 0, 0, 1, 0)
end

function tick()
	b1 = mgGetShapeBody(s1)
	b2 = mgGetShapeBody(s2)

	mgRotate(mgGetShapeBody(s1), 0, getRot(), 0, 10, 10)
	--	mgSetAngVel(mgGetShapeBody(s2), 0, speed, 0)

	if not mgIsCleared() then
		broken = false
		if broken then
			mgClear()
		end
	end
end


