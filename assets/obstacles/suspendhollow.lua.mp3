function init()
	
	
	local t = mgGetFloat("thickness", 0.02)
	local sx = mgGetFloat("sx", 2.0)	
	local sy = mgGetFloat("sy", 0.5)	
	local sz = mgGetFloat("sz", 0.5)	
	local h = 2
	local box = mgGetBool("box", false)
	
	b = mgCreateBody(0, h, 0)
	mgMaterial("steel")

	mgMaterial("glass")
	mgColor(1,1,1)
--	mgForceLimit(0.05)
	if box then
		mgCreateBox(b, sx, sy, t, 0, 0, -sz)
		mgCreateBox(b, sx, sy, t, 0, 0, sz)
		mgCreateBox(b, sx, t, sz, 0, sy, 0)
		mgCreateBox(b, sx, t, sz, 0, -sy, 0)
		mgCreateBox(b, t, sy, sz, sx, 0, 0)
		mgCreateBox(b, t, sy, sz, -sx, 0, 0)
	else
		mgShapeScale(sx, sy, sz)
		mgCreateMesh(b, "triangle", 0, 0, 0)
		mgCreateMesh(b, "triangle", 0, 0, 0, math.pi/2, 0, 0)
		mgCreateMesh(b, "triangle", 0, 0, 0, math.pi, 0, 0)
		mgCreateMesh(b, "triangle", 0, 0, 0, -math.pi/2, 0, 0)
		mgCreateMesh(b, "triangle2", 0, 0, 0)
		mgCreateMesh(b, "triangle2", 0, 0, 0, math.pi/2, 0, 0)
		mgCreateMesh(b, "triangle2", 0, 0, 0, math.pi, 0, 0)
		mgCreateMesh(b, "triangle2", 0, 0, 0, -math.pi/2, 0, 0)
	end

	mgCreateRope(b, 0, -sx, h, 0, -5, h+1, 0, -0.1)
--	mgCreateRope(b, 0, -s, s*2+s, -s, -s*2, s*2+3, -s*2, -0.1)
	mgCreateRope(b, 0, sx, h, 0, 5, h+1, 0, -0.1)
--	mgCreateRope(b, 0, s, s*2+s, -s, s*2, s*2+3, -s*2, -0.1)
	
end


