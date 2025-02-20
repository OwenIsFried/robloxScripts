local part = script.Parent


local function moveBrick(part, studs, axis, speed)
	
	part.Anchored = true
	
	for i = 1, studs * (1 / speed), 1 do
		
		part.Position = Vector3.new(part.Position.X, part.Position.Y, part.Position.Z)
		
		if axis == "x" then
			part.Position = Vector3.new(part.Position.X + speed, part.Position.Y, part.Position.Z)
		elseif axis == "y" then
			part.Position = Vector3.new(part.Position.X, part.Position.Y + speed, part.Position.Z)
		else
			part.Position = Vector3.new(part.Position.X, part.Position.Y, part.Position.Z + speed)
		end
		
		task.wait(.01)
		
	end
end

moveBrick(part, 50, "y", 3)
