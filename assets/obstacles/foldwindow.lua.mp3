function init()
	cr,cg,cb = mgGetColor("color", 1, 1, 1)
	distance = mgGetFloat("distance", 8)
	w = mgGetFloat("width", 3)
	angle = mgGetFloat("angle", -math.pi/2)
	height = mgGetFloat("height", 1.0)

	mgMaterial("steel")	
	mgMask(0)

	b = mgCreateBody(0, 0.1, 0, angle, 0, 0)
	mgCreateBox(b, w/2, 0.1, 0.05)

	mgMaterial("glass")
	mgColor(cr, cg, cb)

		mgCreateBox(b, w/2, height-0.1, 0.04, 0, height, 0)
		mgCreateHingeJoint(b, 0, 0, 0, 0, 1, 0, 0)
		mgRotate(b, angle, 0, 0, 100, 7)
	
	done = false
end

function tick()
	if mgCameraDistance() < distance and not done then
		mgRotate(b, 0, 0, 0, 100, 7)
		done = true
	end
	rx,ry,rz = mgGetRot(b)
	if not mgIsCleared() and not mgBodyContainsPoint(b, 0, 1, 0) then mgClear() end
end

