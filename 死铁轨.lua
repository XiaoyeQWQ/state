if LnScript == "By Ln" and Roblox == "免费" and LNTeam == "死铁轨" then
setclipboard("点击链接加入创作者群https://qm.qq.com/q/KrzGUT424M")
--终点Position:-388.7542419433594, 3.0372979640960693, -49209.23828125
--终点CFrame:-388.754242, 3.03750157, -49209.2383, -0.999949098, -0.00167516188, 0.00994820427, -0.00070178177, 0.995278955, 0.0970534235, -0.0100638187, 0.0970415026, -0.995229483
local LPName = game:GetService("Players").LocalPlayer.Name

if workspace[LPName] then
    if workspace[LPName].AntiSlideClientTest then
        workspace[LPName].AntiSlideClientTest:Destroy()
    end
    if workspace[LPName].AntiSlide then
        workspace[LPName].AntiSlide:Destroy()
    end
    if workspace[LPName].AntiFling then
        workspace[LPName].AntiFling:Destroy()
    end
end

local items = {}
local SelectItem = ""
for i,v in ipairs(workspace.RuntimeItems:GetChildren()) do
    items[i] = v.Name
end

local function RefreshItem()
    items = {}
    for i,v in ipairs(workspace.RuntimeItems:GetChildren()) do
        items[i] = v.Name
    end
end

local dropdown = {}
local playernamedied = ""

for i, player in ipairs(game:GetService("Players"):GetPlayers()) do
    if player.Name ~= game.Players.LocalPlayer.Name then
        dropdown[i] = player.Name
    end
end

local function RefreshPlayer()
    dropdown = {}
    for i, player in ipairs(game:GetService("Players"):GetPlayers()) do
        if player.Name ~= game.Players.LocalPlayer.Name then
            dropdown[i] = player.Name
        end
    end
end

local speeds = 5
local nowe = false
local tpwalking = false
local speaker = game:GetService("Players").LocalPlayer
local heartbeat = game:GetService("RunService").Heartbeat

local function updatespeed(char, hum)
	if nowe == true then
		tpwalking = false
		heartbeat:Wait()
		task.wait(.1)
		heartbeat:Wait()

		for i = 1, speeds do
			spawn(function()
				tpwalking = true

				while tpwalking and heartbeat:Wait() and char and hum and hum.Parent do
					if hum.MoveDirection.Magnitude > 0 then
						char:TranslateBy(hum.MoveDirection)
					end
				end
			end)
		end
	end
end

speaker.CharacterAdded:Connect(function(char)
	local char = speaker.Character
	if char then
		task.wait(0.7)
		char.Humanoid.PlatformStand = false
		char.Animate.Disabled = false
	end
end)

local mainloop = false
local message = ""
local moneyitem = ""
local itemsConnection
local EnemyConnection
local buildConnection
local zombieConnection
local bankConnection

function Notification(Title, Text, dur)
game:GetService("StarterGui"):SetCore("SendNotification",{Title = Title,Text = Text,Duration = dur,})
end

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/KingScriptAE/No-sirve-nada./main/%E9%9C%96%E6%BA%BA%E8%84%9A%E6%9C%ACUI.lua"))()

local window = library:new("霖溺脚本┋死铁轨")

local Page = window:Tab("主页",'16060333448')
local Page1 = window:Tab("人物功能",'16060333448')
local Page2 = window:Tab("物品功能",'16060333448')
local Page3 = window:Tab("传送功能",'16060333448')
local Page4 = window:Tab("其他功能",'16060333448')
local Page5 = window:Tab("通知功能",'16060333448')
local Page6 = window:Tab("透视功能",'16060333448')

local info = Page:section("作者信息",true)
local Player = Page1:section("人物功能",true)
local Fly = Page1:section("飞行功能",true)
local Train = Page2:section("火车功能",true)
local Item = Page2:section("物品功能",true)
local Teleport = Page3:section("传送功能",true)
local Other = Page4:section("其他功能",true)
local Notify = Page5:section("通知功能",true)
local ESP = Page6:section("透视功能",true)

info:Label("主作者:霖溺 副作者:月星")
info:Label("国内第二个死铁轨脚本")
info:Button("复制我的群聊", function()
setclipboard("点击链接加入群聊：https://qm.qq.com/q/KrzGUT424M")
end)
local money = info:Label("你的金钱:"..game.Players.LocalPlayer.leaderstats.Money.Value)

