obstacleBody = {}

function getPosAng(i, offset)
	local radius = 3
	local ang = i*2*math.pi/obstacleCount + offset
	local x = math.cos(ang) * radius
	local z = math.sin(ang) * radius
	return x, -3.2, z, math.pi*0.5-ang
end

function init()
	distance = mgGetFloat("distance", 10)
 	cr,cg,cb = mgGetColor("color", 1, 0, 0)
 	mr,mg,mb = mgGetColor("metalcolor", 1, 1, 1)
	obstacleCount = mgGetInt("obstacles", 6)
	
	for i=1, obstacleCount do
		local x,y,z,ang = getPosAng(i, 0)
		obstacleBody[i] = mgCreateBody(x, y, z, 0, ang, 0)
		mgMaterial("steel")
		mgColor(mr,mg,mb)	
		mgCreateBox(obstacleBody[i], .5, 0.1, 0.1, 0, -0.1, 0)
		mgCreateBox(obstacleBody[i], .5, 0.1, 0.1, 0, 6.1, 0)
		mgMaterial("glass")
		mgColor(cr,cg,cb)
		--mgMaterial("steel") mgRoundness(0.4)
		mgMask(64)
		mgCreateBox(obstacleBody[i], 0.5, 3, 0.02, 0, 3, 0)
	end
end

function tick()
	if mgIsCleared() then return end

	local t = mgTime()
	d = mgCameraDistance()
	
	for i=1,obstacleCount do
		x,y,z,ang = getPosAng(i, t)
		mgMove(obstacleBody[i], x, y, z-distance+d, 10, 10)
		mgRotate(obstacleBody[i], 0, ang, 0)
	end

	if not mgHasBoss() then
		mgClear()
		for i=1,obstacleCount do
			mgReleaseMotion(obstacleBody[i])
		end
		return
	end
end

