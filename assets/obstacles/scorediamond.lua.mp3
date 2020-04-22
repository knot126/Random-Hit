function getY()
	if ray then
		local tmp,x,y,z = mgRaycast(0,0,0,0,-10,0, 3)
		return y+0.6
	else
		return 0.6
	end
end

function init()
	ray = mgGetBool("raycast", false)

	mgScore(5, 0, 0.6, 0.1)
	mgGlow(0, getY(), 0)
	
	body = mgCreateBody(0, getY(), 0)
	cr, cg, cb = mgGetColor("color", 1, 1, 1)
	
	mgMaterial("glass")
	mgColor(cr, cg, cb)
	mgRoundness(0.2)
	
	mgShapeScale(0.2, 0.5, 0.2)
	mgCategory(4)
	mgCreateMesh(body, "diamond")
	
	mgMove(body, 0, getY(), 0)
end

function tick()
	if not mgIsCleared() then
		mgSetAngVel(body, 0, 1, 0)
		if ray then
			mgMove(body, 0, getY(), 0)
			mgGlow(0, getY(), 0)
		end	
		if mgBodyIsBroken(body) then
			mgScore(5, 0, getY(), 0.1)
			mgClear()
			mgReleaseMotion(body)
		end
	end
end