spawn(function()
    while state do wait()
        pcall(function()
            money.Text = "你的金钱:"..game.Players.LocalPlayer.leaderstats.Money.Value
        end)
    end
end)

Player:Toggle("速度 (开/关)","开关",false,function(v)
    if v == true then
        sudu = game:GetService("RunService").Heartbeat:Connect(function()
            if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Humanoid and game:GetService("Players").LocalPlayer.Character.Humanoid.Parent then
                if game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
                    game:GetService("Players").LocalPlayer.Character:TranslateBy(game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * Speed / 10)
                 end
             end
         end)
    elseif not v and sudu then
        sudu:Disconnect()
        sudu = nil
    end
end)

Player:Slider('速度设置', 'Slider',  1, 1, 1000,false, function(v)
    Speed = v
end)

Fly:Toggle("飞行", "Fly", false, function(Value)
	local char = speaker.Character
	if not char or not char.Humanoid then
		return
	end

	local hum = char.Humanoid
	if nowe == true then
		nowe = false

		hum:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.Running,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
		hum:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
		hum:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)	
	else
		nowe = true
		updatespeed(char, hum)

		char.Animate.Disabled = true
		for i,v in next, hum:GetPlayingAnimationTracks() do
			v:AdjustSpeed(0)
		end

		hum:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.Running,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
		hum:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
		hum:ChangeState(Enum.HumanoidStateType.Swimming)
	end
    
    local function CheckRig()
        if speaker.Character and speaker.Character:FindFirstChild("Torso") then
                return speaker.Character.Torso
        elseif speaker.Character and speaker.Character:FindFirstChild("LowerTorso") then
                return speaker.Character.LowerTorso
        end
    end


	local UpperTorso = CheckRig()
	local flying = true
	local deb = true
	local ctrl = {f = 0, b = 0, l = 0, r = 0}
	local lastctrl = {f = 0, b = 0, l = 0, r = 0}
	local maxspeed = 50
	local speed = 0

	local bg = Instance.new("BodyGyro", UpperTorso)
	bg.P = 9e4
	bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
	bg.cframe = UpperTorso.CFrame

	local bv = Instance.new("BodyVelocity", UpperTorso)
	bv.velocity = Vector3.new(0,0.1,0)
	bv.maxForce = Vector3.new(9e9, 9e9, 9e9)

	if nowe == true then
		hum.PlatformStand = true
	end

	while nowe == true or hum.Health == 0 do
		task.wait()

		if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
			speed = speed+.5+(speed/maxspeed)
			if speed > maxspeed then
				speed = maxspeed
			end
		elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
			speed = speed-1
			if speed < 0 then
				speed = 0
			end
		end
		if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
			bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
		elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
			bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
		else
			bv.velocity = Vector3.new(0,0,0)
		end

		bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
	end

	ctrl = {f = 0, b = 0, l = 0, r = 0}
	lastctrl = {f = 0, b = 0, l = 0, r = 0}
	speed = 0
	bg:Destroy()
	bv:Destroy()

	hum.PlatformStand = false
	char.Animate.Disabled = false
	tpwalking = false
end, false)

Fly:Button("速度 + 1", function()
	local char = speaker.Character
	if char and char.Humanoid then
		local hum = char.Humanoid
		speeds = speeds + 1
		updatespeed(char, hum)
		end
end)

Fly:Button("速度 - 1", function()
	local char = speaker.Character
	if char and char.Humanoid then
		local hum = char.Humanoid
		if speeds > 1 then
			speeds = speeds - 1
			updatespeed(char, hum)
		end
    end
end)

Fly:Button("上升", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
end)

Fly:Button("下降", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
end)

local Flyspeed = Fly:Label("当前速度:"..speeds)
spawn(function()
    while wait() do
        pcall(function()
            Flyspeed.Text = "当前速度:".. speeds
        end)
    end
end)

Train:Button("绑定附近物品", function()
    for i,v in ipairs(workspace.RuntimeItems:GetChildren()) do
        workspace.RuntimeItems[v.Name]:SetPrimaryPartCFrame(CFrame.new(workspace.Train.Platform:GetChildren()[9].Position + Vector3.new(0, 2, 0)))
        game:GetService("ReplicatedStorage").Shared.Remotes.Weld.RequestWeld:FireServer(workspace.RuntimeItems[v.Name],workspace.Train.Platform.Part)
    end
end)

