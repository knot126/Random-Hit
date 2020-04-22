function init()
	
	b = mgCreateBody(0, 0, 0)

	local cr,cg,cb = mgGetColor("color", 1, 1, 1)
	local w = mgGetFloat("size", 1)
	local t = mgGetFloat("thickness", 0.1)
	local r = mgGetFloat("radius", 0.2)
	vx = mgGetFloat("vx", 1)
	vy = mgGetFloat("vy", 2)
	vz = mgGetFloat("vz", 1)
	
	mgMaterial("steel")
	mgShapeChamfer(0.03)
	mgCreateBox(b, r, r, r)

	mgShapeChamfer(0)
	mgMaterial("glass")
	mgColor(cr, cg, cb)
	mgCreateBox(b, w/2, t, t, -w/2-r)
	mgCreateBox(b, w/2, t, t, w/2+r)
	mgCreateBox(b, t, w/2, t, 0, -w/2-r)
	mgCreateBox(b, t, w/2, t, 0, w/2+r)
	mgCreateBox(b, t, t, w/2, 0, 0, -w/2-r)
	mgCreateBox(b, t, t, w/2, 0, 0, w/2+r)

	mgShapeChamfer(0.03)
	mgMaterial("steel")
	box = {}
	box[1] = mgCreateBox(b, r, r, r, -w-r)
	box[2] = mgCreateBox(b, r, r, r, w+r)
	box[3] = mgCreateBox(b, r, r, r, 0, -w-r)
	box[4] = mgCreateBox(b, r, r, r, 0, w+r)
	box[5] = mgCreateBox(b, r, r, r, 0, 0, -w-r)
	box[6] = mgCreateBox(b, r, r, r, 0, 0, w+r)

	mgCreateBallJoint(0, b, 0, 0, 0)
end

function tick()
	mgSetAngVel(b, vx, vy, vz)
	for i=1,6 do
		if mgGetShapeBody(box[i]) ~= b then
			mgSetShapeMask(box[i], 255, 32)
		end
	end
end
