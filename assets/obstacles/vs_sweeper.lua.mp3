function init()
	w = mgGetFloat("width", 1)
	h = mgGetFloat("height", 2)
	glass = mgGetBool("glass", false)
	cr,cg,cb = mgGetColor("color", 1,1,1)
	distance = mgGetFloat("distance", 5)
	strength = mgGetFloat("strength", 0.01)
	thickness = mgGetFloat("thickness", 0.05)

	b = mgCreateBody()
	
	mgMaterial("steel")
	mgShapeChamfer(0.01)
	mgCreateBox(b, w/2+0.1, 0.1, thickness+0.1, 0, h/2, 0)	

	if glass then
		mgMaterial("glass")
		mgForceLimit(strength)
	end
	mgColor(cr,cg,cb)
	mgShapeChamfer(0.03)
	mgRoundness(0.2)
	mgStatic(2)

	mgCategory(2)
	mgMask(127-2)
	mgCreateBox(b, w/2, h/2, thickness, 0, 0, 0)
	
	b0 = mgCreateButton(-1, h/2+0.5, 0.1)
	b1 = mgCreateButton(1, h/2+0.5, 0.1)

	snd = mgCreateSound("snd/door/1.ogg")
end

function tick()
	if mgIsButtonDown(b0, true) and mgIsButtonDown(b1) then
		mgSetButtonDown(b1, false)
		mgPlaySound(snd)
	end
	if mgIsButtonDown(b1, true) and mgIsButtonDown(b0) then
		mgSetButtonDown(b0, false)
		mgPlaySound(snd)
	end
	
	if  mgIsButtonDown(b0) then
		mgMove(b, -1, 0, 0, 100, 1.5)
	elseif mgIsButtonDown(b1) then
		mgMove(b, 1, 0, 0, 100, 1.5)
	else
		mgMove(b, 0, 0, 0, 100, 1.5)
	end
end