Train:Button("解绑", "", false, function()
    for i,v in ipairs(workspace.RuntimeItems:GetChildren()) do
        game:GetService("ReplicatedStorage").Shared.Remotes.Weld.RequestUnweld:FireServer(workspace.RuntimeItems[v.Name])
    end
end)

local item = Item:Dropdown("选择物品", "", items, function(value)
    SelectItem = value
end)

spawn(function()
    while true do wait(2)
        pcall(function()
            RefreshItem()
            item:SetOptions(items)
        end)
    end
end)

Item:Button("传送过来选择物品", function()
    workspace.RuntimeItems[SelectItem]:SetPrimaryPartCFrame(CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 0, 2)))
end)

Item:Toggle("循环传送过来选择物品", "", false, function(state)
    mainloop = state
    if state then
        while mainloop do wait()
            workspace.RuntimeItems[SelectItem]:SetPrimaryPartCFrame(CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 0, 2)))
        end
    end
end)

Item:Toggle("循环传送过来全部物品", "", false, function(state)
    mainloop = state
    if state then
        while mainloop do wait()
            for i,v in ipairs(workspace.RuntimeItems:GetChildren()) do
                workspace.RuntimeItems[v.Name]:SetPrimaryPartCFrame(CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 0, 2)))
            end
        end
    end
end)

Item:Button("装选择物品", function()
    game:GetService("ReplicatedStorage").Remotes.StoreItem:FireServer(workspace.RuntimeItems[SelectItem])
end)

Item:Toggle("循环传送装选择物品", "", false, function(state)
    mainloop = state
    if state then
        while mainloop do wait()
            game:GetService("ReplicatedStorage").Remotes.StoreItem:FireServer(workspace.RuntimeItems[SelectItem])
        end
    end
end)

Item:Toggle("收集所有收集品", "", false, function(state)
    mainloop = state
    if state then
        while mainloop do wait()
            for i,v in ipairs(workspace.RuntimeItems:GetChildren()) do
                game:GetService("ReplicatedStorage").Remotes.StoreItem:FireServer(workspace.RuntimeItems[v.Name])
            end
        end
    end
end)

Item:Toggle("自动收集债券", "", false, function(state)
    mainloop = state
    if state then
        while mainloop do wait()
            bond = workspace.RuntimeItems:FindFirstChild("Bond")
            if bond then
            workspace.RuntimeItems.Bond:SetPrimaryPartCFrame(CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 0, 2)))
            game:GetService("ReplicatedStorage").Packages.ActivateObjectClient:FireServer(workspace.RuntimeItems.Bond)
            end
        end
    end
end)

Item:Toggle("自动刷债券", "", false, function(state)
    mainloop = state
    if state then
        while mainloop do wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-388.7542419433594, 3.0372979640960693, -49209.23828125)
            wait()
            bond = workspace.RuntimeItems:FindFirstChild("Bond")
            if bond then
                workspace.RuntimeItems.Bond:SetPrimaryPartCFrame(CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 0, 2)))
                game:GetService("ReplicatedStorage").Packages.ActivateObjectClient:FireServer(workspace.RuntimeItems.Bond)
            else
                game:shutdown()
            end
        end
    end
end)

Teleport:Toggle("传送到火车上面", "", false, function(state)
    mainloop = state
    if state then
        while mainloop do wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Train.Platform:GetChildren()[9].CFrame + Vector3.new(0, 1, 0)
        end
    end
end)

Teleport:Toggle("传送到驾驶椅上面", "", false, function(state)
    mainloop = state
    if state then
        while mainloop do wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Train.TrainControls.ConductorSeat.Part.CFrame + Vector3.new(0, 1, 0)
        end
    end
end)

Teleport:Toggle("传送到驾驶室", "", false, function(state)
    mainloop = state
    if state then
        while mainloop do wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Train.Train.Part.CFrame + Vector3.new(0, 1, 0)
        end
    end
end)

local Players = Teleport:Dropdown("选择玩家名字已开始下面的功能", 'Dropdown', dropdown, function(v)
    playernamedied = v
end)

spawn(function()
    while true do wait(2)
        pcall(function()
            RefreshPlayer()
            Players:SetOptions(dropdown)
        end)
    end
end)

