local P = game:GetService("Players").LocalPlayer 
local T = game:GetService("TweenService") 
local U = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local TS = game:GetService("TweenService")

for _,v in ipairs(P.PlayerGui:GetChildren()) do 
    if v.Name=="LJ_UI" or v.Name=="MomoLoader" then v:Destroy() end 
end

local function L(l,u,n) 
    task.spawn(function() 
        pcall(function() 
            local p=n..".png" 
            if isfile and isfile(p) and getcustomasset then 
                l.Image=getcustomasset(p) 
            else 
                local d=game:HttpGet(u) 
                if writefile and getcustomasset then 
                    writefile(p,d) 
                    l.Image=getcustomasset(p) 
                else 
                    l.Image=u 
                end 
            end 
        end) 
    end) 
end

-- 名字智能识别
local displayName = P.Name
local titleName = P.Name
if P.Name == "yuh5710t" then
    displayName = "中野三玖"
    titleName = "中野三玖"
end

-- ================= 1. 顶部滑入欢迎弹窗 =================
local isFirst = true
if isfile and isfile("Sonic_UserConfig_" .. P.Name .. ".json") then
    local ok, d = pcall(function() return HttpService:JSONDecode(readfile("Sonic_UserConfig_" .. P.Name .. ".json")) end)
    if ok and d and d.LoginCount then isFirst = false end
end

local wText = isFirst and "Welcome to Sonic Script" or ("Welcome back, " .. displayName)
local tText = isFirst and "「 欢迎使用索尼克脚本 」" or ("「 欢迎回来，" .. titleName .. " 」")
if writefile then writefile("Sonic_UserConfig_" .. P.Name .. ".json", HttpService:JSONEncode({LoginCount = 1, Name = titleName})) end

local ls = Instance.new("ScreenGui",P.PlayerGui) 
ls.Name="MomoLoader" ls.IgnoreGuiInset=true ls.DisplayOrder=9998
local lf = Instance.new("Frame",ls) 
lf.Size=UDim2.new(0,360,0,80) 
lf.Position=UDim2.new(0.5, -180, 0, -100)
lf.BackgroundColor3=Color3.fromRGB(15,20,30) lf.BackgroundTransparency=0.05 
Instance.new("UICorner",lf).CornerRadius=UDim.new(0,12) 
Instance.new("UIStroke",lf).Color=Color3.fromRGB(142,240,255)

local la = Instance.new("ImageLabel",lf) 
la.Size=UDim2.new(0,50,0,50) la.Position=UDim2.new(0,15,0,15) la.BackgroundTransparency=1 
Instance.new("UICorner",la).CornerRadius=UDim.new(1,0) 
L(la,"https://i.ibb.co/v66wjmJ5/Image-1794149551205-70.jpg","m_n")

local lt = Instance.new("TextLabel",lf) 
lt.Size=UDim2.new(1,-80,0,20) lt.Position=UDim2.new(0,75,0,15) lt.BackgroundTransparency=1 lt.Text=tText lt.TextColor3=Color3.fromRGB(230,230,230) lt.Font=Enum.Font.GothamBold lt.TextSize=15 lt.TextXAlignment=Enum.TextXAlignment.Left

local lsub = Instance.new("TextLabel",lf) 
lsub.Size=UDim2.new(1,-80,0,30) lsub.Position=UDim2.new(0,75,0,40) lsub.BackgroundTransparency=1 lsub.Text=wText lsub.TextColor3=Color3.fromRGB(142,240,255) lsub.Font=Enum.Font.GothamBold lsub.TextSize=12 lsub.TextXAlignment=Enum.TextXAlignment.Left

T:Create(lf, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -180, 0, 20)}):Play()
task.delay(3.5, function()
    local tw = T:Create(lf, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0.5, -180, 0, -100)})
    tw:Play()
    tw.Completed:Connect(function() ls:Destroy() end)
end)

