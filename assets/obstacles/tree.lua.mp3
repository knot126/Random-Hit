function init()
	local cr,cg,cb = mgGetColor("color", 1, 1, 1)
	
	local t = mgGetFloat("thickness", 0.1)
	local r1 = mgGetFloat("r1", 0.3)
	local h1 = mgGetFloat("h1", 0.4)
	local w1 = mgGetFloat("w1", 2.0)
	local h2 = mgGetFloat("h2", 0.4)
	local r2 = mgGetFloat("r2", 0.3)
	local w2 = mgGetFloat("w2", 1.2)
	local h3 = mgGetFloat("h3", 0.4)
	vel1 = mgGetFloat("vel1", 1)
	vel2 = mgGetFloat("vel2", -1)
	vel3 = mgGetFloat("vel3", -2)

	local y = 0

	mgMaterial("steel")
	mgStatic(1)

	s = mgCreateBody(0, 0, 0)
	mgCreateCylinder(s, r1+t, t, 0, y-t, 0, 0, 0, 1.57)

	mgStatic(0)

	mgMaterial("glass")
	mgDensity(30)
	mgColor(cr,cg,cb)

	b = mgCreateBody(0, 0, 0)
	
	--mgCreateCylinder(b, r1, t, 0, y, 0, 0, 0, 1.57)

	y = y - h1
	mgCreateBox(b, t, h1, t, 0, y, 0)
	--mgCreateCylinder(b, t, h1, 0, -h1-t, 0, 0, 0, 1.57)

	mgMaterial("steel")
	mgDensity(50)
	y = y - h1 - t
	mgCreateCylinder(b, t, w1, 0, y, 0, 0, 0, 0)
	mgCreateCylinder(b, 0.25, t+0.02, 0, y, 0, 0, 0, 1.57)
	mgCreateCylinder(b, 0.25, t+0.02, w1-t, y, 0, 0, 0, 1.57)
	mgCreateCylinder(b, 0.25, t+0.02, -w1+t, y, 0, 0, 0, 1.57)
	--mgCreateBox(b, w1, t, t, 0, y)

	mgMaterial("glass")
	mgDensity(10)
	mgColor(cr,cg,cb)

	y = y - h2 - t
	mgCreateBox(b, t, h2, t, -w1+t, y, 0)
	mgCreateBox(b, t, h2, t, w1-t, y, 0)

	y = y - h2 - t

	bl = mgCreateBody(-w1+t, y, 0)
	br = mgCreateBody(w1-t, y, 0)

	mgMaterial("steel")
	mgCreateCylinder(bl, r2, t+0.02, 0, 0, 0, 0, 0, 1.57)
	mgCreateCylinder(br, r2, t+0.02, 0, 0, 0, 0, 0, 1.57)
	mgCreateHingeJoint(b, bl, -w1+t, y, 0, 0, 1, 0)
	mgCreateHingeJoint(b, br, w1-t, y, 0, 0, 1, 0)

	mgMaterial("glass")
	mgColor(cr,cg,cb)
	y = y - t*2
	mgCreateBox(bl, w2, t, t, 0, 0, 0)
	mgCreateBox(br, w2, t, t, 0, 0, 0)
	
	mgMaterial("steel")
	mgShapeChamfer(0.05)
	mgCreateCylinder(bl, r2, h3, -w2, 0, 0, 0, 0, 1.57)
	mgCreateCylinder(bl, r2, h3, w2, 0, 0, 0, 0, 1.57)
	mgCreateCylinder(br, r2, h3, -w2, 0, 0, 0, 0, 1.57)
	mgCreateCylinder(br, r2, h3, w2, 0, 0, 0, 0, 1.57)


	j = mgCreateHingeJoint(s, b, 0, 0, 0, 0, 1, 0)
end

function tick()
	mgSetAngVel(b, 0, vel1, 0)
	mgSetAngVel(br, 0, vel2, 0)
	mgSetAngVel(bl, 0, vel3, 0)
end


