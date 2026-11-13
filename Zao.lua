local P, ws, lp, R, TS, IN = game:GetService("Players"), game:GetService("Workspace"), game:GetService("Players").LocalPlayer, game:GetService("RunService"), game:GetService("TweenService"), Instance.new

-- 1. 本地黑科技：强制下载图片
local bI, aI, fI = "", "", ""
pcall(function() 
    if isfile and writefile and getcustomasset then
        if not isfile("my_bg.jpg") then 
            local success = pcall(function() writefile("my_bg.jpg", game:HttpGet("https://i.ibb.co/rf1ZSzKy/Image-1794552925265-400.jpg")) end)
            if not success then writefile("my_bg.jpg", game:HttpGet("https://s41.ax1x.com/2026/11/08/pnhYRSS.jpg")) end 
        end 
        bI = getcustomasset("my_bg.jpg")
        
        if not isfile("my_av.jpg") then writefile("my_av.jpg", game:HttpGet("https://i.ibb.co/rRsnSp92/Image-1794552964421-552.jpg")) end 
        aI = getcustomasset("my_av.jpg")
        
        if not isfile("my_float.jpg") then writefile("my_float.jpg", game:HttpGet("https://i.ibb.co/46vX6PF/Image-1794532171200-130.jpg")) end 
        fI = getcustomasset("my_float.jpg")
    end 
end)

-- 2. 核心坐标
local stages, chest, gVal, bVal = {}, nil, nil, nil
pcall(function()
    local d = lp:WaitForChild("Data", 3)
    if d then gVal = d:WaitForChild("Gold", 3) bVal = d:WaitForChild("GoldBlock", 3) end
    for _, s in ipairs(ws:WaitForChild("BoatStages"):WaitForChild("NormalStages"):GetChildren()) do
        local idx = tonumber(s.Name:match("%d+"))
        if idx and s:FindFirstChild("DarknessPart") then stages[idx] = s.DarknessPart.CFrame end
        if s.Name == "TheEnd" and s:FindFirstChild("GoldenChest") then chest = s.GoldenChest:FindFirstChild("Trigger") end
    end
end)

-- 3. 纯白极简 UI
local gui = IN("ScreenGui", lp:WaitForChild("PlayerGui"))
local main = IN("Frame", gui)
main.Size, main.Position, main.BackgroundTransparency, main.BorderSizePixel = UDim2.fromOffset(540, 320), UDim2.new(0.5, -270, 0.5, -160), 1, 0
IN("UICorner", main).CornerRadius = UDim.new(0, 4)

local bg = IN("ImageLabel", main) 
bg.Size, bg.BackgroundTransparency, bg.Image, bg.ScaleType, bg.ZIndex = UDim2.new(1,0,1,0), 1, bI, Enum.ScaleType.Crop, 0
IN("UICorner", bg).CornerRadius = UDim.new(0, 4)

-- 纯白呼吸边框
local s1 = IN("UIStroke", main) s1.Color, s1.Thickness = Color3.fromRGB(255, 255, 255), 1.5
s1.Transparency = 0.2
task.spawn(function() while gui.Parent do TS:Create(s1, TweenInfo.new(3, Enum.EasingStyle.Sine), {Transparency = 0.8}):Play() task.wait(3) TS:Create(s1, TweenInfo.new(3, Enum.EasingStyle.Sine), {Transparency = 0}):Play() task.wait(3) end end)

-- 标题
local title = IN("TextLabel", main)
title.Size, title.Position, title.BackgroundTransparency, title.Text, title.TextColor3, title.Font, title.TextSize, title.ZIndex = UDim2.new(1,0,0,45), UDim2.new(0,20,0,0), 1, "Sonic Script", Color3.fromRGB(255, 255, 255), Enum.Font.GothamBlack, 20, 5
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextStrokeTransparency = 0 
title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

local cls = IN("TextButton", main) 
cls.Size, cls.Position, cls.BackgroundTransparency, cls.Text, cls.TextColor3, cls.ZIndex = UDim2.fromOffset(30,30), UDim2.new(1,-40,0,7), 1, "X", Color3.fromRGB(255, 50, 50), 5
cls.Font, cls.TextSize = Enum.Font.GothamBlack, 16
cls.MouseButton1Click:Connect(function() gui:Destroy() end)

local min = IN("TextButton", main) 
min.Size, min.Position, min.BackgroundTransparency, min.Text, min.TextColor3, min.ZIndex = UDim2.fromOffset(30,30), UDim2.new(1,-80,0,7), 1, "-", Color3.fromRGB(255, 255, 255), 5
min.Font, min.TextSize = Enum.Font.GothamBlack, 18

-- 头像 (白色雷达圈)
local av = IN("ImageLabel", main) 
av.Size, av.Position, av.BackgroundTransparency, av.Image, av.ScaleType, av.ZIndex = UDim2.fromOffset(80,80), UDim2.new(0,40,0,60), 1, aI, Enum.ScaleType.Crop, 3
IN("UICorner", av).CornerRadius = UDim.new(0,40)
local aS = IN("UIStroke", av) aS.Color, aS.Thickness = Color3.fromRGB(255, 255, 255), 2