-- ================= 2. 按钮生成器 =================
local function B(p,t,y,u) 
    local b = Instance.new("TextButton",p) 
    b.Size=UDim2.new(0,130,0,36) b.Position=UDim2.new(0,0,0,y) 
    b.BackgroundColor3=Color3.fromRGB(40,45,55) b.BackgroundTransparency=0.4 b.Text=t b.TextColor3=Color3.fromRGB(230,230,230) b.Font=Enum.Font.GothamBold b.TextSize=13 b.ZIndex=7 
    Instance.new("UICorner",b).CornerRadius=UDim.new(0,18) 
    local s = Instance.new("UIStroke",b) 
    s.Color=Color3.fromRGB(142,240,255) s.Thickness=1 s.Transparency=0.5 
    b.MouseButton1Click:Connect(function() 
        b.Text="连接中..." task.wait(0.1) 
        local ok,e = pcall(function() local c = game:HttpGet(u) local f = loadstring(c) f() end) 
        if ok then b.Text="✅ 成功" else b.Text="❌ 失败" end 
        task.wait(1.5) b.Text=t 
    end) 
    return b 
end

-- ================= 3. 主UI =================
local sg = Instance.new("ScreenGui",P.PlayerGui) 
sg.Name="LJ_UI" sg.IgnoreGuiInset=true sg.DisplayOrder=9999 sg.ResetOnSpawn=false
local m = Instance.new("Frame",sg) 
m.Size=UDim2.new(0,580,0,340) m.Position=UDim2.new(0.5,0,0.5,0) m.AnchorPoint=Vector2.new(0.5,0.5) m.BackgroundTransparency=1 m.ClipsDescendants=true 
Instance.new("UICorner",m).CornerRadius=UDim.new(0,12) 
local mStroke = Instance.new("UIStroke",m) 
mStroke.Color=Color3.fromRGB(200,200,200) mStroke.Thickness=1.5

local bg = Instance.new("ImageLabel",m) 
bg.Size=UDim2.new(1,0,1,0) bg.ZIndex=0 bg.BackgroundTransparency=1 bg.ScaleType=Enum.ScaleType.Crop 
L(bg,"https://i.ibb.co/99BqWLrL/Image-1794499464220-466.jpg","b1")

local mask = Instance.new("Frame",m)
mask.Size = UDim2.new(1,0,1,0) mask.BackgroundColor3 = Color3.fromRGB(10,10,15) mask.BackgroundTransparency = 0.5 mask.ZIndex = 1
Instance.new("UICorner",mask).CornerRadius=UDim.new(0,12)

local hb = Instance.new("TextButton",sg) 
hb.Size=UDim2.new(0,50,0,50) hb.Position=UDim2.new(0,20,0,20) hb.BackgroundColor3=Color3.fromRGB(20,25,35) hb.BackgroundTransparency=0.5 hb.Text="" hb.Visible=false hb.ZIndex=200 
Instance.new("UICorner",hb).CornerRadius=UDim.new(0,10) 
Instance.new("UIStroke",hb).Color=Color3.fromRGB(200,200,200)
local hi = Instance.new("ImageLabel",hb) 
hi.Size=UDim2.new(1,-4,1,-4) hi.Position=UDim2.new(0,2,0,2) hi.BackgroundTransparency=1 hi.ZIndex=201 
Instance.new("UICorner",hi).CornerRadius=UDim.new(0,8) 
L(hi,"https://i.ibb.co/gLb1Bssj/Image-1794499774396-431.png","m1")

local ta = Instance.new("ImageLabel",m) 
ta.Size=UDim2.new(0,40,0,40) ta.Position=UDim2.new(0,15,0,4) ta.BackgroundTransparency=1 ta.ZIndex=5 
Instance.new("UICorner",ta).CornerRadius=UDim.new(0,8) 
L(ta,"https://i.ibb.co/Rk7YXKFc/Image-1794499770219-943.png","t1")
local t1 = Instance.new("TextLabel",m) 
t1.Size=UDim2.new(0,200,0,22) t1.Position=UDim2.new(0,65,0,6) t1.BackgroundTransparency=1 t1.Text="SONIC SCRIPT" t1.TextColor3=Color3.fromRGB(230,230,230) t1.Font=Enum.Font.Arcade t1.TextSize=16 t1.TextXAlignment=Enum.TextXAlignment.Left t1.ZIndex=5
local t2 = Instance.new("TextLabel",m) 
t2.Size=UDim2.new(0,200,0,18) t2.Position=UDim2.new(0,65,0,26) t2.BackgroundTransparency=1 t2.Text=displayName .. " · MIKU" t2.TextColor3=Color3.fromRGB(180,180,180) t2.Font=Enum.Font.GothamBold t2.TextSize=12 t2.TextXAlignment=Enum.TextXAlignment.Left t2.ZIndex=5

