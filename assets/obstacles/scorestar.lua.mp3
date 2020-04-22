function getY()
	if ray then
		local tmp,x,y,z = mgRaycast(0,0,0,0,-10,0, 3)
		return y+0.7
	else
		return 0.7
	end
end

function init()
	ray = mgGetBool("raycast", false)

	mgScore(10, 0, getY(), 0.1)
	mgGlow(0, getY(), 0)
	
	body = mgCreateBody(0, getY(), 0)
	cr, cg, cb = mgGetColor("color", 1, 1, 1)
	
	mgMaterial("glass")
	mgColor(cr, cg, cb)
	mgRoundness(0.2)
	
	mgShapeScale(0.1, 0.5, 0.1)
	mgCategory(4)
	mgCreateMesh(body, "pyramid", 0, 0.1, 0)
	mgCreateMesh(body, "pyramid", -0.1, 0, 0, 0, 0, 1.57)
	mgCreateMesh(body, "pyramid", 0.1, 0, 0, 0, 0, -1.57)
	mgCreateMesh(body, "pyramid", 0, -0.1, 0, 0, 0, 3.14)
	mgCreateMesh(body, "pyramid", 0, 0, 0.1, 1.57, 0, 0)
	mgCreateMesh(body, "pyramid", 0, 0, -0.1, -1.57, 0, 0)
	
	mgSetAngVel(body, math.random(-1,1), math.random(-1,1), math.random(-1,1))
	mgMove(body, 0, getY(), 0)
end

function tick()
	if not mgIsCleared() then
		if ray then
			mgMove(body, 0, getY(), 0)
			mgGlow(0, getY(), 0)
		end
		if mgBodyIsBroken(body) then
			mgScore(10, 0, getY(), 0.1)
			mgReleaseMotion(body)
			mgClear()
		end
	end
end