Teleport:Toggle("循环传送玩家", "TeleportLoop", false, function(state)
    mainloop = state
    if state then
        while mainloop do
            local HumRoot = game.Players.LocalPlayer.Character.HumanoidRootPart
            local tp_player = game.Players:FindFirstChild(playernamedied)
            if tp_player and tp_player.Character and tp_player.Character.HumanoidRootPart then
               HumRoot.CFrame = tp_player.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
            end
            wait()
        end
    end
end)

Teleport:Button("绑定", function()
game:GetService("ReplicatedStorage").Shared.Remotes.Weld.RequestWeld:FireServer(workspace.RuntimeItems[playernamedied],workspace.Train.Platform.Part)
end)

Teleport:Button("解绑", function()
game:GetService("ReplicatedStorage").Shared.Remotes.Weld.RequestUnweld:FireServer(workspace.RuntimeItems[playernamedied])
end)

Other:Button("第三人称", "", false, function()
game.Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic
local old
old = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    if method == "SetCameraMode" or method == "SetFFCamera" then
        game.Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic
        return
    end

    return old(self, ...)
end)
end)

Other:Toggle("自动火车鸣声", "", false, function()
    mainloop = state
    if state then
        while mainloop do
            fireclickdeector(workspace.Train.TrainControls.Lever.HitBox.ClickDetector)
        end
    end
end)

Other:Toggle("自动拉终点开关", "", false, function()
    mainloop = state
    if state then
        while mainloop do
            workspace.Baseplates.FinalBasePlate.OutlawBase.Bridge.BridgeControl.Crank.Model.Mid.EndGame.MaxActivationDistance = math.huge
            fireproximityprompt(workspace.Baseplates.FinalBasePlate.OutlawBase.Bridge.BridgeControl.Crank.Model.Mid.EndGame)
        end
    end
end)

Other:Button("删除仙人掌和岩石", function()
    while true do
        wait()
        for i, v in ipairs(workspace.Decor:GetChildren()) do
            if v.Name == "Rock" then
                v:Destroy()
            end
        end
        for i, v in ipairs(workspace.Decor:GetChildren()) do
            if v.Name == "Cactus" then
                v:Destroy()
            end
        end
    end
end)

Other:Button("丢掉所有物品", function()
    for _=1,10 do
        game:GetService("ReplicatedStorage").Remotes.DropItem:FireServer()
    end
end)

Other:Toggle("显示燃油状态", "", false, function(state)
    local FuelGui = game.CoreGui:FindFirstChild("FuelGui")
    if not FuelGui then
        FuelGui = Instance.new("ScreenGui")
        FuelGui.Name = "FuelGui"
        FuelGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        FuelGui.Parent = game.CoreGui

        local FuelLabel = Instance.new("TextLabel")
        FuelLabel.Name = "FuelLabel"
        FuelLabel.BackgroundColor3 = Color3.new(1, 1, 1)
        FuelLabel.BackgroundTransparency = 1
        FuelLabel.BorderColor3 = Color3.new(0, 0, 0)
        FuelLabel.Position = UDim2.new(0.5, 100, 0.5, -25)
        FuelLabel.Size = UDim2.new(0, 135, 0, 50)
        FuelLabel.Font = Enum.Font.GothamSemibold
        FuelLabel.Text = "燃料: " .. workspace.Train.Fuel.Value .. " / 240"
        FuelLabel.TextColor3 = Color3.new(1, 1, 1)
        FuelLabel.TextScaled = true
        FuelLabel.TextSize = 14
        FuelLabel.TextWrapped = true
        FuelLabel.Parent = FuelGui
    end
    FuelGui.Enabled = state
    FuelGui.FuelLabel.Visible = state
    if state then
        game:GetService("RunService").RenderStepped:Connect(function()
            local fuelValue = workspace.Train.Fuel.Value
            FuelGui.FuelLabel.Text = "Fuel: " .. fuelValue .. " / 240"
            if fuelValue <= 50 then
                FuelGui.FuelLabel.TextColor3 = Color3.new(1, 0, 0)
            elseif fuelValue <= 150 then
                FuelGui.FuelLabel.TextColor3 = Color3.new(1, 165/255, 0)
            elseif fuelValue <= 240 then
                FuelGui.FuelLabel.TextColor3 = Color3.new(0, 1, 0)
            else
                FuelGui.FuelLabel.TextColor3 = Color3.new(1, 1, 1)
            end
        end)
    end
end)

