function hollowDisc(body, r, t)
	local seg = 24
	local mesh = "circleseg"
	if hexagon then
		seg=6
		mesh = "circleseg6"
	end
	mgHideEdges(true)
	mgShapeScale(r, r, t)
	for i=1, seg do
		local ang = (i-1)/seg*math.pi*2
		mgCreateMesh(body, mesh, 0, 0, 0, 0, 0, ang)
	end
	mgShapeScale(1,1,1)
end

function init()
	local outer = mgGetFloat("radius", 1)
	local inner = outer*0.7
	local t = mgGetFloat("thickness", 0.05)
	local cylr = mgGetFloat("cylradius", 0.04)
	local hollow = mgGetBool("hollow", false)
	local glass = mgGetBool("glass", false)
	local cr,cg,cb = mgGetColor("color", 1,1,1)
	local sr,sg,sb = mgGetColor("steelcolor", 1,1,1)
	hexagon = mgGetBool("hexagon", false)
	
	mgMaterial("glass")
	mgColor(cr,cg,cb)
	b1 = mgCreateBody(0, outer, 0)
	hollowDisc(b1, outer, t)
	mgMaterial("steel")
	mgColor(sr,sg,sb)

	mgCreateCylinder(b1, cylr, 0.1, 0, inner+0.1, 0, 0, 0, 1.57)
	mgCreateCylinder(b1, cylr, 0.1, 0, -inner-0.1, 0, 0, 0, 1.57)

	mgDensity(100)
	local extra = 0
	if hexagon then extra = outer*0.1 end
	mgCreateCylinder(b1, cylr, 0.2+extra, -outer-0.1, 0, 0)
	mgCreateCylinder(b1, cylr, 0.2+extra, outer+0.1, 0, 0)

	if glass then
		mgMaterial("glass")
		mgColor(cr,cg,cb)
	else
		mgMaterial("steel")
		mgColor(sr,sg,sb)
	end
	b2 = mgCreateBody(0, outer, 0)
	if hollow then
	hollowDisc(b2, inner, t)
	else
		if hexagon then
			mgShapeScale(inner, inner, t)
			mgCreateMesh(b2, "6gon", 0, 0, 0, 0, 0, math.pi/6)
			mgShapeScale(1, 1, 1)
		else
			mgCreateCylinder(b2, inner, t, 0, 0, 0)
		end
	end
	
	mgCreateHingeJoint(b1, 0, -outer-0.1, outer, 0, 1, 0, 0)
	mgCreateHingeJoint(b1, 0, outer+0.1, outer, 0, 1, 0, 0)

	mgCreateHingeJoint(b1, b2, 0, -(outer+inner)*0.5+outer, 0, 0, 1, 0)
	mgCreateHingeJoint(b1, b2, 0, (outer+inner)*0.5+outer, 0, 0, 1, 0)
	
	mgSetAngVel(b1, 3, 0, 0)
	mgSetAngVel(b2, 3, -2.9, 0)
end


