function init()
	local cr,cg,cb = mgGetColor("color", 1, 1, 1)
	local width = mgGetFloat("width", 2)
	local height = mgGetFloat("height", 2)
	local thickness = mgGetFloat("thickness", 0.02)
	local strength = mgGetFloat("strength", 0.1)
	local plate = mgGetBool("plate", false)
	local perpendicular = mgGetBool("perpendicular", false)

	b = mgCreateBody(0, 2, 0)
	mgMaterial("glass")
	mgForceLimit(strength)
	mgColor(cr, cg, cb)
	
	if plate then
		mgCreateBox(b, width/2, height/8, thickness, 0, 3*height/8, 0)
		mgCreateBox(b, width/2, height/8, thickness, 0, -3*height/8, 0)
		mgCreateBox(b, width/8, height/4, thickness, -3*height/8, 0, 0)
		mgCreateBox(b, width/8, height/4, thickness, 3*height/8, 0, 0)

		mgMaterial("steel")
		mgShapeChamfer(0.03)
		mgCreateBox(b, width/2*0.5, height/2*0.5, thickness+0.03)
	else
		mgCreateBox(b, width/2, height/2, thickness)
	end

	if perpendicular then
		local tmp,x,y,z = mgRaycast(-width/2, 2-height/2, 0, -width/2, 2-height/2, -100)
		r0 = mgCreateRope(b, 0, -width/2, 2-height/2, 0, x, y, z, -0.2)
		tmp,x,y,z = mgRaycast(-width/2, 2+height/2, 0, -width/2, 2+height/2, -100)
		r1 = mgCreateRope(b, 0, -width/2, 2+height/2, 0, x, y, z, -0.2)
		tmp,x,y,z = mgRaycast(width/2, 2-height/2, 0, width/2, 2-height/2, -100)
		r2 = mgCreateRope(b, 0, width/2, 2-height/2, 0, x, y, z, -0.2)
		tmp,x,y,z = mgRaycast(width/2, 2+height/2, 0, width/2, 2+height/2, -100)
		r3 = mgCreateRope(b, 0, width/2, 2+height/2, 0, x, y, z, -0.2)
	else
		r0 = mgCreateRope(b, 0, -width/2, 2-height/2, 0, -2.6, 1, 0, -0.2)
		r1 = mgCreateRope(b, 0, -width/2, 2+height/2, 0, -2.6, 3, 0, -0.2)
		r2 = mgCreateRope(b, 0, width/2, 2-height/2, 0, 2.6, 1, 0, -0.2)
		r3 = mgCreateRope(b, 0, width/2, 2+height/2, 0, 2.6, 3, 0, -0.2)
	end
end

function tick()
	b0 = mgGetJointBodies(r0)
	b1 = mgGetJointBodies(r1)
	b2 = mgGetJointBodies(r2)
	b3 = mgGetJointBodies(r3)
	if not mgIsCleared() and not (b0 == b2 or b0 == b3 or b1 == b2 or b1 == b3) then
		mgClear()
	end
end

