function createBox(x, y, z, size)
	a = mgCreateBody(x, y, z)
	mgShapeChamfer(0.02)
	mgCreateBox(a, size, size, size)
end

function init()
	levels = mgGetInt("levels", 4)
	cr, cg, cb = mgGetColor("color", 1, 1, 1)
	size = mgGetFloat("size", 0.18)
	mat = mgGetString("material", "glass")
	
	mgMaterial(mat)
	mgColor(cr, cg, cb)

	z = size
	spacing = 2*z + 0.02
	for j=0,levels do
		for i=0,levels-j do
			createBox(j*spacing*0.5 + i*spacing-levels*spacing*0.5, spacing*j + z, 0, z, mat)
		end
	end
end

function tick()
	if not mgIsCleared() and mgCanPass() then
		mgClear()
	end
end

