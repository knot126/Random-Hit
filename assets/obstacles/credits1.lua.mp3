function getRot()
	return mgCameraDistance()*speed-offset
 end

function init()
	cr,cg,cb = mgGetColor("color", 1, 1, 1)
	height = mgGetFloat("height", 2)
	width = mgGetFloat("width", 3)
	speed = mgGetFloat("speed", -1)
	offset = mgGetFloat("offset", 0)
	local row1 = mgGetInt("row1", 0)
	local col1 = mgGetInt("col1", 0)
	local row2 = mgGetInt("row2", 0)
	local col2 = mgGetInt("col2", 0)
	
	t = 0.05
	body = mgCreateBody(0, 0, 0, getRot(), 0, 0)
	mgMaterial("steel")
	mgShapeChamfer(0.01)
	s1 = mgCreateCylinder(body, 0.2, t+0.01, -width/2+t, 0, 0, 0, 0, 0)
	s2 = mgCreateCylinder(body, 0.2, t+0.01, width/2-t, 0, 0,0, 0, 0)
	mgCreateBox(body, t, height/2, t, -width/2+t, 0, 0)
	mgCreateBox(body, t, height/2, t, width/2-t, 0, 0)
	mgShapeChamfer(0)

	mgMaterial("glass")
	mgColor(cr, cg, cb)
	
	plateWidth = 0.4
	local sx = 0.18
	local sy = 0.18
	local ox = 0.25 + col1*0.5
	local oy = -0.84 + row1*0.125
	mgTexture(true, sx, -sy, ox, oy)
	mgCreateBox(body, width/2-t, plateWidth, 0.02, 0, height/2-plateWidth-t, 0)
	sx = 0.18
	sy = 0.18
	ox = 0.25 + col2*0.5
	oy = -0.05 + row2*0.125
	mgTexture(true, sx, -sy, ox, oy)
	mgCreateBox(body, width/2-t, plateWidth, 0.02, 0, -height/2+plateWidth+t, 0)
	mgCreateHingeJoint(body, 0, -width/2, 0, 0, 1, 0, 0)
	mgCreateHingeJoint(body, 0, width/2, 0, 0, 1, 0, 0)
end

function tick()
	b1 = mgGetShapeBody(s1)
	b2 = mgGetShapeBody(s2)

	mgRotate(mgGetShapeBody(s1), getRot(), 0, 0, 10, 10)
	--	mgSetAngVel(mgGetShapeBody(s2), 0, speed, 0)

	if not mgIsCleared() then
		broken = false
		if broken then
			mgClear()
		end
	end
end


