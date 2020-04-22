function init()
	cr,cg,cb = mgGetColor("color", 1, 1, 1)
	width = mgGetFloat("width", 2)
	height = mgGetFloat("height", 0.55)
	thickness = mgGetFloat("thickness", 0.1)
	strength = mgGetFloat("strength", 0.1)
	sx = mgGetFloat("scalex", 0.25)
	sy = mgGetFloat("scaley", 0.25)
	ox = mgGetFloat("offsetx", 0.25)
	oy = mgGetFloat("offsety", 0.07)

	b = mgCreateBody(0, height/2, 0)
	mgMaterial("glass")
	mgForceLimit(strength)
	mgShapeChamfer(0.02)
	mgRoundness(0.1)
	mgColor(cr, cg, cb)
	mgTexture(true, sx, -sy, ox, oy)
	mgCreateBox(b, width/2, height/2, thickness)

--	r0 = mgCreateRope(b, 0, -width/2, 1+height/2, 0, -width/2, 5, 0, -0.2)
--	r1 = mgCreateRope(b, 0, width/2, 1+height/2, 0, width/2, 5, 0, -0.2)
end


