function init()
	cr,cg,cb = mgGetColor("color", 1, 1, 1)
	w = mgGetFloat("width", 1)
	h = mgGetFloat("height", 2)
	hinge = mgGetBool("hinge", true)
	arms = mgGetInt("arms", 4)
	
	b = mgCreateBody(0, 1, 0)

	tmp, left, y, z = mgRaycast(-w/2, 0, 0, -100, 0, 0)
	tmp, right, y, z = mgRaycast(w/2, 0, 0, 100, 0, 0)
	t = 0.02

	mgMaterial("steel")
	mgRoundness(0.4)
	center = mgCreateBody(0, 0, 0)
	mgDensity(0.5)
	mgShapeChamfer(0.05)
	mgCreateCylinder(center, w/2, h/2, 0, 0, 0, 0, 0, 1.57)
	mgShapeChamfer(0)

	local spread = h/(arms/2)
	for i=1,arms/2 do
		local y =  (i-arms/4-0.5)*spread
		for side=1,2 do
			local mult = -1
			local offset = left
			if side == 2 then mult = 1 offset = right end 
			b2 = mgCreateBody(0, y, 0)
			mgMaterial("steel")
			mgDensity(100)
			mgCreateBox(b2, 0.1, 0.1+t, 0.05+t, offset, 0, 0)
			mgCreateHingeJoint(0, b2, offset, y, 0, 0, 1, 0)
			mgMaterial("steel")
			mgCreateBox(b2, 0.1, 0.1+t, 0.05+t, (w/2+0)*mult, 0, 0)
			if hinge then
				mgCreateHingeJoint(center, b2, mult*(w/2+0), y, 0, 0, 1, 0)
			else
				mgCreateBallJoint(center, b2, mult*(w/2+0), y, 0)
			end
			mgMaterial("glass")
			mgColor(cr, cg, cb)
			tmp = (math.abs(offset)-w/2-0.1)/2
			mgCreateBox(b2, tmp, 0.1, 0.05, mult*(tmp+w/2), 0, 0)
		end
	end
end
