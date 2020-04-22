function getHeight()
	if movable then
		return math.sin((mgCameraDistance()-0.2+offset)*speed)*move
	else
		return 0
	end
end

function init()
	thickness = mgGetFloat("thickness", 0.03)
	height = mgGetFloat("height", 0.5)
	blocker = mgGetBool("blocker", false)
	cr,cg,cb = mgGetColor("color", 1, 1, 1)
	local mr,mg,mb = mgGetColor("metalcolor", 1, 1, 1)
	move = mgGetFloat("move", 0)
	offset = mgGetFloat("offset", 0)
	speed = mgGetFloat("speed", 1)
	maxWidth = mgGetFloat("maxwidth", 10)
	local row = mgGetInt("row", 1)
	local col = mgGetInt("col", 1)
	
	movable = move > 0
	
	tmp, left, y, z = mgRaycast(0, 0, 0, -maxWidth*0.5, 0, 0)
	tmp, right, y, z = mgRaycast(0, 0, 0, maxWidth*0.5, 0, 0)

	width = (right-left)/2
	off = (left+right)/2
	
	mgMaterial("glass")
	mgColor(cr, cg, cb)
--	mgForceLimit(0.2)
	body = mgCreateBody(0, getHeight(), 0)
	local sx = 0.18
	local sy = 0.18
	local ox = 0.25 + col*0.5
	local oy = 0.05 + row*0.125
	mgTexture(true, sx, -sy, ox, oy)
	mgCreateBox(body, 1.5, height, thickness, off, 0, 0)
	mgMaterial("steel")
	mgColor(mr,mg,mb)
	if movable then
		mgStatic(2)
	else
		mgStatic(1)
	end
	local w = (width-3)/2
	s1 = mgCreateBox(body, w, height+0.05, thickness+0.05, -1.5-w, 0, 0)
	s2 = mgCreateBox(body, w, height+0.05, thickness+0.05, 1.5+w, 0, 0)

	if blocker then
		mgStatic(0)
		mgShapeChamfer(0.05)
		cyl = mgCreateCylinder(body, thickness+0.2, 0.5, off, 0, 0)
	end
end


function tick()
	if movable then
		local y = getHeight()
		local b1 = mgGetShapeBody(s1)
		local b2 = mgGetShapeBody(s2)
		mgMove(b1, 0, y, 0)
		if b2 ~= b1 then
			mgMove(b2, 0, y, 0)
		end
		if cyl then
			local b3 = mgGetShapeBody(cyl)
			if b3 ~= b1 and b3 ~= b2 then
				mgReleaseMotion(b3)
			end
		end
	end
end

