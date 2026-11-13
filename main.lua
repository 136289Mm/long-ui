local P=game:GetService("Players").LocalPlayer local T=game:GetService("TweenService") local U=game:GetService("UserInputService")
for _,v in ipairs(P.PlayerGui:GetChildren())do if v.Name=="LJ_UI" then v:Destroy()end end
local function L(l,u,n) task.spawn(function() pcall(function() local p=n..".png" if isfile and isfile(p) and getcustomasset then l.Image=getcustomasset(p) else local d=game:HttpGet(u) if writefile and getcustomasset then writefile(p,d) l.Image=getcustomasset(p) else l.Image=u end end end) end) end
local function B(p,t,y,u) local b=Instance.new("TextButton",p) b.Size=UDim2.new(0,150,0,36) b.Position=UDim2.new(0,0,0,y) b.BackgroundColor3=Color3.fromRGB(255,255,255) b.BackgroundTransparency=0.8 b.Text=t b.TextColor3=Color3.new(1,1,1) b.Font=Enum.Font.GothamBold b.TextSize=13 b.ZIndex=7 Instance.new("UICorner",b).CornerRadius=UDim.new(0,18) local s=Instance.new("UIStroke",b) s.Color=Color3.fromRGB(255,255,255) s.Thickness=1.5 s.Transparency=0.4 b.MouseButton1Click:Connect(function() b.Text="连接中..." task.wait(0.2) local ok,e=pcall(function() local c=game:HttpGet(u) local f=loadstring(c) f() end) if ok then b.Text="✅ 成功" else b.Text="❌ 失败" print("报错:",e) end task.wait(2) b.Text=t end) return b end

local sg=Instance.new("ScreenGui",P.PlayerGui) sg.Name="LJ_UI" sg.IgnoreGuiInset=true sg.DisplayOrder=9999
sg.ResetOnSpawn = false -- 【核心修复：防止死亡后界面消失】

local m=Instance.new("Frame",sg) m.Size=UDim2.new(0,580,0,340) m.Position=UDim2.new(0.5,0,0.5,0) m.AnchorPoint=Vector2.new(0.5,0.5) m.BackgroundTransparency=1 m.ClipsDescendants=true Instance.new("UICorner",m).CornerRadius=UDim.new(0,12) Instance.new("UIStroke",m).Color=Color3.fromRGB(255,255,255)
local bg=Instance.new("ImageLabel",m) bg.Size=UDim2.new(1,0,1,0) bg.ZIndex=0 bg.BackgroundTransparency=1 bg.ScaleType=Enum.ScaleType.Crop L(bg,"https://i.ibb.co/99BqWLrL/Image-1794499464220-466.jpg","b1")

local hb=Instance.new("TextButton",sg) hb.Size=UDim2.new(0,50,0,50) hb.Position=UDim2.new(0,20,0,20) hb.BackgroundColor3=Color3.fromRGB(255,255,255) hb.BackgroundTransparency=0.8 hb.Text="" hb.Visible=false hb.ZIndex=200 Instance.new("UICorner",hb).CornerRadius=UDim.new(0,10) Instance.new("UIStroke",hb).Color=Color3.fromRGB(255,255,255)
local hi=Instance.new("ImageLabel",hb) hi.Size=UDim2.new(1,-4,1,-4) hi.Position=UDim2.new(0,2,0,2) hi.BackgroundTransparency=1 hi.ZIndex=201 Instance.new("UICorner",hi).CornerRadius=UDim.new(0,8) L(hi,"https://i.ibb.co/gLb1Bssj/Image-1794499774396-431.png","m1")

