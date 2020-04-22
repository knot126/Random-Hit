function init()
	local cr,cg,cb = mgGetColor("color", 1, 1, 1)
	local width = mgGetFloat("width", 2)
	local height = mgGetFloat("height", 1)
	local depth = mgGetFloat("depth", 0.3)
	
	local vx = mgGetFloat("vx", 0)
	if mgGetString("vx", "")=="rnd" then vx = mgRndFloat(-3.0, 3.0) end
	local vz = mgGetFloat("vz", 0)
	if mgGetString("vz", "")=="rnd" then vz = mgRndFloat(-3.0, 3.0) end
	
	local rot = mgGetFloat("rot", 0)
	if mgGetString("rot", "")=="rnd" then rot = mgRndFloat(-3.0, 3.0) end

	tmp, x, roof, z = mgRaycast(0, 1, 0, 0, 100, 0)
	
	b = mgCreateBody(0, 2, 0)
	mgMaterial("glass")
	mgColor(cr, cg, cb)
	mgShapeChamfer(0.02)
	mgDensity(.25)
	mgForceLimit(0.1)
	mgCreateBox(b, width/2, height/2, depth/2)

	r0 = mgCreateRope(b, 0, 0, 2.5, 0, 0, roof, 0, 0.5)
	
	mgSetVel(b, vx, 0, vz)
	mgSetAngVel(b, 0, rot, 0)
end

function tick()
	b0 = mgGetJointBodies(r0)
end

