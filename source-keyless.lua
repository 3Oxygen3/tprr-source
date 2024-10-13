local Player = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")

local isTeleporting = false
local heartbeatConnection

local function sendNotification(title, text)
    StarterGui:SetCore("SendNotification", {
        Title = title;
        Text = text;
        Duration = 5;
    })
end

sendNotification("Welcome!", "Script made by 3Oxygen3")
wait(3)
sendNotification("Script Ready.", "Happy Farming!")

local ScreenGui = Instance.new("ScreenGui", Player:WaitForChild("PlayerGui"))
local StatusLabel = Instance.new("TextLabel", ScreenGui)

StatusLabel.Size = UDim2.new(0, 200, 0, 50)
StatusLabel.Position = UDim2.new(1, -210, 0, 10)
StatusLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.TextScaled = true
StatusLabel.BorderSizePixel = 0
StatusLabel.BackgroundTransparency = 0
StatusLabel.Text = "Tape Farm Status: Off"

local corner = Instance.new("UICorner", StatusLabel)

local function onInputBegan(input, gameProcessed)
    if gameProcessed then return end

    if input.KeyCode == Enum.KeyCode.J then
        isTeleporting = not isTeleporting
        StatusLabel.Text = "Tape Farm Status: " .. (isTeleporting and "On" or "Off")
    elseif input.KeyCode == Enum.KeyCode.X then
        if heartbeatConnection then
            heartbeatConnection:Disconnect()
        end
        ScreenGui:Destroy()
    end
end

print("Script made by 3Oxygen3 on github/WHACKAPACK on Scriptblox")

UserInputService.InputBegan:Connect(onInputBegan)

heartbeatConnection = RunService.Heartbeat:Connect(function()
    if isTeleporting then
        local tape = game.Workspace:FindFirstChild("Tape")
        if tape then
            tape.CFrame = Player.Character.HumanoidRootPart.CFrame
        else
            print("Couldn't find Tape")
        end
    end
end)
