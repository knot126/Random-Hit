function init()
	local sides = mgGetInt("sides", 5)
	local cr,cg,cb = mgGetColor("color", 1, 1, 1)
	local size = mgGetFloat("size", 1)
	local thickness = mgGetFloat("thickness", 0.02)
	local strength = mgGetFloat("strength", 0.1)
	local plate = mgGetBool("plate", false)
	local stiffness = mgGetFloat("stiffness", 0.2)
	local raycast = mgGetBool("raycast", true)
	local maxRope = mgGetFloat("ropelength", 8)

	b = mgCreateBody(0, 0, 0)
	mgMaterial("glass")
	mgForceLimit(strength)
	mgColor(cr, cg, cb)

	local mesh = sides .. "gon"
	mgShapeScale(size, size, thickness)
	mgCreateMesh(b, mesh)

	for i=0, sides-1 do
		local angle = i*math.pi*2/sides
		x0 = math.cos(angle)*size
		y0 = math.sin(angle)*size
		x1 = math.cos(angle)*maxRope
		y1 = math.sin(angle)*maxRope
		if raycast then
			local b,x,y,z = mgRaycast(x0, y0, 0, x1, y1, 0, 128)
			if b then
				x1 = x
				y1 = y
			end
		end
		mgCreateRope(b, 0, x0, y0, 0, x1, y1, 0, -stiffness)
	end
end
