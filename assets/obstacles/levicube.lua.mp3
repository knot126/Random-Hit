function init()
	cr,cg,cb = mgGetColor("color", 1, 1, 1)
	size = mgGetFloat("size", 0.35)
	interval = mgGetFloat("interval", 2)
	speed = mgGetFloat("speed", 7)
	offset = mgGetFloat("offset", 0)
	
	mgMaterial("glass")
	mgForceLimit(0.2)
	mgColor(cr, cg, cb)
	body = mgCreateBody()
	mgCreateBox(body, size, size, size)
	
	jump = false
	mgMove(body, 0,0,0)
	jumpTime = mgTime() + offset
end


function tick()
	if mgIsCleared() then
		return
	end
	if mgBodyIsBroken(body) then
		mgClear()
	end
	if jump then
		if mgTime() > jumpTime + 0.1 then
			x,y,z = mgGetPos(body)
			if y < 0 then
				mgMove(body, 0,0,0)
				jump = false
			end
		end
	else
		if mgTime() > jumpTime+interval then
			jumpTime = mgTime()
			jump = true
			mgReleaseMotion(body)
			mgSetVel(body, 0, speed, 0)
		end
	end
end

