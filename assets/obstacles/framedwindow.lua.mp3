function init()
	cr,cg,cb = mgGetColor("color", 1, 1, 1)
	width = mgGetFloat("width", 4)
	height = mgGetFloat("height", 2)

	mgMaterial("glass")
	mgColor(cr, cg, cb)

	t = 0.05
	a = mgCreateBody()
	mgCreateBox(a, width/2-t, height/2-t, 0.02, 0, height/2, 0)

	mgMaterial("steel")
	mgStatic(1)
	mgCreateBox(a, width/2+t, t, t, 0, t, 0)
	mgCreateBox(a, width/2+t, t, t, 0, height, 0)
	mgCreateBox(a, t, height/2-t, t, -width/2, height/2, 0)
	mgCreateBox(a, t, height/2-t, t, width/2, height/2, 0)
end

function tick()
	if not mgIsCleared() and mgBodyIsBroken(a) and mgCanPass() then
		mgClear()
	end
end