function getY(r,c)
	local t = mgTime()*4
	return math.sin(t*frequency+offset+r*rowc+c*colc)*amplitude
end

function init()
	w = mgGetFloat("width", 1)
	d = mgGetFloat("depth", 1)
	t = mgGetFloat("thickness", 0.5)
	rows = mgGetInt("rows", 4)
	cols = mgGetInt("cols", 4)
	rowc = mgGetFloat("rowc", 0.5)
	colc = mgGetFloat("colc", 0.5)
	separation = mgGetFloat("separation", 0.02)
	amplitude = mgGetFloat("amplitude", 0.3)
	frequency = mgGetFloat("frequency", 1)
	offset = mgGetFloat("offset", 0)
	cr,cg,cb = mgGetColor("color", 1, 1, 1)

	mgMaterial("steel")
	mgCategory(129);
	mgStatic(2)
	mgColor(cr,cg,cb)
	mgCategory(2)
	mgMask(127-2)
	b = {}
	for r = 1,rows do
		for c = 1,cols do
			local i = r*cols+c
			b[i] = mgCreateBody(r*w-(rows+1)/2*w, getY(r,c), c*d-(cols+1)/2*d)
			mgCreateBox(b[i], w*0.5-separation, t*0.5, d*0.5-separation)
			mgCreateBox(b[i], 0.1, 50, 0.1, 0, -50, 0)
		end
	end

	t = 0
end

function tick()
	for r = 1,rows do
		for c = 1,cols do
			local i = r*cols+c
			mgMove(b[i], r*w-(rows+1)/2*w, getY(r,c), c*d-(cols+1)/2*d, 10, 10)
		end
	end
end