Other:Toggle("自瞄", "Aligns the camera to the NPC's head", false, function(toggle)
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local Workspace = game:GetService("Workspace")
    
    local localPlayer = Players.LocalPlayer
    local character = localPlayer.Character or localPlayer:WaitForChild("Character")
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local camera = Workspace.CurrentCamera
    
    local AimbotCon = nil
    if toggle then
        if AimbotCon then
            AimbotCon:Disconnect()
        end

        AimbotCon = RunService.RenderStepped:Connect(function()
            local nearestNPC = nil
            local nearestDistance = math.huge

            for _, obj in ipairs(Workspace:GetChildren()) do
                if obj:IsA("Model")
                    and obj:FindFirstChild("Humanoid")
                    and obj.Humanoid.Health > 0
                    and obj:FindFirstChild("Head")
                    and obj:FindFirstChild("HumanoidRootPart")
                    and not Players:GetPlayerFromCharacter(obj) then

                    local npcHeadPosition = obj.Head.Position
                    local distance = (npcHeadPosition - humanoidRootPart.Position).magnitude

                    if distance < nearestDistance then
                        nearestDistance = distance
                        nearestNPC = obj
                    end
                end
            end

            if nearestNPC then
                local targetPosition = nearestNPC.Head.Position
                camera.CFrame = CFrame.new(camera.CFrame.p, targetPosition)
            end
        end)
    else
        if AimbotCon then
            AimbotCon:Disconnect()
            AimbotCon = nil
        end
        camera.CFrame = CFrame.new(camera.CFrame.p, humanoidRootPart.Position)
    end
end)

Notify:Toggle("夜晚提醒(声音提醒)", "", false, function(state)
    mainloop = state
    if state then
        while mainloop do wait()
            if workspace.Train.TrainControls.TimeDial.SurfaceGui.TextLabel.Text == "9:00 PM" then
                local sound = Instance.new("Sound")
                sound.SoundId = "rbxassetid://792323017"
                sound.Parent = game.Workspace
                sound:Play()
            end
        end
    end
end)

Notify:Toggle("今晚刷新什么怪", "", false, function(state)
    if state then
        local MonsterGui = Instance.new("ScreenGui", game.CoreGui)
        local MonsterMessage = Instance.new("TextLabel", MonsterGui)
        local UIGradient = Instance.new("UIGradient")
        
        MonsterGui.Name = "MonsterGui"
        MonsterGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        MonsterMessage.Name = "MonsterMessage"
        MonsterMessage.BackgroundColor3 = Color3.new(1, 1, 1)
        MonsterMessage.BackgroundTransparency = 1
        MonsterMessage.BorderColor3 = Color3.new(0, 0, 0)
        MonsterMessage.Position = UDim2.new(0.5, 100, 0.5, -25)
        MonsterMessage.Size = UDim2.new(0, 135, 0, 50)
        MonsterMessage.Font = Enum.Font.GothamSemibold
        MonsterMessage.Text = "今晚的怪物: "
        MonsterMessage.TextColor3 = Color3.new(1, 1, 1)
        MonsterMessage.TextScaled = true
        MonsterMessage.TextSize = 14
        MonsterMessage.TextWrapped = true
        
        MonsterGui.Enabled = state
        MonsterMessage.Visible = state
        
        UIGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
            ColorSequenceKeypoint.new(0.10, Color3.fromRGB(255, 127, 0)),
            ColorSequenceKeypoint.new(0.20, Color3.fromRGB(255, 255, 0)),
            ColorSequenceKeypoint.new(0.30, Color3.fromRGB(0, 255, 0)),
            ColorSequenceKeypoint.new(0.40, Color3.fromRGB(0, 255, 255)),
            ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 0, 255)),
            ColorSequenceKeypoint.new(0.60, Color3.fromRGB(139, 0, 255)),
            ColorSequenceKeypoint.new(0.70, Color3.fromRGB(255, 0, 0)),
            ColorSequenceKeypoint.new(0.80, Color3.fromRGB(255, 127, 0)),
            ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 255, 0)),
            ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 255, 0))
        }
        UIGradient.Rotation = 360
        UIGradient.Parent = MonsterMessage
        
        local TweenService = game:GetService("TweenService")
        local tweeninfo = TweenInfo.new(7, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
        local tween = TweenService:Create(UIGradient, tweeninfo, {Rotation = 360})
        tween:Play()
        game:GetService("RunService").RenderStepped:Connect(function()
            for i, v in ipairs(workspace.NightEnemies:GetChildren()) do
                if v:IsA("Model") then
                    if v.Name == "Wolf" then
                        MonsterMessage.Text = "今晚的怪物是狼"
                    elseif v.Name == "Werewolf" then
                        MonsterMessage.Text = "今晚的怪物是狼人"
                    elseif v.Name == "Vampire" then
                        MonsterMessage.Text = "今晚的怪物是吸血鬼"
                    elseif v.Name == "Walker" then
                        MonsterMessage.Text = "今晚的怪物是正常僵尸"
                    elseif v.Name == "Runner" then
                        MonsterMessage.Text = "今晚的怪物是奔跑僵尸"
                    end
                end
            end
        end)
    end
end)


