phase = 1
anim = 0
animTarget = 0
offsetFrame = 0

function animate()
	local d = animTarget-anim
	if d < -0.05 then d = -0.05 end
	if d > 0.05 then d = 0.05 end
	anim = anim + d
	if not mgIsCleared() then
		mgTranslateShape(c0, -d*0.5, 0, 0, false)
		mgTranslateShape(cyl1, -d*0.5, 0, 0, false)
		mgTranslateShape(cyl3, -d*0.5, 0, 0, false)

		mgTranslateShape(c1, d*0.5, 0, 0, false)
		mgTranslateShape(cyl0, d*0.5, 0, 0, false)
		mgTranslateShape(cyl2, d*0.5, 0, 0, false)
	end
end

function init()
	distance = mgGetFloat("distance", 12)
	cr,cg,cb = mgGetColor("color", 1, 0 ,0)

	b2 = mgCreateBody(0, 0, 0)

	mgMaterial("steel")
	mgShapeChamfer(0.03)
	mgMask(64)
	c0 = mgCreateBox(b2, 0.6, 0.3, 0.3, -0.6, 0, 0)
	c1 = mgCreateBox(b2, 0.6, 0.3, 0.3, 0.6, 0, 0)
	mgShapeChamfer(0)

	cyl0=mgCreateCylinder(b2, 0.2, 0.1, 1.2, 0,0,0, 0.0*math.pi, 0)
	cyl1=mgCreateCylinder(b2, 0.2, 0.1, -1.2, 0,0,0, 0.0*math.pi, 0)
	mgColor(0, 0, 0)
	cyl2=mgCreateCylinder(b2, 0.15, 0.02, 1.3, 0,0, 0, 0.0*math.pi, 0)
	cyl3=mgCreateCylinder(b2, 0.15, 0.02, -1.3, 0,0,0, 0.0*math.pi, 0)

	mgMaterial("glass")
	mgMask(0)
	mgForceLimit(0.2)
	mgColor(cr,cg,cb)
	glass = mgCreateBox(b2, 0.5, 0.15, 0.15, 0, 0, 0)


	b = mgCreateBody(0, 0, 0)
	mgMaterial("steel")
	left = mgCreateBox(b, 0.1, 0.6, 0.6, -1.6, 0, 0)
	right = mgCreateBox(b, 0.1, 0.6, 0.6, 1.6, 0, 0)

	mgMaterial("steel")
	mgCreateCylinder(b, 0.2, 0.1, 1.7, 0,0,0, 0.0*math.pi, 0)
	mgCreateCylinder(b, 0.2, 0.1, -1.7, 0,0,0, 0.0*math.pi, 0)
	mgColor(0, 0, 0)
	mgCreateCylinder(b, 0.15, 0.02, 1.8, 0,0, 0, 0.0*math.pi, 0)
	mgCreateCylinder(b, 0.15, 0.02, -1.8, 0,0,0, 0.0*math.pi, 0)

	mgMaterial("glass")
	mgForceLimit(0.2)
	mgColor(cr,cg,cb)

	mgCreateBox(b, 1.5, 0.5, 0.03, 0, 0, 0.5)
	mgCreateBox(b, 1.5, 0.5, 0.03, 0, 0, -0.5)
	mgCreateBox(b, 1.5, 0.03, 0.5, 0, 0.5, 0)
	mgCreateBox(b, 1.5, 0.03, 0.5, 0, -0.5, 0)

	t = 0
	mgRotate(b, 0, 0, 0, 100, 2)
	mgMove(b, 0, 0, 0, 100, 2)

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
	if phase == 1 then
		local c = f%400
	
		if f > 200 and (c == 80 or c == 180) then
			local x,y,z = mgGetPos(b)
			fireCube(x,y,z+2)
		end

		if c==0 then 
			mgRotate(b, 0, 0.5*math.pi, 0, 10, 3)
		end
		if c==100 then 
			mgRotate(b, 0, 1.5*math.pi, 0, 10, 3)
		end
		if c>200 then 
			mgRotate(b, mgObstacleTime()*3, 0, 0, 10, 3)
		end
	else
		local c = f%400

		if c == 80 or c == 180 then
			local x,y,z = mgGetPos(b2)
			fireCube(x,y,z+1.4)
		end

		if c==10 then 
			animTarget = 0
			mgRotate(b2, 0, 0.5*math.pi, 0, 10, 3)
		end
		if c==100 then 
			mgRotate(b2, 0, 1.5*math.pi, 0, 10, 3)
		end
		if c==200 then 
			mgReleaseMotion(b2)
			vx = math.random(-4,4)
			vy = math.random(-4,4)
			vz = math.abs(vx) + math.abs(vy)
		end
		if c > 200 then
			vx = vx * 0.99
			vy = vy * 0.99
			vz = vz * 0.99
			mgSetAngVel(b2, vx, vy, vz)
		end
		if c== 200 then
			mgSetShapeMask(glass, 255)
			animTarget = 1
			mgPlaySound(engineSnd)
		end
			
		if c== 350 then
			mgSetShapeMask(glass, 0)
			animTarget = 0 
			mgPlaySound(engineSnd)
		end
	end
end
function tick()
	if mgIsCleared() then
		return
	end
	
	ot = mgObstacleTime()
	f = ot *60
	while f > currentFrame do
		currentFrame = currentFrame + 1
		frame(currentFrame-offsetFrame)
	end

	local t = mgTime()
	d = mgCameraDistance()
	local x = 0.8*math.sin(1.3*t+offset)
	local y = 0.5*math.sin(t+offset)
	local z = -distance + d
	
	if mgGetShapeBody(left) == mgGetShapeBody(right) then
		mgMove(b, x, y, z, 10, 10)
		mgClonePose(b2, b)
	else
		if mgGetShapeBody(c0) ~= mgGetShapeBody(c1)  then
			mgClear()
			mgSetShapeColor(glass, 1,1,1)
			mgReleaseMotion(b2)
		else
			if phase==1 then 
				offsetFrame = currentFrame 
				mgSetShapeMask(c0, 255)
				mgSetShapeMask(c1, 255)
			end
			phase = 2
			mgReleaseMotion(b)
			local zo = 0
			if (currentFrame-offsetFrame) > 60 then zo = 1 end 
			if (currentFrame-offsetFrame) > 80 then zo = 2 end 
			if (currentFrame-offsetFrame) > 100 then zo = 3 end 
			mgMove(b2, x, y, z+zo, 10, 10)
		end
	end
	animate()
end