local cb = Instance.new("TextButton",m) 
cb.Size=UDim2.new(0,26,0,26) cb.Position=UDim2.new(1,-35,0,8) cb.BackgroundColor3=Color3.fromRGB(40,45,55) cb.BackgroundTransparency=0.5 cb.Text="×" cb.TextColor3=Color3.fromRGB(220,220,220) cb.ZIndex=5 
Instance.new("UICorner",cb).CornerRadius=UDim.new(0,6) 
cb.MouseButton1Click:Connect(function() sg:Destroy() end)
local mb = Instance.new("TextButton",m) 
mb.Size=UDim2.new(0,26,0,26) mb.Position=UDim2.new(1,-70,0,8) mb.BackgroundColor3=Color3.fromRGB(40,45,55) mb.BackgroundTransparency=0.5 mb.Text="−" mb.TextColor3=Color3.fromRGB(220,220,220) mb.ZIndex=5 
Instance.new("UICorner",mb).CornerRadius=UDim.new(0,6)
mb.MouseButton1Click:Connect(function() 
    local tw = T:Create(m,TweenInfo.new(0.2),{Size=UDim2.new(0,580,0,0)}) 
    tw:Play() 
    tw.Completed:Connect(function() m.Visible=false hb.Visible=true m.Size=UDim2.new(0,580,0,340) end) 
end)

local dg = false
local ds, sp
hb.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dg=false ds=i.Position sp=hb.Position end end)
U.InputChanged:Connect(function(i) if ds and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then local dl=i.Position-ds if math.abs(dl.X)>5 or math.abs(dl.Y)>5 then dg=true end if dg then hb.Position=UDim2.new(sp.X.Scale,sp.X.Offset+dl.X,sp.Y.Scale,sp.Y.Offset+dl.Y) end end end)
U.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then ds=nil end end)
hb.MouseButton1Click:Connect(function() 
    if not dg then 
        hb.Visible=false m.Visible=true m.Size=UDim2.new(0,580,0,0) 
        T:Create(m,TweenInfo.new(0.3,Enum.EasingStyle.Back),{Size=UDim2.new(0,580,0,340)}):Play() 
    end 
end)

-- ================= 4. 导航与页面 =================
local nv = Instance.new("Frame",m) 
nv.Size=UDim2.new(0,90,1,-50) nv.Position=UDim2.new(0,10,0,50) nv.BackgroundTransparency=1 nv.ZIndex=5
local pg = {} 
local bt = {} 
local pages = {"公告","脚本","曲库","设置"}
for i,n in ipairs(pages) do 
    local b = Instance.new("TextButton",nv) 
    b.Size=UDim2.new(1,0,0,36) b.Position=UDim2.new(0,0,0,(i-1)*42) b.BackgroundTransparency=1 b.Text=n 
    b.TextColor3=(i==1) and Color3.fromRGB(230,230,230) or Color3.fromRGB(150,150,150) 
    b.Font=Enum.Font.GothamBold b.TextSize=14 b.ZIndex=6 
    local p = Instance.new("Frame",m) 
    p.Size=UDim2.new(0,460,1,-50) p.Position=UDim2.new(0,110,0,50) p.BackgroundTransparency=1 p.Visible=(i==1) p.ZIndex=5 
    pg[i]=p 
    bt[i]=b 
    b.MouseButton1Click:Connect(function() 
        for k=1,4 do 
            pg[k].Visible=(k==i) 
            bt[k].TextColor3=(k==i) and Color3.fromRGB(230,230,230) or Color3.fromRGB(150,150,150) 
        end 
    end)
end

-- 1. 公告
local av = Instance.new("ImageLabel",pg[1]) 
av.Size=UDim2.new(0,60,0,60) av.Position=UDim2.new(0,10,0,10) av.BackgroundTransparency=1 av.ZIndex=6 
Instance.new("UICorner",av).CornerRadius=UDim.new(1,0) 
L(av,"https://i.ibb.co/v66wjmJ5/Image-1794149551205-70.jpg","m2")
local nm = Instance.new("TextLabel",pg[1]) 
nm.Size=UDim2.new(0,200,0,20) nm.Position=UDim2.new(0,80,0,15) nm.BackgroundTransparency=1 nm.Text="墨 墨" nm.TextColor3=Color3.fromRGB(230,230,230) nm.Font=Enum.Font.GothamBold nm.TextSize=18 nm.TextXAlignment=Enum.TextXAlignment.Left nm.ZIndex=6
local an = Instance.new("TextLabel",pg[1])  
an.Size=UDim2.new(1,-20,1,-80) an.Position=UDim2.new(0,10,0,80) an.BackgroundTransparency=1 an.Text="【 墨墨带来的最新更新内容 】\n\n· 音乐系统：优雅呈现，愿旋律伴你前行。\n· 飞车系统：航行平稳。\n· 造船寻宝：若身躯陨落，星轨会断。底层之限，作者无意修葺，重登即可复连。\n\n愿诸位，武运昌隆。" an.TextColor3=Color3.fromRGB(200,200,200) an.Font=Enum.Font.GothamBold an.TextSize=15 an.TextXAlignment=Enum.TextXAlignment.Left an.TextYAlignment=Enum.TextYAlignment.Top an.ZIndex=6

