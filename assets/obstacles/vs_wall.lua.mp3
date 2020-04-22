function init()
	cr,cg,cb = mgGetColor("color", 1, 1, 1)
	height = mgGetFloat("height", 2.0)
	thickness = mgGetFloat("thickness", 0.02)
	radius = mgGetFloat("radius", 0.2)
	glass = mgGetFloat("glass", 3.0)
	metal = mgGetFloat("metal", 0.3)

	b = mgCreateBody(0, 0, 0)
	mgMaterial("steel")
	mgRoundness(1)
	mgShapeChamfer(0.1)
	mgCreateCylinder(b, radius, height/2+0.1, 0, 0, 0, 0, 0, 1.57)

	mgShapeChamfer(0)

	if glass > 0 then
		mgMaterial("metal")
		mgCreateBox(b, metal/2, height/2, thickness, glass+metal/2+radius, 0, 0, 0, 0, ang)
	end

	if glass > 0 then
		mgMaterial("glass")
		mgColor(cr,cg,cb)
		mgCreateBox(b, glass/2, height/2, thickness, glass/2+radius, 0, 0, 0, 0, ang)
	end


	mgCreateHingeJoint(b, 0, 0, 0, 0, 0, 1, 0)
end

function tick()
end


