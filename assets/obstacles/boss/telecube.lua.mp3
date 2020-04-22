cube = {}
glass = {}
anim = {0,0,0,0}
animTarget = {1,1,1,1}
dirX = {-1,1,0,0}
dirY = {0,0,-1,1}
broken = {false, false, false, false}

function animate()
	for i=1, arms do
		local d = animTarget[i]-anim[i]
		if d < -0.05 then d = -0.05 end
		if d > 0.05 then d = 0.05 end
		anim[i] = anim[i] + d
		if not mgShapeIsBroken(glass[i]) then
			mgTranslateShape(cube[i], d*dirX[i]*0.9, d*dirY[i]*0.9, 0, false)
		end
	end
end

function init()
	distance = mgGetFloat("distance", 12)
	arms = mgGetInt("arms", 2)
	cr,cg,cb = mgGetColor("color", 1, 0 ,0)

	b = mgCreateBody(0, 0, 0)
	mgMaterial("steel")
	mgShapeChamfer(0.03)
	mgCreateBox(b, 0.5, 0.5, 0.5)
	cube[1] = mgCreateBox(b, 0.5, 0.3, 0.3, -1.1, 0, 0)
	cube[2] = mgCreateBox(b, 0.5, 0.3, 0.3, 1.1, 0, 0)
	if arms == 4 then
		cube[3] = mgCreateBox(b, 0.3, 0.5, 0.3, 0, -1.1, 0)
		cube[4] = mgCreateBox(b, 0.3, 0.5, 0.3, 0, 1.1, 0)
	end
	mgShapeChamfer(0.0)
	
	mgCreateCylinder(b, 0.2, 0.1, 0, 0, 0.6, 0, 0.5*math.pi, 0)
	mgCreateCylinder(b, 0.2, 0.1, 0, 0, -0.6, 0, 0.5*math.pi, 0)
	mgColor(0, 0, 0)
	mgCreateCylinder(b, 0.15, 0.02, 0, 0, 0.7, 0, 0.5*math.pi, 0)
	mgCreateCylinder(b, 0.15, 0.02, 0, 0, -0.7, 0, 0.5*math.pi, 0)

	mgMaterial("glass")
	mgColor(cr,cg,cb)
	mgShapeChamfer(0)
	glass[1] = mgCreateBox(b, 0.5, 0.1, 0.1, -1.0, 0, 0)
	glass[2] = mgCreateBox(b, 0.5, 0.1, 0.1, 1.0, 0, 0)
	if arms == 4 then
		glass[3] = mgCreateBox(b, 0.1, 0.5, 0.1, 0, -1.0, 0)
		glass[4] = mgCreateBox(b, 0.1, 0.5, 0.1, 0, 1.0, 0)
	end
	t = 0
	mgRotate(b, 0, 0, 0, 100, 2)

	f = math.random(0,200)
	offset = math.random(0,10)

	snd = mgCreateSound("snd/boss/punch.ogg")
	offSnd = mgCreateSound("snd/boss/discharge.ogg")
	engineSnd = mgCreateSound("snd/boss/engine.ogg")
	
	currentFrame = 0
end

function fireCube(x,y,z)
	for i=0, 10 do
		mgSmoke(x,y,z, mgRndFloat(-0.6, 0.6), mgRndFloat(-0.6, 0.6), mgRndFloat(0, 1))
	end

	mgPlaySound(snd)

	local body = mgCreateBody(x, y, z)
	mgMaterial("glass")
	mgColor(cr,cg,cb)
	mgRoundness(0.6)
	size = 0.1
	mgCreateBox(body, size, size, size)

	cx, cy, cz = mgGetCameraPos()
	cx = cx - x
	cy = cy - y
	cz = cz - z
	camSpeed = mgGetCameraSpeed()

	vz = 10
	t = cz / (camSpeed+vz);

	vx = cx/t
	grav = -10
	vy = (cy-grav*t*t/2)/t

	mgSetVel(body, vx, vy, vz)
	mgSetAngVel(body, 6, 4, 5)
end

function frame(f)
	local c = f%400
	
	if f > 200 and (c == 250 or c == 300 or c == 350) then
		local x,y,z = mgGetPos(b)
		fireCube(x,y,z+1)
	end

	if c==0 then animTarget[1] = 1 mgPlaySound(engineSnd) end
	if c==5 then animTarget[3] = 1 end
	if c==10 then animTarget[2] = 1 end
	if c==15 then animTarget[4] = 1 end
	if c==50 then
		mgReleaseMotion(b)
		local rx = math.random(-2,2)
		local ry = math.random(-2,2)
		local rz = 2 - math.abs(rx) - math.abs(ry)
		mgSetAngVel(b, rx, ry, rz)
	end
	if c==200 then
		mgPlaySound(engineSnd) 
		animTarget[1] = 0
		animTarget[2] = 0
		animTarget[3] = 0
		animTarget[4] = 0
		mgRotate(b, 0, 0.0*math.pi, 0, 10, 3)
	end
end

function tick()
	local allBroken = true
	for i=1,arms do
		if mgShapeIsBroken(glass[i]) then
			if not broken[i] then
				 mgPlaySound(offSnd)
				mgSetShapeColor(glass[i], 1, 1, 1)
				broken[i] = true
			end
		else
			allBroken = false
		end
	end

	if allBroken then
		if not mgIsCleared() then
			mgClear()
			mgReleaseMotion(b)
		end	
	else
		animate()

		ot = mgObstacleTime()
		f = ot *60
		while f > currentFrame do
			currentFrame = currentFrame + 1
			frame(currentFrame)
		end

		local t = mgTime()
		d = mgCameraDistance()
		local x = 0.8*math.sin(1.3*t+offset)
		local y = 0.5*math.sin(t+offset)
		local z = -distance + d
		mgMove(b, x, y, z, 10, 10)
	end
end