Notify:Toggle("独角兽刷新提醒(价格150)(闹铃声)", "Notify Unicorn", false, function(state)
    mainloop = state
    if state then
        while mainloop do wait()
            for _, v in ipairs(workspace.RuntimeItems:GetChildren()) do
                if v:IsA("Model") and v.Name == "Unicorn" then
                    local sound = Instance.new("Sound") 
                    sound.SoundId = "rbxassetid://4203251375" 
                    sound.Parent = game.Workspace 
                    sound:Play() 
                end
            end
        end
    end
end)

ESP:Toggle("透视物品", "", false, function(state)
    if state then
        for _, v in ipairs(workspace.RuntimeItems:GetChildren()) do
            if v:IsA("Model") and not v:FindFirstChild("BillboardGui") then
                local billboard = Instance.new("BillboardGui")
                billboard.Parent = v
                billboard.Adornee = v
                billboard.Size = UDim2.new(0, 20, 0, 20)
                billboard.StudsOffset = Vector3.new(0, 3, 0)
                billboard.AlwaysOnTop = true

                local nameLabel = Instance.new("TextLabel")
                nameLabel.Parent = billboard
                nameLabel.Size = UDim2.new(1, 0, 1, 0)
                nameLabel.BackgroundTransparency = 1
                nameLabel.Text = v.Name
                nameLabel.TextColor3 = Color3.new(1, 0, 0)
                nameLabel.TextStrokeTransparency = 0.5
                nameLabel.TextScaled = true
            end
        end

        itemsConnection = workspace.RuntimeItems.ChildAdded:Connect(function(v)
            if v:IsA("Model") and not v:FindFirstChild("BillboardGui") and state then
                local billboard = Instance.new("BillboardGui")
                billboard.Parent = v
                billboard.Adornee = v
                billboard.Size = UDim2.new(0, 20, 0, 20)
                billboard.StudsOffset = Vector3.new(0, 3, 0)
                billboard.AlwaysOnTop = true

                local nameLabel = Instance.new("TextLabel")
                nameLabel.Parent = billboard
                nameLabel.Size = UDim2.new(1, 0, 1, 0)
                nameLabel.BackgroundTransparency = 1
                nameLabel.Text = v.Name
                nameLabel.TextColor3 = Color3.new(1, 0, 0)
                nameLabel.TextStrokeTransparency = 0.5
                nameLabel.TextScaled = true
            end
        end)
    else
        if itemsConnection then
            itemsConnection:Disconnect()
            itemsConnection = nil
        end

        for _, v in ipairs(workspace.RuntimeItems:GetChildren()) do
            if v:FindFirstChild("BillboardGui") then
                v.BillboardGui:Destroy()
            end
        end
    end
end)

