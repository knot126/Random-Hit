
function getAngle()
	ang = math.pi/4*mgGetBeat(0.3)
	if reverse then ang = -ang end
	return ang
end

function init()
	cr,cg,cb = mgGetColor("color", 1, 1, 1)
	reverse = mgGetBool("reverse", false)
	size = mgGetFloat("size", 0.2)

	mgMaterial("steel")
	rotor = mgCreateBody(0, 1.5, 0, 0, 0, getAngle())
	mgStatic(0)
	mgShapeChamfer(0.01)
	mgRoundness(0.4)
	mgColor(.7, .7, .7)
	mgCreateCylinder(rotor, 0.15, 0.05, 0, 0, 0, 0, math.pi/2, 0)
	mgMaterial("glass")
	mgColor(cr, cg, cb)
	mgShapeChamfer(0)
	mgRoundness(0.4)
	mgCreateCylinder(rotor, size*1.4, 0.04, 0, 0, 0, 0, math.pi/2, 0)
	mgRoundness(0.2)
	mgCreateBox(rotor, 0.42, size, 0.02, 0.6, 0, 0)
	mgCreateBox(rotor, 0.42, size, 0.02, -0.6, 0, 0)
	mgCreateBox(rotor, size, 0.42, 0.02, 0, 0.6, 0)
	mgCreateBox(rotor, size, 0.42, 0.02, 0, -0.6, 0)
end


function tick()
	mgMove(rotor, 0, 1.5, 0)
	mgRotate(rotor, 0, 0, getAngle(), 0.5, 5)
end

