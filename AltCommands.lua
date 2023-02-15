local main = "AL3xvPlays"
local alt = game.Players.LocalPlayer
local annoy = false
if game.Players:FindFirstChild(main) then
    game.Players[main].Chatted:connect(function(msg)
        print("Got msg "..msg)
		if string.find(msg, "bot:annoy:") then
            local plrtn = string.gsub(msg, "bot:annoy:", "")
            if game.Players:FindFirstChild(plrtn) then
                annoy = plrtn
            end
        elseif string.find(msg, "bot:unannoy") then
            annoy = false
        end
	end)
end
while true do
    if annoy != false then
        if game.Players:FindFirstChild(annoy) then
            alt.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players:FindFirstChild(annoy).Character:WaitForChild(HumanoidRootPart).Position)
        else
            annoy = false
        end end
    wait()
end