-- 2. 脚本
local sn = Instance.new("Frame",pg[2]) 
sn.Size=UDim2.new(1,0,0,30) sn.BackgroundTransparency=1 sn.ZIndex=6
local sP = {} 
local sB = {} 
local snames = {"通用","服务器","缝合"}
for i,sn2 in ipairs(snames) do 
    local sb = Instance.new("TextButton",sn) 
    sb.Size=UDim2.new(0,60,0,26) sb.Position=UDim2.new(0,(i-1)*65,0,0) sb.BackgroundColor3=Color3.fromRGB(40,45,55) sb.BackgroundTransparency=(i==1) and 0.3 or 0.7 sb.Text=sn2 sb.TextColor3=Color3.fromRGB(220,220,220) sb.Font=Enum.Font.GothamBold sb.TextSize=12 sb.ZIndex=7 
    Instance.new("UICorner",sb).CornerRadius=UDim.new(0,4) 
    sB[i]=sb 
    local spr = Instance.new("Frame",pg[2]) 
    spr.Size=UDim2.new(1,0,1,-40) spr.Position=UDim2.new(0,0,0,40) spr.BackgroundTransparency=1 spr.Visible=(i==1) spr.ZIndex=6 
    sP[i]=spr 
    sb.MouseButton1Click:Connect(function() 
        for k=1,3 do 
            sP[k].Visible=(k==i) 
            sB[k].BackgroundTransparency=(k==i) and 0.3 or 0.7 
        end 
    end)
end
B(sP[1],"启动 飞车",15,"https://raw.githubusercontent.com/136289Mm/fA./main/1.lua")
B(sP[2],"启动 造船寻宝",15,"https://raw.githubusercontent.com/136289Mm/long-ui/main/Zao.lua")
local st = Instance.new("TextLabel",sP[3]) 
st.Size=UDim2.new(1,0,1,0) st.BackgroundTransparency=1 st.Text="缝合区域" st.TextColor3=Color3.fromRGB(220,220,220) st.Font=Enum.Font.GothamBold st.TextSize=14 st.ZIndex=7

-- 3. 曲库
local title3 = Instance.new("TextLabel",pg[3]) 
title3.Size=UDim2.new(1,0,0,24) title3.Position=UDim2.new(0,0,0,0) title3.BackgroundTransparency=1 
title3.Text="MUSIC SYSTEM / 音乐库" 
title3.TextColor3=Color3.fromRGB(142,240,255) 
title3.Font=Enum.Font.Arcade 
title3.TextSize=18 
title3.TextXAlignment=Enum.TextXAlignment.Left 
title3.ZIndex=6
title3.TextStrokeTransparency = 0
title3.TextStrokeColor3 = Color3.fromRGB(0, 50, 80)

B(pg[3],"音乐播放器",35,"https://raw.githubusercontent.com/136289Mm/ingyue/main/yingyuebofangqi.lua")
local libs = {
    {"音乐仓库1", "https://raw.githubusercontent.com/136289Mm/ingyue/main/%E9%9F%B3%E4%B9%901.lua"},
    {"音乐仓库2", "https://raw.githubusercontent.com/136289Mm/ingyue/main/%E9%9F%B3%E4%B9%90%E4%BA%8C.lua"},
    {"音乐仓库3", "https://raw.githubusercontent.com/136289Mm/ingyue/main/%E9%9F%B3%E4%B9%903.lua"},
    {"音乐仓库4", "https://raw.githubusercontent.com/136289Mm/ingyue/main/%E9%9F%B3%E4%B9%904.lua"}
}
for i, lib in ipairs(libs) do
    local btn = B(pg[3], lib[1], 85, lib[2])
    btn.Size = UDim2.new(0, 105, 0, 36) 
    btn.Position = UDim2.new(0, (i-1)*112, 0, 85) 
