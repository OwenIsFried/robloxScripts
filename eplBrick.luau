-- Insert the script into the part you want to make blink.

local part = script.Parent

local function eplBrick(part)
	part.Material = "Neon"
	part.Anchored = true
	for i = 1, 50, 1 do
		part.BrickColor = BrickColor.new("White")
		part.Size = Vector3.new(1000,1,1000)
		task.wait(.1)
		part.BrickColor = BrickColor.new("Black")
		part.Size = Vector3.new(1000,1,1000)
		task.wait(.1)
	end
end

eplBrick(part)
