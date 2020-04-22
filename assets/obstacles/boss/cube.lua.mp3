sides = {}
broken = {false, false, false, false, false}

obstacleBody = {}
angX = 0
angY = 0
angZ = 0
tx = 0
ty = 0
tz = 0
attackZ = 0
light = 0

glassDef = {}
glassShape = {}
glassBroken = {}

s = 0.6
t = 0.01

function addGlass(x, y, z, nx, ny, nz)
	i = #glassDef+1
	glassDef[i] = {x, y, z, nx, ny, nz, false}
	glassBroken[i] = false
end

function buildGlass()
	mgMaterial("glass")
	mgColor(cr,cg,cb)
	mgShapeChamfer(0)
	mgMask(0)
	mgRoundness(0.3)
	for i=1, #glassDef do
		local x = glassDef[i][1] local y = glassDef[i][2] local z = glassDef[i][3]
		local nx = glassDef[i][4] local ny = glassDef[i][5] local nz = glassDef[i][6]
		glassShape[i] = mgCreateBox(b, s-(s-t)*math.abs(nx), s-(s-t)*math.abs(ny), s-(s-t)*math.abs(nz), x*s+nx*t, y*s+ny*t, z*s+nz*t)
	end
end

function init()
	type = mgGetInt("type", 1)
	distance = mgGetFloat("distance", 15)
	cr,cg,cb = mgGetColor("color", 1, 0 ,0)
	mr,mg,mb = mgGetColor("metalcolor", 1, 1 ,1)
	cycle = mgGetInt("cycle", 500)
	attackDistance = mgGetFloat("attackDistance", 0)
	waitDistance = mgGetFloat("waitDistance", 0)
	shots = mgGetInt("shots", 3)
	
	if mgGetString("offset", "rnd") == "rnd" then
		offset = mgRndFloat(0, 10)
	else
		offset = mgGetFloat("offset", 0)
	end

	b = mgCreateBody(0, 1, 0)

	mgMaterial("steel")
	mgShapeChamfer(0.03)
	mgRoundness(0.7)
	mgColor(0,0,0)
	mgMask(128)
	if type==1 then
		mgCreateBox(b, s*1, s, s, 0, 0, 0)
	elseif type == 2 then
		mgCreateBox(b, s*3, s, s, 0, 0, 0)
	elseif type == 3 then
		mgCreateBox(b, s, s, s, 0, 2*s, 0)
		mgCreateBox(b, s*3, s, s, 0, 0, 0)
		mgCreateBox(b, s, s, s, 0, -2*s, 0)
	end
	
	mgMask(64)
	local q = 0.2
	if type==1 then
		mgCreateBox(b, s-q, s-q, sp, 0, 0, 0)
	elseif type == 2 then
		mgCreateBox(b, s*3-q, s-q, s-q, 0, 0, 0)
	elseif type == 3 then
		mgCreateBox(b, s-q, s-q, s-q, 0, 2*s, 0)
		mgCreateBox(b, s*3-q, s-q, s-q, 0, 0, 0)
		mgCreateBox(b, s-q, s-q, s-q, 0, -2*s, 0)
	end
	mgColor(mr,mg,mb)

	mgShapeChamfer(0.0)
	mgRoundness(0.0)
	mgMask(0)
	local tc=t

	mgMask(0)
	mgShapeChamfer(0.0)
	mgCreateCylinder(b, 0.3, 0.3, 0, 0, s-0.15, 0, 0.5*math.pi, 0)
	mgColor(0, 0, 0)
	mgCreateCylinder(b, 0.25, 0.02, 0, 0, s+0.15, 0, 0.5*math.pi, 0)
	mgColor(0, 0, 0, 1)
	mgCreateBox(b, s-t, s-t, s-t)

	if type==1 then
		addGlass(1, 0, 0, 1, 0, 0)
		addGlass(-1, 0, 0, -1, 0, 0)
		addGlass(0, 1, 0, 0, 1, 0)
		addGlass(0, -1, 0, 0, -1, 0)
		addGlass(0, 0, -1, 0, 0, -1)
	elseif type == 2 then
		addGlass(3, 0, 0, 1, 0, 0)
		addGlass(-3, 0, 0, -1, 0, 0)
		addGlass(0, 1, 0, 0, 1, 0)
		addGlass(0, -1, 0, 0, -1, 0)
		addGlass(-2, 1, 0, 0, 1, 0)
		addGlass(-2, -1, 0, 0, -1, 0)
		addGlass(2, 1, 0, 0, 1, 0)
		addGlass(2, -1, 0, 0, -1, 0)
		addGlass(0, 0, -1, 0, 0, -1)
		addGlass(-2, 0, -1, 0, 0, -1)
		addGlass(-2, 0, 1, 0, 0, 1)
		addGlass(2, 0, -1, 0, 0, -1)
		addGlass(2, 0, 1, 0, 0, 1)
	elseif type == 3 then
		addGlass(3, 0, 0, 1, 0, 0)
		addGlass(-3, 0, 0, -1, 0, 0)
		addGlass(1, 2, 0, 1, 0, 0)
		addGlass(-1, 2, 0, -1, 0, 0)
		addGlass(1, -2, 0, 1, 0, 0)
		addGlass(-1, -2, 0, -1, 0, 0)
		addGlass(0, 3, 0, 0, 1, 0)
		addGlass(0, -3, 0, 0, -1, 0)
		addGlass(-2, 1, 0, 0, 1, 0)
		addGlass(-2, -1, 0, 0, -1, 0)
		addGlass(2, 1, 0, 0, 1, 0)
		addGlass(2, -1, 0, 0, -1, 0)
		addGlass(0, 0, -1, 0, 0, -1)
		addGlass(-2, 0, -1, 0, 0, -1)
		addGlass(-2, 0, 1, 0, 0, 1)
		addGlass(2, 0, -1, 0, 0, -1)
		addGlass(2, 0, 1, 0, 0, 1)
		addGlass(0, 2, -1, 0, 0, -1)
		addGlass(0, 2, 1, 0, 0, 1)
		addGlass(0, -2, -1, 0, 0, -1)
		addGlass(0, -2, 1, 0, 0, 1)
	end
		
	buildGlass()

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
	local active = (waitDistance == 0 or mgIsClosestBoss())
	
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
	if active then
		if c > cycle-150 then
			mgSet("level.bossattack", "1")
		else
			mgSet("level.bossattack", "0")
		end
		if c > cycle-150 and c < cycle-100 then
			t = (c-(cycle-150))/50
			t = (1.0 - math.cos(t*math.pi)) * 0.5
			attackZ = attackDistance * t
			light = t*10
			if light > 1 then light = 1 end
			mgSet("level.bossattack", "1")
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
		if c > cycle-76 and c < cycle and c % math.floor(75/shots) == 0 then
			local x,y,z = mgBodyPointToWorld(b, 0, 0, 0.7)
			fireCube(x,y,z)
		end
	end
