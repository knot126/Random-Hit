function init()
	cr,cg,cb = mgGetColor("color", 1,1,1)
	sizeX = mgGetFloat("sizeX", 0.5)
	sizeY = mgGetFloat("sizeY", 0.5)
	sizeZ = mgGetFloat("sizeZ", 0.5)
	strength = mgGetFloat("strength", 0.1)
	ray = mgGetBool("raycast", false)
	
	local yPos = 0
	if ray then
		local tmp,x,y,z = mgRaycast(0,0,0,0,-10,0)
		yPos = y
	end

	mgMaterial("glass")
	mgColor(cr,cg,cb,1,1)
	mgForceLimit(strength)
	b = mgCreateBody(0, sizeY*0.5+yPos, 0)
	mgCreateBox(b, sizeX*0.5, sizeY*0.5, sizeZ*0.5)
end


