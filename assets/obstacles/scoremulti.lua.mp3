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
	mgForceLimit(0.05)
	mgCategory(4)
	mgCreateMesh(body, "pyramid", 0, 0.1, 0)
	mgCreateMesh(body, "pyramid", -0.1, 0, 0, 0, 0, 1.57)
	mgCreateMesh(body, "pyramid", 0.1, 0, 0, 0, 0, -1.57)
	mgCreateMesh(body, "pyramid", 0, -0.1, 0, 0, 0, 3.14)
	mgCreateMesh(body, "pyramid", 0, 0, 0.1, 1.57, 0, 0)
	mgCreateMesh(body, "pyramid", 0, 0, -0.1, -1.57, 0, 0)
	
	mgSetAngVel(body, 0, 1, 0)
	mgMove(body, 0, getY(), 0)
end

function tick()
	if not mgIsCleared() then
		local dist = mgCameraDistance()
		if ray then
			mgMove(body, 0, getY(), 0)
			mgGlow(0, getY(), 0)
		end
		if mgBodyIsBroken(body) then
			if dist > 12 then
				mgScore(10, 0, getY(), 0.1)
			elseif dist > 6 then
				mgScore(5, 0, getY(), 0.1)
			else
				mgScore(3, 0, getY(), 0.1)
			end
			mgReleaseMotion(body)
			mgClear()
			return
		end

		if dist > 13 then
			star = 1
			diamond = 1
		elseif dist > 12 then
			star = dist-12
			diamond = 1
		elseif dist > 7 then
			star = 0
			diamond = 1
		elseif dist > 6 then
			star = 0
			diamond = dist-6
		else
			star = 0
			diamond = 0
		end
		if oldStar~=star or oldDiamond~=diamond then
			mgClearShapes(body)
			mgShapeScale(0.2-0.1*star, 1.0-diamond*0.5, 0.2-0.1*star)
			mgCreateMesh(body, "pyramid", 0, 0.1*star-0.5*(1-diamond), 0)
			if diamond > 0 then
				mgShapeScale(0.2-0.1*star, 0.5*diamond, 0.2-0.1*star)
				mgCreateMesh(body, "pyramid", 0, -0.1*star-0.5*(1-diamond), 0, 0, 0, 3.14)
				if star > 0 then
					mgShapeScale(star*0.1, star*0.5, 0.1)
					mgCreateMesh(body, "pyramid", 0.2-0.1*star, 0, 0, 0, 0, -1.57)
					mgCreateMesh(body, "pyramid", -0.2+0.1*star, 0, 0, 0, 0, 1.57)
					mgShapeScale(0.1, star*0.5, star*0.1)
					mgCreateMesh(body, "pyramid", 0, 0, 0.2-0.1*star, 1.57, 0, 0)
					mgCreateMesh(body, "pyramid", 0, 0, -0.2+0.1*star, -1.57, 0, 0)
				end
			end
			oldStar = star
			oldDiamond = diamond
		end
	end	
end


