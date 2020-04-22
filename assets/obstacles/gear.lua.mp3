function getRot()
	return mgCameraDistance() * speed
end

function init()
	local radius = mgGetFloat("radius", 0.8)
	local thickness = mgGetFloat("thickness", 0.05)
	local cr,cg,cb = mgGetColor("color",1,1,1)
	local cogs = mgGetInt("cogs", 12)
	local cogw = mgGetFloat("cogw", 0.2)
	local cogh = mgGetFloat("cogh", 0.2)
	local axleradius = mgGetFloat("axleradius", 0.1)
	local axlelength = mgGetFloat("axlelength", 1.0)
	speed = mgGetFloat("speed", 1)

	b = mgCreateBody()
	mgMaterial("steel")
	mgCreateCylinder(b, axleradius, axlelength, 0, 0, 0, 0, 1.57, 0)

	mgMaterial("glass")
	mgColor(cr,cg,cb)

	mgShapeChamfer(0)
	mgCreateCylinder(b, radius, thickness + 0.03, 0, 0, 0, 0, 1.57, 0)
	mgShapeChamfer(0)

	local r = radius+cogh*0.5 - 0.05
	for i=0,cogs-1 do
		ang = i/cogs*2*math.pi
		mgCreateBox(b, cogh*0.5, cogw*0.5, thickness, math.cos(ang)*r, math.sin(ang)*r, 0, 0, 0, ang)
	end

	mgMove(b,0,0,0)
end

function tick()
	mgRotate(b, 0, 0, getRot())
end
