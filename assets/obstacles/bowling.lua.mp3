function init()
	mgMaterial("glass")
	mgColor(1,1,1)
	mgDensity(0.7)

	yPos = -0.1
	
	pins = {}
	pinX = {}
	pinZ = {}
	local s = 0.6
	local i = 1
	mgForceLimit(0.07)
	mgShapeScale(0.1, 0.25, 0.1)
	for z=0, 3 do
		for x=1, 3-z do
			pinX[i] = (x-2)*s+z/2*s
			pinZ[i] = (z-1.5)*s
			pins[i] = mgCreateBody(pinX[i], 0, pinZ[i], 0, 0.77)
			
			mgCreateMesh(pins[i], "pin", 0, 0.4-0.1, 0)
			i = i + 1
		end
	end
	mgShapeScale(1)
	
	elevator = mgCreateBody()
	mgMaterial("steel")
	mgStatic(2)
	mgCreateBox(elevator, 0.95, 0.1, 0.95)
	mgMove(elevator, 0, yPos, 0, 5, 1)
	t = mgTime()
	
	egg = tonumber(mgGet("level.egg"))
	done = false
end

function tick()
	local newEgg = tonumber(mgGet("level.egg"))
	if newEgg > egg then
		yPos = yPos - 2
		mgMove(elevator, 0, yPos, 0, 5, 1)
		t = mgTime();
		egg = newEgg
	end
	if not done then
		done = true
		for i=1, #pins do
			local x,y,z = mgGetPos(pins[i])
			local d = math.abs(x-pinX[i]) + math.abs(z-pinZ[i])
			if d < 0.05 then
				done = false
			end
		end
		if done then
			mgSet("level.egg", tonumber(mgGet("level.egg"))+1)
		end
	end
end

