local player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local mousePOS = UIS:GetMouseLocation()

player.CharacterAdded:Connect(function(char)
	character = char
	humanoid = character:WaitForChild("Humanoid")
end)

local function getModelMass(model: Model): number
	local mass = 0

	for _, v in ipairs(model:GetDescendants()) do
		if v:IsA('BasePart') then
			mass += v:GetMass()
		end
	end

	return mass
end

local mass = getModelMass(character)
local fowardForce = mass * 125
local upForce = mass * 20
local dashCD = {true, script.Cooldown.Value}

UIS.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.E then
			
			if dashCD[1] then
				
				dashCD[1] = false

				character.HumanoidRootPart:ApplyImpulse(character.HumanoidRootPart.CFrame.LookVector * 
					fowardForce + Vector3.new(0,upForce,0))
				
				wait(dashCD[2])
				dashCD[1] = true
				
			else
				
				print("Your dash is currently on cooldown!")
				
			end
		end
	end
end)
