function getRot()
	return math.sin(offset + 2.0*mgTime())
end


function init()
	offset = math.random(0, 10)

	followBeat = mgGetBool("followbeat", false)
	cr,cg,cb = mgGetColor("color", 1, 1, 1)
	mr,mg,mb = mgGetColor("metalcolor", 1, 1, 1)
	dinglare = mgGetBool("dinglare", false)
	
	a = mgCreateBody()
	mgMaterial("steel")
	
	if dinglare then
		b = mgCreateBody(0, 3, 0, math.random(-1, 1), 0, math.random(-1, 1))
	else
		b = mgCreateBody(0, 3, 0, 0, 0, getRot())
	end

	mgMaterial("steel")
	mgColor(1,1,1)
	mgRoundness(1)
	mgShapeChamfer(0.05)
	mgCreateCylinder(b, 0.2, 0.06, 0, 0, 0, 0, 3.14159/2, 0)
	mgShapeChamfer(0)

	mgMaterial("glass")
	mgColor(cr,cg,cb)
	s = mgCreateBox(b, 0.1, 1, 0.05, 0, -1.15, 0)

	mgMaterial("steel")
	mgRoundness(1)
	mgColor(mr, mg, mb)
	mgShapeChamfer(0.05)
	--mgCreateBox(b, 0.8, 0.3, 0.2, 0, -2.4, 0)
	--mgColor(0.95, 0.93, 0.91)
	--mgCreateBox(b, 0.81, 0.21, 0.22, 0, -2.4, 0)
	mgCreateCylinder(b, 0.3, 0.8, 0, -2.4, 0)

	if dinglare then
		mgCreateBallJoint(b, 0, 0, 3, 0, 0, 0, 1)
		mgSetVel(b, 0, 0, 2)
	else
		mgCreateHingeJoint(b, 0, 0, 3, 0, 0, 0, 1)
	end
end

function tick()
	if not dinglare then
		if followBeat then
			mgRotate(b, 0, 0, 1.5*math.sin(mgTime()/17.4*16*math.pi), 10.0, 10)
		else
			mgRotate(b, 0, 0, getRot())
		end
	end
	if mgShapeIsBroken(s) and not done then
		mgClear()
		done = true
	end
end

