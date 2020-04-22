sides = {}
broken = {}

obstacleBody = {}
angX = 0
angY = 0
angZ = 0
tx = 0
ty = 0
tz = 0
attackZ = 0
light = 0

function init()
	distance = mgGetFloat("distance", 15)
	cr,cg,cb = mgGetColor("color", 1, 0 ,0)
	mr,mg,mb = mgGetColor("metalcolor", 1, 1 ,1)
	cycle = mgGetInt("cycle", 500)
	attackDistance = mgGetFloat("attackDistance", 0)
	
	if mgGetString("offset", "rnd") == "rnd" then
		offset = mgRndFloat(0, 10)
	else
		offset = mgGetFloat("offset", 0)
	end

	local s = 0.6
	local t = 0.01

	b = mgCreateBody(0, 1, 0)

	mgMaterial("steel")
	mgShapeChamfer(0.03)
	mgRoundness(0.7)
	mgColor(mr,mg,mb)
	mgColor(0,0,0)
	mgCreateBox(b, s*3, s, t, 0, 0, s-t)
	mgColor(mr,mg,mb)

	mgShapeChamfer(0.0)
	mgRoundness(0.0)
	mgMask(0)
	local tc=t
	--mgCreateCylinder(b, tc, s, -s, -s, 0, 0, math.pi*0.5, 0)
	--mgCreateCylinder(b, tc, s, s, -s, 0, 0, math.pi*0.5, 0)
	--mgCreateCylinder(b, tc, s, -s, s, 0, 0, math.pi*0.5, 0)
	--mgCreateCylinder(b, tc, s, s, s, 0, 0, math.pi*0.5, 0)

	--mgCreateCylinder(b, tc, s, 0, -s, -s)
	--mgCreateCylinder(b, tc, s, 0, s, -s)
	--mgCreateCylinder(b, tc, s, 0, -s, s)
	--mgCreateCylinder(b, tc, s, 0, s, s)

	--mgCreateCylinder(b, tc, s, -s, 0, -s, 0, 0, math.pi*0.5)
	--mgCreateCylinder(b, tc, s, s, 0, -s, 0, 0, math.pi*0.5)
	--mgCreateCylinder(b, tc, s, -s, 0, s, 0, 0, math.pi*0.5)
	--mgCreateCylinder(b, tc, s, s, 0, s, 0, 0, math.pi*0.5)

	--mgShapeChamfer(0.03)
	--local t2 = t*1.5
	--mgCreateBox(b, t2, t2, t2, -s, s, -s)
	--mgCreateBox(b, t2, t2, t2, s, s, -s)
	--mgCreateBox(b, t2, t2, t2, -s, -s, -s)
	--mgCreateBox(b, t2, t2, t2, s, -s, -s)
	--mgCreateBox(b, t2, t2, t2, -s, s, s)
	--mgCreateBox(b, t2, t2, t2, s, s, s)
	--mgCreateBox(b, t2, t2, t2, -s, -s, s)
	--mgCreateBox(b, t2, t2, t2, s, -s, s)

	mgShapeChamfer(0.0)
	mgCreateCylinder(b, 0.3, 0.3, 0, 0, s-0.15, 0, 0.5*math.pi, 0)
	mgColor(0, 0, 0)
	mgCreateCylinder(b, 0.25, 0.02, 0, 0, s+0.15, 0, 0.5*math.pi, 0)
	mgColor(0, 0, 0, 1)
	mgMask(63)
	mgCreateBox(b, s-t, s-t, s-t)

	mgMaterial("glass")
	mgColor(cr,cg,cb)
	mgShapeChamfer(0)
	mgMask(0)
	mgRoundness(0.3)
	sides[1] = mgCreateBox(b, 0.02, s-t, s-t, -s*3-0.02, 0, 0)
	sides[2] = mgCreateBox(b, 0.02, s-t, s-t, s*3+0.02, 0, 0)
	sides[3] = mgCreateBox(b, s-t, 0.02, s-t, 0, -s-0.02, 0)
	sides[4] = mgCreateBox(b, s-t, 0.02, s-t, 0, s+0.02, 0)
	sides[5] = mgCreateBox(b, s-t, s-t, 0.02, 0, 0, -s-0.02)

	sides[6] = mgCreateBox(b, s-t, 0.02, s-t, s*2, -s-0.02, 0)
	sides[7] = mgCreateBox(b, s-t, 0.02, s-t, s*2, s+0.02, 0)
	sides[8] = mgCreateBox(b, s-t, 0.02, s-t, -s*2, -s-0.02, 0)
	sides[9] = mgCreateBox(b, s-t, 0.02, s-t, -s*2, s+0.02, 0)
	sides[10] = mgCreateBox(b, s-t, s-t, 0.02, -2*s, 0, -s-0.02)
	sides[11] = mgCreateBox(b, s-t, s-t, 0.02, s*2, 0, -s-0.02)

	for i=1,#sides do
		broken[i]=false
	end
	
	t = 0
	mgRotate(b, 0, 0, 0, 100, 2)
	
	currentFrame = math.floor(offset*60)

	snd = mgCreateSound("snd/boss/punch.ogg")
	offSnd = mgCreateSound("snd/boss/discharge.ogg")
	chargeSnd = mgCreateSound("snd/boss/charge.ogg")
	boomSnd = mgCreateSound("snd/explosion0.ogg")
