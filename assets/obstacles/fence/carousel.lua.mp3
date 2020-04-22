obstacleBody = {}

function getPosAng(i, offset)
	local ang = i*2*math.pi/obstacleCount + offset * speed
	local x = math.cos(ang) * radius
	local z = math.sin(ang) * radius
	return x, 0, z, math.pi*0.5-ang
end

function init()
	distance = mgGetFloat("distance", 10)
 	cr,cg,cb = mgGetColor("color", 1, 0, 0)
 	mr,mg,mb = mgGetColor("metalcolor", 1, 1, 1)
	obstacleCount = mgGetInt("obstacles", 6)
	radius = mgGetFloat("radius", 3)
	height = mgGetFloat("height", 4)
	width = mgGetFloat("width", 1)
	speed = mgGetFloat("speed", 1)
	metal = mgGetBool("metal", false)
	
	for i=1, obstacleCount do
		local x,y,z,ang = getPosAng(i, mgTime())
		obstacleBody[i] = mgCreateBody(x, y, z, 0, ang, 0)
		mgMaterial("steel")
		mgColor(mr,mg,mb)	
		mgMask(64)
		mgCreateBox(obstacleBody[i], width/2, 0.1, 0.1, 0, -height/2-0.1, 0)
		mgCreateBox(obstacleBody[i], width/2, 0.1, 0.1, 0, height/2+0.1, 0)
		mgMaterial("glass")
		mgColor(cr,cg,cb)
		if metal then mgMaterial("steel") mgRoundness(0.3) end
		mgMask(64)
		mgCreateBox(obstacleBody[i], width/2, height/2, 0.02, 0, 0, 0)
	end
	
	fenceTarget = 1
	fence = 1
end

function tick()
	if mgIsCleared() then return end

	local t = mgTime()
	d = mgCameraDistance()
	
	if mgObstacleTime() > 0 and mgGet("level.bossattack")=="0" then
		fenceTarget = 1
	else
		fenceTarget = 0
	end
	
	if fenceTarget > fence then fence = fence + 0.02 end 
	if fenceTarget < fence then fence = fence - 0.02 end 
	
	for i=1,obstacleCount do
		x,y,z,ang = getPosAng(i, t)
		mgMove(obstacleBody[i], x, y-2*(1.0-fence), z-distance+d, 10, 10)
		mgRotate(obstacleBody[i], 0, ang, math.pi*0.5*(1.0-fence))
	end

	if not mgHasBoss() then
		mgClear()
		for i=1,obstacleCount do
			mgReleaseMotion(obstacleBody[i])
		end
		return
	end
end

