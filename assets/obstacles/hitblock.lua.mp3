function init()
	cr,cg,cb = mgGetColor("color", 1, 1, 1)
	distance = mgGetFloat("distance", 8)
	width = mgGetFloat("width", 0.6)
	height = mgGetFloat("height", 2.4)
	depth = mgGetFloat("depth", 0.3)
	boom = mgGetBool("boom", false)
	vz = mgGetFloat("speed", 10)
	ax = mgGetFloat("ax", 0.0)
	ay = mgGetFloat("ay", 0.0)
	az = mgGetFloat("az", 0.0)
	
	mgMaterial("glass")
	mgDensity(0.3)
	mgColor(cr, cg, cb)
	b = mgCreateBody()
	mgCreateBox(b, width/2, height/2, depth/2)
	mgMove(b, 0, 0, 0)
	mgRotate(b, 0, 0, 0)
	if boom then
		snd = mgCreateSound("snd/explosion0.ogg")
	end
end

function tick()
	if mgBodyIsBroken(b) then
		if not mgIsCleared() then
			mgClear()
		end
		if boom then
			boom = false
			mgCameraShake(0.5)
			mgPlaySound(snd)
		end
	end
	vdist = distance * mgGetCameraSpeed() / 7.0
	if mgCameraDistance() < vdist and  not released then
		mgReleaseMotion(b)

		cx, cy, cz = mgGetCameraPos()
		camSpeed = mgGetCameraSpeed()

		t = cz / (camSpeed+vz);

		vx = cx/t
		grav = -mgGetGravity()
		vy = (cy-grav*t*t/2)/t

		mgSetVel(b, vx, vy, vz)
		mgSetAngVel(b, ax, ay, az)
		released = true
	end
end


