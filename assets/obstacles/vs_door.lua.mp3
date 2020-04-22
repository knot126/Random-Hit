function init()
	w = mgGetFloat("width", 2)
	h = mgGetFloat("height", 2)
	glass = mgGetBool("glass", false)
	cr,cg,cb = mgGetColor("color", 1,1,1)
	distance = mgGetFloat("distance", 5)
	strength = mgGetFloat("strength", 0.01)

	left = mgCreateBody()
	right = mgCreateBody()
	
	if glass then
		mgMaterial("door")
		mgCreateBox(left, 0.1, h/2, 0.1, -w/2-0.1, h/2, 0)
		mgCreateBox(right, 0.1, h/2, 0.1, w/2+0.1, h/2, 0)
		
	end

	if glass then
		mgMaterial("glass")
	else
		mgMaterial("door")
	end
	mgColor(cr,cg,cb)
	mgShapeChamfer(0.03)
	mgRoundness(0.2)
	mgStatic(2)
	mgForceLimit(strength)

	mgCategory(2)
	mgMask(127-2)
	mgCreateBox(left, w/4, h/2, 0.1, -w/4, h/2, 0)
	mgCreateBox(right, w/4, h/2, 0.1, w/4, h/2, 0)
	
	b0 = mgCreateButton(-0.5, h+0.5, 0.1)
	b1 = mgCreateButton(0.5, h+0.5, 0.1)
	mgSetButtonDown(b0, true)
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
	
	if  mgIsButtonDown(b1) then
		mgMove(left, -w/2+0.05, 0, 0, 100, 0.8)
		mgMove(right, w/2-0.05, 0, 0, 100, 0.8)
	else
		mgMove(left, 0.025, 0, 0, 100, 0.8)
		mgMove(right, -0.025, 0, 0, 100, 0.8)
	end
end