end

function fireCube(x,y,z)
	for i=0, 10 do
		mgSmoke(x,y,z, mgRndFloat(-0.6, 0.6), mgRndFloat(-0.6, 0.6), mgRndFloat(0, 1))
	end

	mgPlaySound(snd, 3)

	local body = mgCreateBody(x, y, z)
	mgMaterial("glass")
	mgColor(cr,cg,cb)
	mgRoundness(0.6)
	size = 0.1
	mgCategory(2)
	mgCreateBox(body, size, size, size)

	cx, cy, cz = mgGetCameraPos()
	cx = cx - x
	cy = cy - y
	cz = cz - z
	camSpeed = mgGetCameraSpeed()

	vz = 10
	t = cz / (camSpeed+vz);

	vx = cx/t
	grav = -mgGetGravity()
	vy = (cy-grav*t*t/2)/t

	mgSetVel(body, vx, vy, vz)
	mgSetAngVel(body, 6, 4, 5)
end

function frame(f)
	local c = f%cycle
	
	if c==0 then
		light = 0
		tx = math.pi*2
		ty = 0
		tz = -math.pi*4
	end
	if c > 0 and c < cycle-100 then
		t = c/(cycle-100.0)
		t = (1.0 - math.cos(t*math.pi)) * 0.5
		angX = tx*t
		angY = ty*t
		angZ = tz*t
	end
	if c > cycle-150 and c < cycle-100 then
		t = (c-(cycle-150))/50
		t = (1.0 - math.cos(t*math.pi)) * 0.5
		attackZ = attackDistance * t
		light = t*10
		if light > 1 then light = 1 end
	end
	if c == cycle-150 then
		mgPlaySound(chargeSnd, 2)
	end
	if c > cycle-25 and c < cycle then
		t = 1.0-(c-(cycle-25))/25
		t = (1.0 - math.cos(t*math.pi)) * 0.5
		attackZ = attackDistance * t
		light = t
	end
	if c == cycle-25 then
		mgPlaySound(offSnd, 2)
	end
	if c > cycle-90 and c < cycle and c % 25 == 0 then
		local x,y,z = mgBodyPointToWorld(b, 0, 0, 0.7)
		fireCube(x,y,z)
	end
end

