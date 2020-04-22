function init()
	cr,cg,cb = mgGetColor("color", 1, 1, 1)
	mr,mg,mb = mgGetColor("metalcolor", 1, 1, 1)
	w = mgGetFloat("width", 3)

	b = mgCreateBody(0, 1, 0)

	tmp, x, y, z = mgRaycast(0, 1, 0, 0, 100, 0)
	h = y-1
	t = 0.05

	mgMaterial("steel")
	mgStatic(1)
	top = mgCreateBox(b, w/2, t, 2*t, 0, h-t, 0)

	b2 = mgCreateBody(0, 1, 0)
	mgMaterial("glass")
	mgColor(cr, cg, cb)
	mgCreateBox(b2, 0.1, (h-0.4)/2-0.1, t/2, -w/2+0.5, (h+0.4)/2-0.1, 0)
	mgCreateBox(b2, 0.1, (h-0.4)/2-0.1, t/2, w/2-0.5, (h+0.4)/2-0.1, 0)
	mgMaterial("steel")
	mgCreateBox(b2, 0.15, 0.1, t*2, -w/2+0.5, (h-0.2), 0)
	mgCreateBox(b2, 0.15, 0.1, t*2, w/2-0.5, (h-0.2), 0)

	mgCreateHingeJoint(b, b2, -w/2+0.5, 1+h-0.2, 0, 1, 0, 0)
	mgCreateHingeJoint(b, b2, w/2-0.5, 1+h-0.2, 0, 1, 0, 0)
	
	mgMaterial("steel")
	mgColor(mr, mg, mb)
	mgShapeChamfer(0.05)
	mgRoundness(1)
	b3 = mgCreateBody(0, 1, 0)

	bottom = mgCreateCylinder(b3, 0.5, w/2)

	mgCreateBallJoint(b2, b3, -w/2+0.5, 1+0.4, 0, 1, 0, 0)
	mgCreateBallJoint(b2, b3, w/2-0.5, 1+0.4, 0, 1, 0, 0)
end


function tick()
	if not mgIsCleared() and not mgIsConnected(b2, b3) then
		mgClear()
	end
end