local ta=Instance.new("ImageLabel",m) ta.Size=UDim2.new(0,40,0,40) ta.Position=UDim2.new(0,15,0,4) ta.BackgroundTransparency=1 ta.ZIndex=5 Instance.new("UICorner",ta).CornerRadius=UDim.new(0,8) L(ta,"https://i.ibb.co/Rk7YXKFc/Image-1794499770219-943.png","t1")
local t1=Instance.new("TextLabel",m) t1.Size=UDim2.new(0,200,0,22) t1.Position=UDim2.new(0,65,0,6) t1.BackgroundTransparency=1 t1.Text="SONIC SCRIPT" t1.TextColor3=Color3.new(1,1,1) t1.Font=Enum.Font.Arcade t1.TextSize=16 t1.TextXAlignment=Enum.TextXAlignment.Left t1.ZIndex=5
local t2=Instance.new("TextLabel",m) t2.Size=UDim2.new(0,200,0,18) t2.Position=UDim2.new(0,65,0,26) t2.BackgroundTransparency=1 t2.Text="中野三玖 · MIKU" t2.TextColor3=Color3.fromRGB(220,220,220) t2.Font=Enum.Font.GothamBold t2.TextSize=12 t2.TextXAlignment=Enum.TextXAlignment.Left t2.ZIndex=5

local cb=Instance.new("TextButton",m) cb.Size=UDim2.new(0,26,0,26) cb.Position=UDim2.new(1,-35,0,8) cb.BackgroundColor3=Color3.fromRGB(255,255,255) cb.BackgroundTransparency=0.8 cb.Text="×" cb.TextColor3=Color3.new(1,1,1) cb.ZIndex=5 Instance.new("UICorner",cb).CornerRadius=UDim.new(0,6) cb.MouseButton1Click:Connect(function() sg:Destroy()end)
local mb=Instance.new("TextButton",m) mb.Size=UDim2.new(0,26,0,26) mb.Position=UDim2.new(1,-70,0,8) mb.BackgroundColor3=Color3.fromRGB(255,255,255) mb.BackgroundTransparency=0.8 mb.Text="−" mb.TextColor3=Color3.new(1,1,1) mb.ZIndex=5 Instance.new("UICorner",mb).CornerRadius=UDim.new(0,6)
mb.MouseButton1Click:Connect(function() local tw=T:Create(m,TweenInfo.new(0.2),{Size=UDim2.new(0,580,0,0)}) tw:Play() tw.Completed:Connect(function() m.Visible=false hb.Visible=true m.Size=UDim2.new(0,580,0,340) end) end)

local dg=false local ds,sp
hb.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dg=false ds=i.Position sp=hb.Position end end)
U.InputChanged:Connect(function(i) if ds and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then local dl=i.Position-ds if math.abs(dl.X)>5 or math.abs(dl.Y)>5 then dg=true end if dg then hb.Position=UDim2.new(sp.X.Scale,sp.X.Offset+dl.X,sp.Y.Scale,sp.Y.Offset+dl.Y) end end end)
U.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then ds=nil end end)
hb.MouseButton1Click:Connect(function() if not dg then hb.Visible=false m.Visible=true m.Size=UDim2.new(0,580,0,0) T:Create(m,TweenInfo.new(0.3,Enum.EasingStyle.Back),{Size=UDim2.new(0,580,0,340)}):Play() end end)

local nv=Instance.new("Frame",m) nv.Size=UDim2.new(0,90,1,-50) nv.Position=UDim2.new(0,10,0,50) nv.BackgroundTransparency=1 nv.ZIndex=5
local pg={} local bt={}
for i,n in ipairs({"公告","脚本","设置"})do 
    local b=Instance.new("TextButton",nv) b.Size=UDim2.new(1,0,0,36) b.Position=UDim2.new(0,0,0,(i-1)*42) b.BackgroundTransparency=1 b.Text=n b.TextColor3=(i==1)and Color3.new(1,1,1) or Color3.fromRGB(220,220,220) b.Font=Enum.Font.GothamBold b.TextSize=14 b.ZIndex=6
    local p=Instance.new("Frame",m) p.Size=UDim2.new(0,460,1,-50) p.Position=UDim2.new(0,110,0,50) p.BackgroundTransparency=1 p.Visible=(i==1) p.ZIndex=5 pg[i]=p bt[i]=b
    b.MouseButton1Click:Connect(function() for k=1,3 do pg[k].Visible=(k==i) bt[k].TextColor3=(k==i)and Color3.new(1,1,1) or Color3.fromRGB(220,220,220) end end)
