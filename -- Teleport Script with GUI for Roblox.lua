-- Teleport Script with GUI for Roblox Executors

-- Create a ScreenGui
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local PlayerInput = Instance.new("TextBox")
local TeleportButton = Instance.new("TextButton")
local ExitButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")
local StatusLabel = Instance.new("TextLabel")

-- Set up the GUI properties
ScreenGui.Parent = game.CoreGui
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 300, 0, 250)
Frame.Position = UDim2.new(0.5, -150, 0.5, -125)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0

-- Title Label
TitleLabel.Parent = Frame
TitleLabel.Size = UDim2.new(1, 0, 0, 50)
TitleLabel.Text = "Teleport to Player"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 24

-- Player Input Box
PlayerInput.Parent = Frame
PlayerInput.Size = UDim2.new(1, -20, 0, 50)
PlayerInput.Position = UDim2.new(0, 10, 0, 60)
PlayerInput.PlaceholderText = "Enter Player Name"
PlayerInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PlayerInput.TextColor3 = Color3.fromRGB(0, 0, 0)

-- Teleport Button
TeleportButton.Parent = Frame
TeleportButton.Size = UDim2.new(0, 100, 0, 50)
TeleportButton.Position = UDim2.new(0, 10, 0, 120)
TeleportButton.Text = "Teleport"
TeleportButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
TeleportButton.TextColor3 = Color3.fromRGB(0, 0, 0)

-- Exit Button
ExitButton.Parent = Frame
ExitButton.Size = UDim2.new(0, 100, 0, 50)
ExitButton.Position = UDim2.new(0, 110, 0, 120)
ExitButton.Text = "Exit"
ExitButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
ExitButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Minimize Button
MinimizeButton.Parent = Frame
MinimizeButton.Size = UDim2.new(0, 100, 0, 50)
MinimizeButton.Position = UDim2.new(0, 210, 0, 120)
MinimizeButton.Text = "Minimize"
MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
MinimizeButton.TextColor3 = Color3.fromRGB(0, 0, 0)

-- Status Label
StatusLabel.Parent = Frame
StatusLabel.Size = UDim2.new(1, 0, 0, 50)
StatusLabel.Position = UDim2.new(0, 0, 0, 180)
StatusLabel.Text = ""
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
StatusLabel.Font = Enum.Font.SourceSans
StatusLabel.TextSize = 18

-- Function to teleport to a player
function teleportToPlayer(playerName)
    local player = game.Players:FindFirstChild(playerName)
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local localPlayer = game.Players.LocalPlayer
        if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
            localPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
            StatusLabel.Text = "Teleported to " .. playerName
        else
            StatusLabel.Text = "Your character is not available."
        end
    else
        StatusLabel.Text = "Player not found."
    end
end

-- Connect button functions
TeleportButton.MouseButton1Click:Connect(function()
    local playerName = PlayerInput.Text
    if playerName ~= "" then
        teleportToPlayer(playerName)
    else
        StatusLabel.Text = "Please enter a player name."
    end
end)

-- Exit Button functionality
ExitButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Minimize Button functionality (Hide and restore the frame)
MinimizeButton.MouseButton1Click:Connect(function()
    -- Toggle visibility of the frame, but don't destroy or close it
    Frame.Visible = not Frame.Visible
    
    -- Change the text of the Minimize button to either Minimize or Restore
    MinimizeButton.Text = Frame.Visible and "Minimize" or "Restore"
end)