end

-- ================= 5. 终极设置页 (滑动加持) =================
local scroll = Instance.new("ScrollingFrame", pg[4])
scroll.Size = UDim2.new(1,0,1,0)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 2
scroll.ScrollBarImageColor3 = Color3.fromRGB(142,240,255)
scroll.CanvasSize = UDim2.new(0,0,0,450) 

local setTitle = Instance.new("TextLabel", scroll) 
setTitle.Size=UDim2.new(1,0,0,24) setTitle.Position=UDim2.new(0,0,0,0) setTitle.BackgroundTransparency=1 
setTitle.Text="SETTINGS / 设置" 
setTitle.TextColor3=Color3.fromRGB(142,240,255) 
setTitle.Font=Enum.Font.Arcade 
setTitle.TextSize=18 
setTitle.TextXAlignment=Enum.TextXAlignment.Left 
setTitle.ZIndex=6
setTitle.TextStrokeTransparency = 0
setTitle.TextStrokeColor3 = Color3.fromRGB(0, 50, 80)

local qqCard = Instance.new("Frame", scroll)
qqCard.Size = UDim2.new(0, 460, 0, 50) qqCard.Position = UDim2.new(0,0,0,30) qqCard.BackgroundColor3 = Color3.fromRGB(20,25,35) qqCard.BackgroundTransparency = 0.4
Instance.new("UICorner",qqCard).CornerRadius=UDim.new(0,8) Instance.new("UIStroke",qqCard).Color=Color3.fromRGB(142,240,255)
local qqTxt = Instance.new("TextLabel", qqCard) qqTxt.Size = UDim2.new(1,-20,0,20) qqTxt.Position = UDim2.new(0,10,0,5) qqTxt.BackgroundTransparency = 1 qqTxt.Text = "AUTHOR / 作者联系方式" qqTxt.TextColor3 = Color3.fromRGB(200,200,200) qqTxt.Font = Enum.Font.GothamBold qqTxt.TextSize = 11 qqTxt.TextXAlignment = Enum.TextXAlignment.Left
local qqNum = Instance.new("TextLabel", qqCard) qqNum.Size = UDim2.new(1,-20,0,20) qqNum.Position = UDim2.new(0,10,0,25) qqNum.BackgroundTransparency = 1 qqNum.Text = "QQ: 2066484928" qqNum.TextColor3 = Color3.fromRGB(255, 200, 50) qqNum.Font = Enum.Font.Arcade qqNum.TextSize = 16 qqNum.TextXAlignment = Enum.TextXAlignment.Left

