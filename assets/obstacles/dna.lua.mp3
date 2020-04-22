function init()
	local cr,cg,cb = mgGetColor("color", 1,1,1)
	local t = mgGetFloat("thickness", 0.05)
	local c = mgGetInt("segments", 12)
	
	b = mgCreateBody(0, 0, 0)

	local left = -t-c/2*0.6
	local right = t+(c+2)/2*0.6
	mgMaterial("steel")
	mgCreateCylinder(b, 0.4, t, left, 0, 0)
	mgCreateCylinder(b, 0.4, t, right, 0, 0)

	mgMaterial("glass")
	mgColor(cr,cg,cb)
	for i=0, c do
		local ang = i*0.7
		local x = i*0.6 - c/2*0.6
		mgCreateBox(b, t, 0.3, t, x, 0, 0, ang, 0, 0)
		mgCreateBox(b, 0.33, t, t, x+0.3, math.cos(ang+0.35)*0.3, math.sin(ang+0.35)*0.3, ang, -0.3, -0.15)
		mgCreateBox(b, 0.33, t, t, x+0.3, -math.cos(ang+0.35)*0.3, -math.sin(ang+0.35)*0.3, ang, 0.3, 0.15)
	end
	
	mgCreateHingeJoint(b, 0, left, 0, 0, 1, 0, 0)
	mgCreateHingeJoint(b, 0, right, 0, 0, 1, 0, 0)
end

function tick()
	mgSetAngVel(b, 1, 0, 0)
end