local radar = IN("Frame", main) 
radar.Size, radar.Position, radar.BackgroundTransparency, radar.ZIndex = UDim2.fromOffset(90,90), UDim2.new(0,35,0,55), 1, 2
IN("UICorner", radar).CornerRadius = UDim.new(0,45)
local rS = IN("UIStroke", radar) rS.Color, rS.Thickness = Color3.fromRGB(255, 255, 255), 2
local rG = IN("UIGradient", rS) rG.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0), NumberSequenceKeypoint.new(1,1)})
task.spawn(function() while gui.Parent do rG.Rotation = (tick()*80)%360 task.wait() end end)

-- 状态文字
local stat = IN("TextLabel", main) 
stat.Size, stat.Position, stat.BackgroundTransparency, stat.Text, stat.TextColor3, stat.Font, stat.TextSize, stat.ZIndex = UDim2.new(0,140,0,80), UDim2.new(0,15,0,160), 1, "状态: 待命\n金币: 0\n金块: 0\n轮数: 0", Color3.fromRGB(255, 255, 255), Enum.Font.Code, 13, 3
stat.TextXAlignment = Enum.TextXAlignment.Left
stat.TextStrokeTransparency = 0
stat.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

-- 按钮
local function cBtn(txt, y, cb)
    local b = IN("TextButton", main) 
    b.Size, b.Position, b.BackgroundColor3, b.BackgroundTransparency, b.Text, b.TextColor3, b.Font, b.TextSize, b.ZIndex = UDim2.new(0,320,0,42), UDim2.new(0,190,0,y), Color3.fromRGB(0, 0, 0), 0.6, txt, Color3.fromRGB(255, 255, 255), Enum.Font.GothamBold, 14, 3
    b.TextXAlignment = Enum.TextXAlignment.Left
    IN("UIPadding", b).PaddingLeft = UDim.new(0,15)
    IN("UICorner", b).CornerRadius = UDim.new(0,2)
    b.TextStrokeTransparency = 0
    
    local s = IN("UIStroke", b) s.Color, s.Thickness = Color3.fromRGB(150, 150, 150), 1
    b.MouseEnter:Connect(function() TS:Create(b, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.2, TextColor3 = Color3.fromRGB(0, 0, 0)}):Play() s.Color = Color3.fromRGB(255, 255, 255) end)
    b.MouseLeave:Connect(function() TS:Create(b, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 0.6, TextColor3 = Color3.fromRGB(255, 255, 255)}):Play() s.Color = Color3.fromRGB(150, 150, 150) end)
    b.MouseButton1Click:Connect(cb)
    return b, s
end

-- 4. 核心功能
local farm, rounds, tPos, atEnd = false, 0, stages[1], false
local fBtn, fStrk
fBtn, fStrk = cBtn("开启自动通关", 55, function()
    farm = not farm
    if farm then
        fBtn.Text, fBtn.TextColor3 = "停止自动通关", Color3.fromRGB(200, 200, 200)
        fStrk.Color = Color3.fromRGB(255, 255, 255)
        task.spawn(function()
            while farm do
                for i=1,9 do if not farm then break end tPos = stages[i] task.wait(1) end
                atEnd = true task.wait(2)
                while atEnd and farm do task.wait() end
            end
        end)
    else
        fBtn.Text, fBtn.TextColor3, fStrk.Color, atEnd = "开启自动通关", Color3.fromRGB(255, 255, 255), Color3.fromRGB(150, 150, 150), false
    end
end)

cBtn("立即收取金币", 105, function() pcall(function() ws.ClaimRiverResultsGold:FireServer() end) end)
cBtn("重置运行轮数", 155, function() rounds = 0 end)

-- ================= 5. 悬浮窗 (撤掉所有特效，纯净白边) =================
local mF = IN("ImageButton", gui) 
mF.Size, mF.Position, mF.BackgroundTransparency, mF.Image, mF.Visible, mF.Draggable, mF.ScaleType = UDim2.fromOffset(40,40), UDim2.new(0,50,0.5,-20), 0.3, fI, false, true, Enum.ScaleType.Crop
IN("UICorner", mF).CornerRadius = UDim.new(0,6)

-- 只有个简单的纯白边框，不加任何脉冲、旋转特效
local mS = IN("UIStroke", mF) 
mS.Color, mS.Thickness = Color3.fromRGB(255, 255, 255), 2

min.MouseButton1Click:Connect(function() main.Visible = false mF.Visible = true end)
mF.MouseButton1Click:Connect(function() main.Visible = true mF.Visible = false end)

-- 6. 心跳
R.Heartbeat:Connect(function()
    if farm then
        local root = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
        if root then
            if atEnd and chest then pcall(firetouchinterest, chest, root, 0) end
            root.CFrame, root.Velocity = tPos or stages[1], Vector3.zero
            if gVal and bVal then stat.Text = string.format("状态: 运行中\n金币: %d\n金块: %d\n轮数: %d", gVal.Value, bVal.Value, rounds) end
        end
    end
end)

-- 7. 死亡结算 & 菜单彻底销毁
lp.CharacterRemoving:Connect(function() 
    if farm then 
        rounds = rounds + 1 
        atEnd = false 
        pcall(function() ws.ClaimRiverResultsGold:FireServer() end) 
        
        farm = false 
        task.wait(0.5)
        gui:Destroy()  -- 直接销毁 UI，干干净净
    end 
end)
