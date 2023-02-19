-- Library
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
-- Vars
local ws = 16
local jp = 50
local rws = false
local rjp = false
local hlth = 100
local rhlth = false
local plr = game.Players.LocalPlayer
local char = plr.Character
local hum = char:WaitForChild("Humanoid")
local root = char:WaitForChild("HumanoidRootPart")
-- Gui
local Window = Rayfield:CreateWindow({
   Name = "Alexv Hub Universal",
   LoadingTitle = "Loading Alexv Hub - Universal",
   LoadingSubtitle = "by AlexvPlays",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = "AlexvHubUniversal", -- Create a custom folder for your hub/game
      FileName = "AlexvUniversal"
   },
   Discord = {
      Enabled = false,
      Invite = "SIRIUS", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD.
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Sirius Hub",
      Subtitle = "Key System",
      Note = "Join the discord (discord.gg/sirius)",
      FileName = "SiriusKey",
      SaveKey = true,
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = "Hello"
   }
})
local Tab = Window:CreateTab("Home", 10723407389) -- Title, Image
local Button = Tab:CreateButton({
   Name = "Destroy GUI, script",
   Callback = function()
    Rayfield:Destroy()
    script:Destroy()
   end,
})
local Tab = Window:CreateTab("Local player", 10734920149) -- Title, Image
local SliderWS = Tab:CreateSlider({
    Name = "Walk speed",
    Range = {0, 600},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "SliderWS", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    ws = Value
    end,
 })
 local Button = Tab:CreateButton({
    Name = "Change walk speed",
    Callback = function()
    hum.WalkSpeed = ws
    end,
 })
 local Toggle = Tab:CreateToggle({
    Name = "Repeatedly change walk speed",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    rws = Value
    end,
 })
 local SliderJP = Tab:CreateSlider({
    Name = "Jump power",
    Range = {0, 1000},
    Increment = 1,
    Suffix = "Power",
    CurrentValue = 16,
    Flag = "SliderJP", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    jp = Value
    end,
 })
 local Button = Tab:CreateButton({
    Name = "Change jump power",
    Callback = function()
    hum.JumpPower = jp
    end,
 })
 local Toggle = Tab:CreateToggle({
    Name = "Repeatedly change jump power",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    rjp = Value
    end,
 })
 local SliderHLTH = Tab:CreateSlider({
    Name = "Humanoid health",
    Range = {0, 100},
    Increment = 1,
    Suffix = "health",
    CurrentValue = 99,
    Flag = "SliderHLTH", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    hlth = Value
    end,
 })
 local Button = Tab:CreateButton({
    Name = "Change health",
    Callback = function()
    hum.Health = hlth
    end,
 })
 local Toggle = Tab:CreateToggle({
    Name = "Repeatedly change health",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    rhlth = Value
    end,
 })
plr.CharacterAdded:Connect(function()
    char = plr.Character
    hum = char:WaitForChild("Humanoid")
    root = char:WaitForChild("HumanoidRootPart")
end)
local Tab = Window:CreateTab("Camera", 10709789686) -- Title, Image
local Slider = Tab:CreateSlider({
    Name = "Camera FOV",
    Range = {0, 120},
    Increment = 1,
    Suffix = "field of view",
    CurrentValue = workspace.Camera.FieldOfView,
    Flag = "Slider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        workspace.CurrentCamera.FieldOfView = Value
    end,
 })
 local Dropdown = Tab:CreateDropdown({
   Name = "Camera type",
   Options = {"Attach","Custom", "Fixed", "Follow", "Orbital", "Scriptable", "Track", "Watch"},
   CurrentOption = workspace.Camera.CameraType.Name,
   Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Option)
   workspace.Camera.CameraType = Option
   end,
})
local Dropdown = Tab:CreateDropdown({
   Name = "Camera mode",
   Options = {"Classic","LockFirstPerson"},
   CurrentOption = "Classic",
   Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Option)
   plr.CameraMode = Option
   end,
})
local Slider = Tab:CreateSlider({
   Name = "Max zoon distance",
   Range = {0, 100000},
   Increment = 2,
   Suffix = "Distance",
   CurrentValue = plr.CameraMaxZoomDistance,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   plr.CameraMaxZoomDistance = Value
   end,
})
local Slider = Tab:CreateSlider({
   Name = "Min zoon distance",
   Range = {0.5, 1000},
   Increment = 2,
   Suffix = "Distance",
   CurrentValue = plr.CameraMaxZoomDistance,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   plr.CameraMinZoomDistance = Value
   end,
})
-- Loop
while true do
    if rws == true then
        hum.WalkSpeed = ws
    end
    if rjp == true then
        hum.JumpPower = jp
    end
    if rhlth == true then
        hum.Health = hlth
    end
    wait()
end