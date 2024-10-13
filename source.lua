getgenv().userInputKey = "23Apples" --this must match the local requiredkey for the script to work


local Player = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")

local requiredKey = "23Apples" --change this to whatever you wanna make the key
local isTeleporting = false
local heartbeatConnection

local userInputKey = getgenv().userInputKey

local function isKeyValid(inputKey)
    return inputKey == requiredKey
end

local function sendNotification(title, text)
    StarterGui:SetCore("SendNotification", {
        Title = title;
        Text = text;
        Duration = 5;
    })
end

if not isKeyValid(userInputKey) then
    sendNotification("Invalid Key", "Please try again.")
    return
end

sendNotification("Key Accepted", "You may proceed.")
--sendNotification("Join the Discord for the key!", ".gg/YOURDISCORD")

local ScreenGui = Instance.new("ScreenGui", Player:WaitForChild("PlayerGui"))
local StatusLabel = Instance.new("TextLabel", ScreenGui)

StatusLabel.Size = UDim2.new(0, 200, 0, 50)
StatusLabel.Position = UDim2.new(1, -210, 0, 10)
StatusLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.TextScaled = true
StatusLabel.BorderSizePixel = 0
StatusLabel.BackgroundTransparency = 0
StatusLabel.Text = "Farm Status: Off"

local corner = Instance.new("UICorner", StatusLabel)

local function onInputBegan(input, gameProcessed)
    if gameProcessed then return end

    if input.KeyCode == Enum.KeyCode.J then
        isTeleporting = not isTeleporting
        StatusLabel.Text = "Farm Status: " .. (isTeleporting and "On" or "Off")
    elseif input.KeyCode == Enum.KeyCode.X then
        if heartbeatConnection then
            heartbeatConnection:Disconnect()
        end
        ScreenGui:Destroy()
    end
end

print("Script Made by 3Oxygen3 on github")

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