end

function tick()
	if mgIsCleared() then return end

	for i=1,#glassDef do
		local nx = glassDef[i][4]
		local ny = glassDef[i][5]
		local nz = glassDef[i][6]
		local vx,vy,vz = mgBodyVecToWorld(b, nx, ny, nz)
		if vz >0.4 then 
			mgSetShapeMask(glassShape[i], 64) 
		else
			mgSetShapeMask(glassShape[i], 0) 
		end
	end

	local t = mgTime()
	d = mgCameraDistance()
	
	local done = true
	for i=1, #glassDef do
		if mgShapeIsBroken(glassShape[i]) then
			if not glassBroken[i] then
				mgPlaySound(offSnd)
				mgSetShapeColor(glassShape[i], 1, 1, 1)
				glassBroken[i] = true
			end
		else
			done = false
		end
	end
		
	local x = 1.3*math.sin(1.0*t+offset)
	local y = 1.2*math.sin(0.7*t+offset)
	local z = -distance+d + attackZ
	
	if not mgIsClosestBoss() then
		z = z - waitDistance
	end

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
	local offset = 0.07
	local size = 0.77
	for i=1, #glassDef do
		if not glassBroken[i] then 
			local x = glassDef[i][1] local y = glassDef[i][2] local z = glassDef[i][3]
			local nx = glassDef[i][4] local ny = glassDef[i][5] local nz = glassDef[i][6]
			local rx=0 local ry=0 local rz=0
			if nx == 1 then ry = -math.pi/2 end
			if nx == -1 then ry = math.pi/2 end
			if ny == 1 then rx = -math.pi/2 end
			if ny == -1 then rx = math.pi/2 end
			mgBodyDecal(b, 59, size, size, x*s+nx*offset, y*s+ny*offset, z*s+nz*offset, rx, ry, rz)	
		end
	end
	if not mgIsCleared() then
		mgBodyDecal(b, 59, size, size, 0, 0, s+offset, 0, 0, 0)
		mgBodyDecal(b, 6, 0.35, 0.35, 0, 0, 0.8, 0, 0, 0)
		mgBodyDecal(b, 17, light*2.5, light*2.5, 0, 0, 0.8, 0, 0, 0)
		mgBodyDecal(b, 17, light*1.0, light*1.0, 0, 0, 0.8, 0, 0, 0)
	end
end

