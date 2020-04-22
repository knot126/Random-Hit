function init()
	cr, cg, cb = mgGetColor("color", 1, 1, 1)
	dist = mgGetFloat("distance", 10)
	vz = mgGetFloat("speed", 10)
	size = mgGetFloat("size", 0.2)
	done = false
	body = 0
	snd = mgCreateSound("snd/flycube.ogg")
end

function tick()

	if not fired and mgCameraDistance() < dist then
		fired = true

		for i=0, 20 do
			mgSmoke(0,0,0.6, mgRndFloat(-0.6, 0.6), mgRndFloat(-0.6, 0.6), mgRndFloat(0, 1))
		end
		
		mgPlaySound(snd)

		body = mgCreateBody()
		mgMaterial("glass")
		mgColor(cr, cg, cb)
		mgRoundness(0.6)
		mgCreateBox(body, size, size, size)

		cx, cy, cz = mgGetCameraPos()
		camSpeed = mgGetCameraSpeed()

		t = cz / (camSpeed+vz);

		vx = cx/t
		grav = -10
		vy = (cy-grav*t*t/2)/t

		mgSetVel(body, vx, vy, vz)
		mgSetAngVel(body, 6, 4, 5)
	end
	if body ~= 0 then
		if mgBodyIsBroken(body) and not done then
			mgClear()
			done = true
		end
	end
end


