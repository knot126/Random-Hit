function init()
	local cr, cg, cb = mgGetColor("color", 1, 1, 1)
	local speed = mgGetFloat("speed", 1.1)
	local s = mgGetFloat("size", 0.5)
	local t = mgGetFloat("thickness", 0.05)

	b = mgCreateBody(0, s*2+4*t, 0, 0.85, 0.75, 0)
	mgMaterial("steel")
	mgDensity(100)
	mgCreateBox(b, 2*t, 2*t, 2*t, -s-t, -s-t, s+t)

	mgMaterial("glass")
	mgColor(cr,cg,cb)
	mgDensity(0.7)
	mgCreateBox(b, s, t, t, 0, s+t, -s-t)
	mgCreateBox(b, s, t, t, 0, s+t, s+t)
	mgCreateBox(b, s, t, t, 0, -s-t, s+t)
	mgCreateBox(b, s, t, t, 0, -s-t, -s-t)

	mgCreateBox(b, t, s+2*t, t, -s-t, 0, s+t)
	mgCreateBox(b, t, s+2*t, t, s+t, 0, s+t)
	mgCreateBox(b, t, s+2*t, t, s+t, 0, -s-t)
	mgCreateBox(b, t, s+2*t, t, -s-t, 0, -s-t)

	mgCreateBox(b, t, t, s, -s-t, -s-t, 0)
	mgCreateBox(b, t, t, s, s+t, -s-t, 0)
	mgCreateBox(b, t, t, s, s+t, s+t, 0)
	mgCreateBox(b, t, t, s, -s-t, s+t, 0)
	
	mgCreateHingeJoint(0, b, 0, 0, 0, 0, 1, 0)
	mgSetAngVel(b, 0, speed, 0)
end


