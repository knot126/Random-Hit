function getY()
	return math.sin(mgTime()*4*frequency*0.3+offset)*amplitude
end

function init()
	w = mgGetFloat("width", 1)
	d = mgGetFloat("depth", 1)
	t = mgGetFloat("thickness", 0.1)
	amplitude = mgGetFloat("amplitude", 1)
	frequency = mgGetFloat("frequency", 1)
	offset = mgGetFloat("offset", 0)
	cr,cg,cb = mgGetColor("color", 1, 1, 1)

	mgMaterial("steel")
	mgCategory(129);
	b = mgCreateBody(0, getY(), 0)
	
	mgStatic(2)
	mgColor(cr,cg,cb)
	mgCreateBox(b, w*0.5, t*0.5, d*0.5)
	mgCreateBox(b, 0.1, 50, 0.1, 0, -50, 0)
	t = 0
end

function tick()
	mgMove(b, 0, getY(), 0, 10, 10)
end