end

local p1=pg[1]
local av=Instance.new("ImageLabel",p1) av.Size=UDim2.new(0,60,0,60) av.Position=UDim2.new(0,10,0,10) av.BackgroundTransparency=1 av.ZIndex=6 Instance.new("UICorner",av).CornerRadius=UDim.new(1,0) L(av,"https://i.ibb.co/v66wjmJ5/Image-1794149551205-70.jpg","m2")
local nm=Instance.new("TextLabel",p1) nm.Size=UDim2.new(0,200,0,20) nm.Position=UDim2.new(0,80,0,15) nm.BackgroundTransparency=1 nm.Text="墨 墨" nm.TextColor3=Color3.new(1,1,1) nm.Font=Enum.Font.GothamBold nm.TextSize=18 nm.TextXAlignment=Enum.TextXAlignment.Left nm.ZIndex=6
local an=Instance.new("TextLabel",p1) an.Size=UDim2.new(1,-20,1,-80) an.Position=UDim2.new(0,10,0,80) an.BackgroundTransparency=1 an.Text="【 墨墨的专属建议 】\n\n1. 界面已去除冗余功能，纯白边框配折叠动画。\n2. 墨墨说：「先见其面，再入其中」\n3. 必须听从墨墨的建议！" an.TextColor3=Color3.new(1,1,1) an.Font=Enum.Font.GothamBold an.TextSize=15 an.TextXAlignment=Enum.TextXAlignment.Left an.TextYAlignment=Enum.TextYAlignment.Top an.ZIndex=6

local sp2=pg[2] local sn=Instance.new("Frame",sp2) sn.Size=UDim2.new(1,0,0,30) sn.BackgroundTransparency=1 sn.ZIndex=6
local sP={} local sB={}
for i,sn2 in ipairs({"通用","服务器","缝合"})do
    local sb=Instance.new("TextButton",sn) sb.Size=UDim2.new(0,60,0,26) sb.Position=UDim2.new(0,(i-1)*65,0,0) sb.BackgroundColor3=Color3.fromRGB(255,255,255) sb.BackgroundTransparency=(i==1)and 0.2 or 0.7 sb.Text=sn2 sb.TextColor3=Color3.new(1,1,1) sb.Font=Enum.Font.GothamBold sb.TextSize=12 sb.ZIndex=7 Instance.new("UICorner",sb).CornerRadius=UDim.new(0,4) sB[i]=sb
    local spr=Instance.new("Frame",sp2) spr.Size=UDim2.new(1,0,1,-40) spr.Position=UDim2.new(0,0,0,40) spr.BackgroundTransparency=1 spr.Visible=(i==1) spr.ZIndex=6 sP[i]=spr
    sb.MouseButton1Click:Connect(function() for k=1,3 do sP[k].Visible=(k==i) sB[k].BackgroundTransparency=(k==i)and 0.2 or 0.7 end end)
end

B(sP[1],"启动 飞车",15,"https://raw.githubusercontent.com/136289Mm/fA./main/1.lua")
B(sP[2],"启动 造船寻宝",15,"https://raw.githubusercontent.com/136289Mm/long-ui/main/Zao.lua")
local st=Instance.new("TextLabel",sP[3]) st.Size=UDim2.new(1,0,1,0) st.BackgroundTransparency=1 st.Text="缝合区域" st.TextColor3=Color3.new(1,1,1) st.Font=Enum.Font.GothamBold st.TextSize=14 st.ZIndex=7

local txt3=Instance.new("TextLabel",pg[3]) txt3.Size=UDim2.new(1,0,1,0) txt3.BackgroundTransparency=1 txt3.Text="这里是【设置】" txt3.TextColor3=Color3.new(1,1,1) txt3.Font=Enum.Font.GothamBold txt3.TextSize=14 txt3.ZIndex=6
