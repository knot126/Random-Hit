function getPos()
	if move > 0 then
		return move * (math.sin(mgCameraDistance()*speed + offset))
	else
		return 0
	end
end

function init()
	dir = mgGetString("dir", "right")
	beams = mgGetInt("beams", 5)
	move = mgGetFloat("move", 0)
	speed = mgGetFloat("speed", 1)
	raycast = mgGetBool("raycast", false)
	cr,cg,cb = mgGetColor("color", 1, 0.5, 0.5)

	if mgGetString("offset", "rnd") == "rnd" then
		offset = mgRndFloat(0, 100)
	else
		offset = mgGetFloat("offset", 0)
	end
	
	b = mgCreateBody(0, getPos(), 0)
	mgMaterial("glass")
	mgColor(cr,cg,cb)
	if move > 0 or raycast then
		mgStatic(2)
	else
		mgStatic(1)
	end
	mgMask(127-1)
	mgCreateBox(b, 0.05, 0.05, 0.05)
	mgStatic(0)
	s = mgCreateBox(b, 0.1, beams*0.1+0.1, 0.2, 0.1, 0, 0)
	mgMaterial("metal")
	
	snd = mgCreateSound("snd/laser-hit.ogg")
	
	enabled = true
end

function tick()
	local yPos = getPos()
	local xPos = 0
	t = 0
	if raycast then
		local hit,x,y,z = mgRaycast(5, yPos, 0, -10, 0, 0, 128)
		if hit then
			xPos = x
		end
	end
	if move > 0 or raycast then
		mgMove(b, xPos, yPos, 0)
	end
	if mgShapeIsBroken(s) and enabled then
		mgPlaySound(snd)
		for y=1,beams do
			mgSmoke(0, yPos + (y-0.2)*0.18-beams*0.1,0, mgRndFloat(0,1), mgRndFloat(-0.4,0.4), mgRndFloat(-0.4,0.4))
		end
		enabled = false
	end
	t = 0.21
	if enabled then
		for y=1,beams do
		mgLaser(xPos + 0.01 + t, yPos + (y-0.2)*0.18-beams*0.1, 0, 1, 0, 0)
		end
	end
end


