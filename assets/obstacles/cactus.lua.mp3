function init()
	
	local scale = mgGetFloat("scale", 1.1)
	local cr, cg, cb = mgGetColor("color", 1, 1, 1)
	speed = mgGetColor("speed", 1)
	local t = mgGetFloat("thickness", 0.1)
	
	b = mgCreateBody(0, 0, 0)
--	mgShapeChamfer(0.02)
	mgMaterial("steel")
	mgDensity(100)
	mgCreateCylinder(b, 2*t+0.1, t, 0, 0.12, 0, 0, 0, 1.57)
	mgCreateHingeJoint(b, 0, 0, 0, 0, 0, 1, 0)
	mgMaterial("glass")
	mgColor(cr,cg,cb)
	mgDensity(0.7)
	mgForceLimit(0.4)
	mgHideEdges(true)
	mgCreateBox(b, t, 1.5*scale, t, 0, 1.5*scale+0.2, 0)
	mgCreateBox(b, t, 0.4*scale, t, -0.3*scale, 1.45*scale, 0, 0, 0, math.pi/4)
	mgCreateBox(b, t, 0.4*scale, t, 0.3*scale, 1.0*scale, 0, 0, 0, -math.pi/4)
	mgCreateBox(b, t, 0.5*scale, t, -0.56*scale, 2.22*scale-t*0.6, 0)
	mgCreateBox(b, t, 0.5*scale, t, 0.56*scale, 1.77*scale-t*0.6, 0)
end

function tick()
	mgRotate(b, 0, mgCameraDistance()*speed, 0)
end


