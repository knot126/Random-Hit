function getAngle()
	return mgCameraDistance()*1 - 1 - offset
end

function init()
	cr,cg,cb = mgGetColor("color", 1, 1, 1)
	mr,mg,mb = mgGetColor("metalcolor", 1, 1, 1)
	t = mgGetFloat("thickness", 0.1)
	l = mgGetFloat("height", 1.0)
	speed = mgGetFloat("speed", 1.0)
	offset = mgGetFloat("offset", 0)

	tmp, left, y, z = mgRaycast(0, 2, 0, -100, 0, 0)
	tmp, right, y, z = mgRaycast(0, 2, 0, 100, 0, 0)
	x0 = left 
	x1 = right

	angle = getAngle()
	b = mgCreateBody(0, 2, 0, angle*speed, 0, 0)

	j0 = mgCreateHingeJoint(b, 0, x0, 2, 0, 1, 0, 0)
	j1 = mgCreateHingeJoint(b, 0, x1, 2, 0, 1, 0, 0)

	mgMaterial("steel")
	left = mgCreateCylinder(b, 0.25, 0.1,  x0, 0, 0)
	right = mgCreateCylinder(b, 0.25, 0.1, x1, 0, 0)

	mgMaterial("glass")
	mgColor(cr, cg, cb)
	mgShapeChamfer(0)
	mgCreateBox(b, (-1.5-x0)/2, t, t, x0+(-1.5-x0)/2+t, 0, 0)
	mgCreateBox(b, (x1-1.5)/2, t, t, x1-(x1-1.5)/2-t, 0, 0)

	mgCreateBox(b, t, l/2-t, t, -1.5, l/2, 0)
	mgCreateBox(b, 0.5+t, t, t, -1, l, 0)

	mgCreateBox(b, t, l-t, t, -0.5, 0, 0)
	center = mgCreateBox(b, 0.5+t, t, t, 0, -l, 0)
	mgCreateBox(b, t, l-t, t, 0.5, 0, 0)

	mgCreateBox(b, 0.5+t, t, t, 1, l, 0)
	mgCreateBox(b, t, l/2-t, t, 1.5, l/2, 0)

	mgMaterial("steel")
	mgColor(mr, mg, mb)
	mgShapeChamfer(0.05)
	mgCreateCylinder(b, 0.3, 0.2, -1, l, 0)
	mgCreateCylinder(b, 0.3, 0.2, 1, l, 0)
	mgCreateCylinder(b, 0.3, 0.2, 0, -l, 0)
end


function tick()
	local angle = getAngle()

	local b0 = mgGetShapeBody(left)
	mgRotate(b0, angle*speed, 0, 0, 1)

	local b1 = mgGetShapeBody(right)
	mgRotate(b1, angle*speed, 0, 0, 1)
	
	local bc = mgGetShapeBody(center)
	if not mgIsCleared() and bc ~= b0 and bc ~= b1 then
		mgClear()
	end
end