local function makeSlider(txt, y, defaultVal, callback)
    local container = Instance.new("Frame", scroll)
    container.Size=UDim2.new(0,460,0,40) container.Position=UDim2.new(0,0,0,y) container.BackgroundTransparency=1
    local lbl = Instance.new("TextLabel",container) lbl.Size=UDim2.new(0,100,1,0) lbl.BackgroundTransparency=1 lbl.Text=txt lbl.TextColor3=Color3.fromRGB(220,220,220) lbl.Font=Enum.Font.GothamBold lbl.TextSize=13 lbl.TextXAlignment=Enum.TextXAlignment.Left

    local bar = Instance.new("TextButton",container) bar.Size=UDim2.new(0,300,0,8) bar.Position=UDim2.new(0,100,0.5,-4) bar.BackgroundColor3=Color3.fromRGB(50,55,65) bar.Text=""
    Instance.new("UICorner",bar).CornerRadius=UDim.new(1,0)
    local fill = Instance.new("Frame",bar) fill.Size=UDim2.new(defaultVal,0,1,0) fill.BackgroundColor3=Color3.fromRGB(142,240,255) Instance.new("UICorner",fill).CornerRadius=UDim.new(1,0)
    
    local dragging = false
    bar.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dragging = true end end)
    U.InputChanged:Connect(function(i) 
        if dragging and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
            local rel = math.clamp((i.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
            fill.Size = UDim2.new(rel,0,1,0)
            callback(rel)
        end
    end)
    U.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dragging = false end end)
end

makeSlider("菜单缩放", 90, 0.5, function(val)
    local s = 0.8 + val * 0.4
    m.Size = UDim2.new(0, 580*s, 0, 340*s)
end)

makeSlider("背景暗度", 140, 0.4, function(val)
    mask.BackgroundTransparency = 1 - val
end)

makeSlider("菜单透明度", 190, 0.0, function(val)
    bg.ImageTransparency = val
    mask.BackgroundTransparency = (1 - val) * 0.4
end)

local function makeSkinBtn(txt, x, col)
    local b = Instance.new("TextButton", scroll) 
    b.Size=UDim2.new(0,90,0,30) b.Position=UDim2.new(0,x,0,240) b.BackgroundColor3=col b.BackgroundTransparency=0.6 b.Text=txt b.TextColor3=Color3.fromRGB(220,220,220) b.Font=Enum.Font.GothamBold b.TextSize=12 b.ZIndex=7
    Instance.new("UICorner",b).CornerRadius=UDim.new(0,15) Instance.new("UIStroke",b).Color=Color3.new(1,1,1)
    return b
end

makeSkinBtn("樱花粉", 0, Color3.fromRGB(255,182,193)).MouseButton1Click:Connect(function()
    bg.ImageColor3 = Color3.fromRGB(255,182,193) mStroke.Color = Color3.fromRGB(255,105,180) t1.TextColor3 = Color3.fromRGB(255,105,180)
end)

makeSkinBtn("深海蓝", 100, Color3.fromRGB(70,130,180)).MouseButton1Click:Connect(function()
    bg.ImageColor3 = Color3.fromRGB(70,130,180) mStroke.Color = Color3.fromRGB(0,191,255) t1.TextColor3 = Color3.fromRGB(0,191,255)
end)

makeSkinBtn("暗夜黑", 200, Color3.fromRGB(50,50,50)).MouseButton1Click:Connect(function()
    bg.ImageColor3 = Color3.fromRGB(30,30,30) mStroke.Color = Color3.fromRGB(100,100,100) t1.TextColor3 = Color3.fromRGB(200,200,200)
end)

makeSkinBtn("恢复默认", 300, Color3.new(1,1,1)).MouseButton1Click:Connect(function()
    bg.ImageColor3 = Color3.new(1,1,1) mStroke.Color = Color3.fromRGB(200,200,200) t1.TextColor3 = Color3.fromRGB(230,230,230)
end)

local saveBtn = Instance.new("TextButton", scroll) 
saveBtn.Size=UDim2.new(0,140,0,30) saveBtn.Position=UDim2.new(0,0,0,290) saveBtn.BackgroundColor3=Color3.fromRGB(40,45,55) saveBtn.BackgroundTransparency=0.4 saveBtn.Text="保存配置" saveBtn.TextColor3=Color3.fromRGB(220,220,220) saveBtn.Font=Enum.Font.GothamBold saveBtn.TextSize=13 saveBtn.ZIndex=7
Instance.new("UICorner",saveBtn).CornerRadius=UDim.new(0,15) Instance.new("UIStroke",saveBtn).Color=Color3.new(1,1,1)
saveBtn.MouseButton1Click:Connect(function() if writefile then writefile("Sonic_Skin.txt", tostring(bg.ImageColor3)) end saveBtn.Text="✅ 已保存" task.wait(1.5) saveBtn.Text="保存配置" end)

local loadBtn = Instance.new("TextButton", scroll) 
loadBtn.Size=UDim2.new(0,140,0,30) loadBtn.Position=UDim2.new(0,150,0,290) loadBtn.BackgroundColor3=Color3.fromRGB(40,45,55) loadBtn.BackgroundTransparency=0.4 loadBtn.Text="读取配置" loadBtn.TextColor3=Color3.fromRGB(220,220,220) loadBtn.Font=Enum.Font.GothamBold loadBtn.TextSize=13 loadBtn.ZIndex=7
Instance.new("UICorner",loadBtn).CornerRadius=UDim.new(0,15) Instance.new("UIStroke",loadBtn).Color=Color3.new(1,1,1)
loadBtn.MouseButton1Click:Connect(function()
    if isfile and isfile("Sonic_Skin.txt") then
        local ok, col = pcall(function() return readfile("Sonic_Skin.txt") end)
        if ok and col then local c = string.split(col, " ") if #c >= 3 then bg.ImageColor3 = Color3.new(tonumber(c[1]), tonumber(c[2]), tonumber(c[3])) loadBtn.Text="✅ 已载入" end end
    else loadBtn.Text="❌ 无配置" end
    task.wait(1.5) loadBtn.Text="读取配置"
end)
