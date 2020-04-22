function init()
	static = mgGetBool("static", true)
	ray = mgGetBool("raycast", false)

	
	mgScore(3, 0, 0.6, 0.1)
	mgGlow(0, 0.4, -.2)
	
	local yPos = 0
	if ray then
		local tmp,x,y,z = mgRaycast(0,0,0,0,-15,0)
		yPos = y + 0.02
	end

	body = mgCreateBody(0, yPos, 0)
	cr, cg, cb = mgGetColor("color", 1, 1, 1)
	
	mgMaterial("glass")
	mgColor(cr, cg, cb)
	mgRoundness(0.6)
	
	mgShapeScale(0.2, 1.0, 0.2)
	mgCreateMesh(body, "pyramid")
	
	if static then
		mgStatic(1)
		mgCategory(0)
		mgCreateBox(body, 0.01, 0.01, 0.01)	
	end
end

function tick()
	if not mgIsCleared() then
		if not static then
			local x,y,z = mgGetPos(body)
			mgScore(3, x, y+0.6, z+0.1)
			mgGlow(x, y+0.4, z+0.2)
		end
		if mgBodyIsBroken(body) then
			mgClear()
		end
	end
end


