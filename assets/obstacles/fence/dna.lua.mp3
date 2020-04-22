function init()
	local cr,cg,cb = mgGetColor("color", 1,1,1)
	local t = mgGetFloat("thickness", 0.05)
	local c = mgGetInt("segments", 8)
	offset = mgGetFloat("offset", 0)
	distance = mgGetFloat("distance", 10)
	
	b = mgCreateBody(0, 0, 0)

	local left = -t-c/2*0.6
	local right = t+(c+2)/2*0.6
	mgMaterial("steel")
	s0 = mgCreateCylinder(b, 0.4, t, left, 0, 0)
	s1 = mgCreateCylinder(b, 0.4, t, right, 0, 0)

	mgMaterial("glass")
	mgColor(cr,cg,cb)
	mgMask(64)
	for i=0, c do
		local ang = i*0.7
		local x = i*0.6 - c/2*0.6
		mgCreateBox(b, t, 0.3, t, x, 0, 0, ang, 0, 0)
		mgCreateBox(b, 0.33, t, t, x+0.3, math.cos(ang+0.35)*0.3, math.sin(ang+0.35)*0.3, ang, -0.3, -0.15)
		mgCreateBox(b, 0.33, t, t, x+0.3, -math.cos(ang+0.35)*0.3, -math.sin(ang+0.35)*0.3, ang, 0.3, 0.15)
	end
end

function tick()
	if mgIsCleared() then return end

	local t = mgTime()
	d = mgCameraDistance()
	
	local y = math.sin(t+offset)
	local b0 = mgGetShapeBody(s0)
	local b1 = mgGetShapeBody(s1)
	mgMove(b0, 0, y, -distance+d)
	mgRotate(b0, t, 0, 0)
	mgMove(b1, 0, y, -distance+d)
	mgRotate(b1, t, 0, 0)

	if not mgHasBoss() then
		mgClear()
		mgReleaseMotion(b0)
		mgReleaseMotion(b1)
		return
	end

end