ESP:Toggle("夜晚怪物透视", "", false, function(state)
    if state then
        for i, v in ipairs(workspace.NightEnemies:GetChildren()) do
            if v:IsA("Model") and not v:FindFirstChild("BillboardGui") then
                local billboard = Instance.new("BillboardGui")
                billboard.Parent = v
                billboard.Adornee = v
                billboard.Size = UDim2.new(0, 20, 0, 20)
                billboard.StudsOffset = Vector3.new(0, 3, 0)
                billboard.AlwaysOnTop = true

                local nameLabel = Instance.new("TextLabel")
                nameLabel.Parent = billboard
                nameLabel.Size = UDim2.new(1, 0, 1, 0)
                nameLabel.BackgroundTransparency = 1
                nameLabel.Text = v.Name
                nameLabel.TextColor3 = Color3.new(1, 0, 0)
                nameLabel.TextStrokeTransparency = 0.5
                nameLabel.TextScaled = true
            end
        end

        EnemyConnection = workspace.NightEnemies.ChildAdded:Connect(function(v)
            if v:IsA("Model") and not v:FindFirstChild("BillboardGui") and state then
                local billboard = Instance.new("BillboardGui")
                billboard.Parent = v
                billboard.Adornee = v
                billboard.Size = UDim2.new(0, 20, 0, 20)
                billboard.StudsOffset = Vector3.new(0, 3, 0)
                billboard.AlwaysOnTop = true

                local nameLabel = Instance.new("TextLabel")
                nameLabel.Parent = billboard
                nameLabel.Size = UDim2.new(1, 0, 1, 0)
                nameLabel.BackgroundTransparency = 1
                nameLabel.Text = v.Name
                nameLabel.TextColor3 = Color3.new(1, 0, 0)
                nameLabel.TextStrokeTransparency = 0.5
                nameLabel.TextScaled = true
            end
        end)
    else
        if EnemyConnection then
            EnemyConnection:Disconnect()
            EnemyConnection = nil
        end

        for i, v in ipairs(workspace.NightEnemies:GetChildren()) do
            if v:FindFirstChild("BillboardGui") then
                v.BillboardGui:Destroy()
            end
        end
    end
end)


ESP:Toggle("房子透视", "", false, function(state)
    if state then
        for _, v in ipairs(workspace.RandomBuildings:GetChildren()) do
            if v:IsA("Model") and not v:FindFirstChild("BillboardGui") then
                local billboard = Instance.new("BillboardGui")
                billboard.Parent = v
                billboard.Adornee = v
                billboard.Size = UDim2.new(0, 20, 0, 20)
                billboard.StudsOffset = Vector3.new(0, 3, 0)
                billboard.AlwaysOnTop = true

                local nameLabel = Instance.new("TextLabel")
                nameLabel.Parent = billboard
                nameLabel.Size = UDim2.new(1, 0, 1, 0)
                nameLabel.BackgroundTransparency = 1
                nameLabel.Text = v.Name
                nameLabel.TextColor3 = Color3.new(1, 0, 0)
                nameLabel.TextStrokeTransparency = 0.5
                nameLabel.TextScaled = true
            end
        end

        buildConnection = workspace.RandomBuildings.ChildAdded:Connect(function(v)
            if v:IsA("Model") and not v:FindFirstChild("BillboardGui") and state then
                local billboard = Instance.new("BillboardGui")
                billboard.Parent = v
                billboard.Adornee = v
                billboard.Size = UDim2.new(0, 20, 0, 20)
                billboard.StudsOffset = Vector3.new(0, 3, 0)
                billboard.AlwaysOnTop = true

                local nameLabel = Instance.new("TextLabel")
                nameLabel.Parent = billboard
                nameLabel.Size = UDim2.new(1, 0, 1, 0)
                nameLabel.BackgroundTransparency = 1
                nameLabel.Text = v.Name
                nameLabel.TextColor3 = Color3.new(1, 0, 0)
                nameLabel.TextStrokeTransparency = 0.5
                nameLabel.TextScaled = true
            end
        end)
    else
        if buildConnection then
            buildConnection:Disconnect()
            buildConnection = nil
        end

        for _, v in ipairs(workspace.RandomBuildings:GetChildren()) do
            if v:FindFirstChild("BillboardGui") then
                v.BillboardGui:Destroy()
            end
        end
    end
end)

