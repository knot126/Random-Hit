function getAngle()
	if beat then
		return math.pi*2/bars*math.floor(mgGetBeat(0.45)/2)
	else
		return 0
	end
end

function init()
	local r = mgGetFloat("radius", 0.8)
	local t = mgGetFloat("thickness", 0.05)
	local w = mgGetFloat("width", 4)
	local bt = mgGetFloat("barthickness", 0.08)
	local cr,cg,cb = mgGetColor("color", 1,1,1)
	bars = mgGetInt("bars", 8)
	beat = mgGetBool("followbeat", false)

	b = mgCreateBody(0, 0, 0, getAngle(), 0, 0)
	mgMaterial("steel")
	mgDensity(100)
	s0 = mgCreateCylinder(b, r, t, -w/2, 0, 0)
	s1 = mgCreateCylinder(b, r, t, w/2, 0, 0)
	mgCreateCylinder(b, t, 1, -w/2-1, 0, 0)
	mgCreateCylinder(b, t, 1, w/2+1, 0, 0)

	mgMaterial("glass")
	mgColor(cr,cg,cb)

	for i=1,bars do
		local ang = (i-1)*math.pi*2/bars
		local y = math.sin(ang)*(r-t*1.2)
		local z = math.cos(ang)*(r-t*1.2)
		mgCreateBox(b, w/2-t, bt, t, 0, y, z, -ang, 0, 0)
	end

	mgCreateHingeJoint(b, 0, -w/2, 0, 0, 1, 0, 0)
	mgCreateHingeJoint(b, 0, w/2, 0, 0, 1, 0, 0)
	
	mgSetAngVel(b, 1, 0, 0)
end

function tick()
	if beat then
		mgRotate(mgGetShapeBody(s0), getAngle(), 0, 0, 3, 5)
		mgRotate(mgGetShapeBody(s1), getAngle(), 0, 0, 3, 5)
	end
end