function tick()
	if mgIsCleared() then return end

	--Check what sides are facing player and activate those glass panels
	local vx,vy,vz = mgBodyVecToWorld(b, 1, 0, 0)
	if vz < -0.4 then mgSetShapeMask(sides[1], 255) else mgSetShapeMask(sides[1], 0) end
	if vz > 0.4 then mgSetShapeMask(sides[2], 255) else mgSetShapeMask(sides[2], 0) end
	local vx,vy,vz = mgBodyVecToWorld(b, 0, 1, 0) 
	if vz < -0.4 then mgSetShapeMask(sides[3], 255) else mgSetShapeMask(sides[3], 0) end
	if vz > 0.4 then mgSetShapeMask(sides[4], 255) else mgSetShapeMask(sides[4], 0) end
	if vz < -0.4 then mgSetShapeMask(sides[6], 255) else mgSetShapeMask(sides[6], 0) end
	if vz > 0.4 then mgSetShapeMask(sides[7], 255) else mgSetShapeMask(sides[7], 0) end
	if vz < -0.4 then mgSetShapeMask(sides[8], 255) else mgSetShapeMask(sides[8], 0) end
	if vz > 0.4 then mgSetShapeMask(sides[9], 255) else mgSetShapeMask(sides[9], 0) end
	local vx,vy,vz = mgBodyVecToWorld(b, 0, 0, 1) 
	if vz < -0.4 then mgSetShapeMask(sides[5], 255) else mgSetShapeMask(sides[5], 0) end
	if vz < -0.4 then mgSetShapeMask(sides[10], 255) else mgSetShapeMask(sides[10], 0) end
	if vz < -0.4 then mgSetShapeMask(sides[11], 255) else mgSetShapeMask(sides[11], 0) end

	local t = mgTime()
	d = mgCameraDistance()
	
	local done = true
	for i=1, #sides do
		if mgShapeIsBroken(sides[i]) then
			if not broken[i] then
				mgPlaySound(offSnd)
				mgSetShapeColor(sides[i], 1, 1, 1)
				broken[i] = true
			end
		else
			done = false
		end
	end
		
	local x = 1.3*math.sin(1.0*t+offset)
	local y = 1.2*math.sin(0.7*t+offset)
	local z = -distance+d + attackZ

	if done then
		mgClear()
		mgReleaseMotion(b)
		mgPlaySound(boomSnd, 3)
		mgCameraShake(2)
		for i=0, 20 do
			mgSmoke(x+mgRndFloat(-0.2,0.2),y+mgRndFloat(-0.2,0.2),z+mgRndFloat(0.3,0.5), mgRndFloat(-0.6, 0.6), mgRndFloat(-0.6, 0.6), mgRndFloat(0, 0.3))
		end
		return
	end

	ot = mgObstacleTime() + offset
	f = ot * 60
	while f > currentFrame do
		frame(currentFrame)
		currentFrame = currentFrame + 1
	end

	mgMove(b, x, y, z, 10, 10)

	local s = 0.4
	local v = 5
	local divX = math.sin(3*t)*0.1
	local divY = math.sin(7.2*t)*0.1
	local divZ = math.sin(4.9*t)*0.1
	cx,cy,cz = mgGetCameraPos()
	divY = divX + (cx-x)*0.1
	divX = divY + (-cy+y)*0.1
	mgRotate(b, angX+divX, angY+divY, angZ+divZ, 0.5, 5)
end

function draw()
	local s = 0.8
	local off = 0.66
	if  not mgShapeIsBroken(sides[1]) then
		mgBodyDecal(b, 59, s, s, -1.2-off, 0, 0, 0, -math.pi/2, 0)
	end
	if  not mgShapeIsBroken(sides[2]) then
		mgBodyDecal(b, 59, s, s, 1.2+off, 0, 0, 0, -math.pi/2, 0)
	end
	if  not mgShapeIsBroken(sides[3]) then
		mgBodyDecal(b, 59, s, s, 0, -off, 0, math.pi/2, 0, 0)
	end
	if  not mgShapeIsBroken(sides[4]) then
		mgBodyDecal(b, 59, s, s, 0, off, 0, -math.pi/2, 0, 0)
	end
	if  not mgShapeIsBroken(sides[5]) then
		mgBodyDecal(b, 59, s, s, 0, 0, -off, math.pi, 0, 0)
	end
	if  not mgShapeIsBroken(sides[6]) then
		mgBodyDecal(b, 59, s, s, -0.6-off, -off, 0, math.pi/2, 0, 0)
	end
	if  not mgShapeIsBroken(sides[7]) then
		mgBodyDecal(b, 59, s, s, -0.6-off, off, 0, math.pi/2, 0, 0)
	end
	if  not mgShapeIsBroken(sides[8]) then
		mgBodyDecal(b, 59, s, s, 0.6+off, -off, 0, math.pi/2, 0, 0)
	end
	if  not mgShapeIsBroken(sides[9]) then
		mgBodyDecal(b, 59, s, s, 0.6+off, off, 0, math.pi/2, 0, 0)
	end
	if  not mgShapeIsBroken(sides[10]) then
		mgBodyDecal(b, 59, s, s, -1.2, 0, -off, math.pi, 0, 0)
	end
	if  not mgShapeIsBroken(sides[11]) then
		mgBodyDecal(b, 59, s, s, -1.2, 0, -off, math.pi, 0, 0)
	end
	if not mgIsCleared() then
		mgBodyDecal(b, 59, s, s, 0, 0, off, 0, 0, 0)
		mgBodyDecal(b, 59, s, s, -1.2, 0, off, 0, 0, 0)
		mgBodyDecal(b, 59, s, s, 1.2, 0, off, 0, 0, 0)
		mgBodyDecal(b, 6, 0.35, 0.35, 0, 0, 0.8, 0, 0, 0)
		mgBodyDecal(b, 17, light*2.5, light*2.5, 0, 0, 0.8, 0, 0, 0)
		mgBodyDecal(b, 17, light*1.0, light*1.0, 0, 0, 0.8, 0, 0, 0)
	end
end