ESP:Toggle("房子中的怪物透视", "", false, function(state)
    if state then
        for _, building in ipairs(workspace.RandomBuildings:GetChildren()) do
            for _, zombie in ipairs(building.StandaloneZombiePart.Zombies:GetChildren()) do
                if zombie:IsA("Model") and not zombie:FindFirstChild("BillboardGui") then
                    local billboard = Instance.new("BillboardGui")
                    billboard.Parent = zombie
                    billboard.Adornee = zombie
                    billboard.Size = UDim2.new(0, 20, 0, 20)
                    billboard.StudsOffset = Vector3.new(0, 3, 0)
                    billboard.AlwaysOnTop = true

                    local nameLabel = Instance.new("TextLabel")
                    nameLabel.Parent = billboard
                    nameLabel.Size = UDim2.new(1, 0, 1, 0)
                    nameLabel.BackgroundTransparency = 1
                    nameLabel.Text = zombie.Name
                    nameLabel.TextColor3 = Color3.new(1, 0, 0)
                    nameLabel.TextStrokeTransparency = 0.5
                    nameLabel.TextScaled = true
                end
            end
        end

        zombieConnection = workspace.RandomBuildings.ChildAdded:Connect(function(building)
            for _, zombie in ipairs(building.StandaloneZombiePart.Zombies:GetChildren()) do
                if zombie:IsA("Model") and not zombie:FindFirstChild("BillboardGui") and state then
                    local billboard = Instance.new("BillboardGui")
                    billboard.Parent = zombie
                    billboard.Adornee = zombie
                    billboard.Size = UDim2.new(0, 20, 0, 20)
                    billboard.StudsOffset = Vector3.new(0, 3, 0)
                    billboard.AlwaysOnTop = true

                    local nameLabel = Instance.new("TextLabel")
                    nameLabel.Parent = billboard
                    nameLabel.Size = UDim2.new(1, 0, 1, 0)
                    nameLabel.BackgroundTransparency = 1
                    nameLabel.Text = zombie.Name
                    nameLabel.TextColor3 = Color3.new(1, 0, 0)
                    nameLabel.TextStrokeTransparency = 0.5
                    nameLabel.TextScaled = true
                end
            end
        end)
    else
        if zombieConnection then
            zombieConnection:Disconnect()
            zombieConnection = nil
        end

        for _, building in ipairs(workspace.RandomBuildings:GetChildren()) do
            for _, zombie in ipairs(building.StandaloneZombiePart.Zombies:GetChildren()) do
                if zombie:FindFirstChild("BillboardGui") then
                    zombie.BillboardGui:Destroy()
                end
            end
        end
    end
end)

ESP:Toggle("银行透视", "", false, function(state)
    if state then
        for i, v in ipairs(workspace.Towns.LargeTownTemplate.Buildings:GetChildren()) do
            if v:IsA("Model") and not v:FindFirstChild("BillboardGui") and v.Name == "Bank" then
                local billboard = Instance.new("BillboardGui")
                billboard.Parent = v
                billboard.Adornee = v
                billboard.Size = UDim2.new(0, 20, 0, 20)
                billboard.StudsOffset = Vector3.new(0, 3, 0)
                billboard.AlwaysOnTop = true

                local nameLabel = Instance.new("TextLabel")
                nameLabel.Parent = billboard
                nameLabel.Size = UDim2.new(1, 0, 1, 0)
                nameLabel.BackgroundTransparency = 1
                nameLabel.Text = v.Name
                nameLabel.TextColor3 = Color3.new(1, 0, 0)
                nameLabel.TextStrokeTransparency = 0.5
                nameLabel.TextScaled = true
            end
        end

        bankConnection = workspace.Towns.LargeTownTemplate.Buildings.ChildAdded:Connect(function(Bank)
            if Bank:IsA("Model") and Bank.Name == "Bank" and state then
                task.wait()
                if not Bank:FindFirstChild("BillboardGui") then
                    local billboard = Instance.new("BillboardGui")
                    billboard.Parent = Bank
                    billboard.Adornee = Bank
                    billboard.Size = UDim2.new(0, 20, 0, 20)
                    billboard.StudsOffset = Vector3.new(0, 3, 0)
                    billboard.AlwaysOnTop = true

                    local nameLabel = Instance.new("TextLabel")
                    nameLabel.Parent = billboard
                    nameLabel.Size = UDim2.new(1, 0, 1, 0)
                    nameLabel.BackgroundTransparency = 1
                    nameLabel.Text = Bank.Name
                    nameLabel.TextColor3 = Color3.new(1, 0, 0)
                    nameLabel.TextStrokeTransparency = 0.5
                    nameLabel.TextScaled = true
                end
            end
        end)
    else
        if bankConnection then
            bankConnection:Disconnect()
            bankConnection = nil
        end

        for i, v in ipairs(workspace.Towns.LargeTownTemplate.Buildings:GetChildren()) do
            if v:FindFirstChild("BillboardGui") and v.Name == "Bank" then
                v.BillboardGui:Destroy()
            end
        end
    end
end)
else
game.Players.LocalPlayer:Kick("煞笔你没进群吧❌❗️")
game:shutdown()
end