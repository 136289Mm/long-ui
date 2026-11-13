local P=game:GetService("Players").LocalPlayer local T=game:GetService("TweenService") local U=game:GetService("UserInputService")
for _,v in ipairs(P.PlayerGui:GetChildren())do if v.Name=="LJ_UI" then v:Destroy()end end
local function LI(l,u,n) task.spawn(function() pcall(function() local p=n..".png" if isfile and isfile(p) and getcustomasset then l.Image=getcustomasset(p) else local d=game:HttpGet(u) if writefile and getcustomasset then writefile(p,d) l.Image=getcustomasset(p) else l.Image=u end end end) end) end

local sg=Instance.new("ScreenGui",P.PlayerGui) sg.Name="LJ_UI" sg.IgnoreGuiInset=true sg.DisplayOrder=9999
local m=Instance.new("Frame",sg) m.Size=UDim2.new(0,580,0,340) m.Position=UDim2.new(0.5,0,0.5,0) m.AnchorPoint=Vector2.new(0.5,0.5) m.BackgroundTransparency=1 m.ClipsDescendants=true Instance.new("UICorner",m).CornerRadius=UDim.new(0,12) Instance.new("UIStroke",m).Color=Color3.fromRGB(255,255,255)

local bg=Instance.new("ImageLabel",m) bg.Size=UDim2.new(1,0,1,0) bg.ZIndex=0 bg.BackgroundTransparency=1 bg.ScaleType=Enum.ScaleType.Crop 
LI(bg,"https://i.ibb.co/99BqWLrL/Image-1794499464220-466.jpg","bg_v5")

local hb=Instance.new("TextButton",sg) hb.Size=UDim2.new(0,50,0,50) hb.Position=UDim2.new(0,20,0,20) hb.BackgroundColor3=Color3.fromRGB(255,255,255) hb.BackgroundTransparency=0.8 hb.Text="" hb.Visible=false hb.ZIndex=200 Instance.new("UICorner",hb).CornerRadius=UDim.new(0,10) Instance.new("UIStroke",hb).Color=Color3.fromRGB(255,255,255)
local hbi=Instance.new("ImageLabel",hb) hbi.Size=UDim2.new(1,-4,1,-4) hbi.Position=UDim2.new(0,2,0,2) hbi.BackgroundTransparency=1 hbi.ZIndex=201 Instance.new("UICorner",hbi).CornerRadius=UDim.new(0,8) 
LI(hbi,"https://i.ibb.co/gLb1Bssj/Image-1794499774396-431.png","min_v5")
hb.MouseButton1Click:Connect(function() hb.Visible=false m.Visible=true m.Size=UDim2.new(0,580,0,0) T:Create(m,TweenInfo.new(0.4,Enum.EasingStyle.Back),{Size=UDim2.new(0,580,0,340)}):Play() end)

local topAv=Instance.new("ImageLabel",m) topAv.Size=UDim2.new(0,40,0,40) topAv.Position=UDim2.new(0,15,0,4) topAv.BackgroundTransparency=1 topAv.ZIndex=5 Instance.new("UICorner",topAv).CornerRadius=UDim.new(0,8) 
LI(topAv,"https://i.ibb.co/Rk7YXKFc/Image-1794499770219-943.png","top_face_v5")

local t1=Instance.new("TextLabel",m) t1.Size=UDim2.new(0,200,0,22) t1.Position=UDim2.new(0,65,0,6) t1.BackgroundTransparency=1 t1.Text="SONIC SCRIPT" t1.TextColor3=Color3.fromRGB(255,255,255) t1.Font=Enum.Font.Arcade t1.TextSize=16 t1.TextXAlignment=Enum.TextXAlignment.Left t1.ZIndex=5 t1.TextStrokeTransparency=1
local t2=Instance.new("TextLabel",m) t2.Size=UDim2.new(0,200,0,18) t2.Position=UDim2.new(0,65,0,26) t2.BackgroundTransparency=1 t2.Text="中野三玖 · MIKU" t2.TextColor3=Color3.fromRGB(220,220,220) t2.Font=Enum.Font.GothamBold t2.TextSize=12 t2.TextXAlignment=Enum.TextXAlignment.Left t2.ZIndex=5 t2.TextStrokeTransparency=1

local cb=Instance.new("TextButton",m) cb.Size=UDim2.new(0,26,0,26) cb.Position=UDim2.new(1,-35,0,8) cb.BackgroundColor3=Color3.fromRGB(255,255,255) cb.BackgroundTransparency=0.8 cb.Text="×" cb.TextColor3=Color3.fromRGB(255,255,255) cb.ZIndex=5 Instance.new("UICorner",cb).CornerRadius=UDim.new(0,6) Instance.new("UIStroke",cb).Color=Color3.fromRGB(255,255,255) cb.MouseButton1Click:Connect(function() sg:Destroy()end)
local mb=Instance.new("TextButton",m) mb.Size=UDim2.new(0,26,0,26) mb.Position=UDim2.new(1,-70,0,8) mb.BackgroundColor3=Color3.fromRGB(255,255,255) mb.BackgroundTransparency=0.8 mb.Text="−" mb.TextColor3=Color3.fromRGB(255,255,255) mb.ZIndex=5 Instance.new("UICorner",mb).CornerRadius=UDim.new(0,6) Instance.new("UIStroke",mb).Color=Color3.fromRGB(255,255,255)
mb.MouseButton1Click:Connect(function() local tw=T:Create(m,TweenInfo.new(0.3,Enum.EasingStyle.Quad),{Size=UDim2.new(0,580,0,0)}) tw:Play() tw.Completed:Connect(function() m.Visible=false hb.Visible=true m.Size=UDim2.new(0,580,0,340) end) end)

local nav=Instance.new("Frame",m) nav.Size=UDim2.new(0,90,1,-50) nav.Position=UDim2.new(0,10,0,50) nav.BackgroundTransparency=1 nav.ZIndex=5
local pg={} local bt={}
for i,name in ipairs({"公告","脚本","曲库","设置"})do 
    local b=Instance.new("TextButton",nav) b.Size=UDim2.new(1,0,0,36) b.Position=UDim2.new(0,0,0,(i-1)*42) b.BackgroundTransparency=1 b.Text=name b.TextColor3=(i==1)and Color3.new(1,1,1) or Color3.fromRGB(220,220,220) b.Font=Enum.Font.GothamBold b.TextSize=14 b.ZIndex=6 b.TextStrokeTransparency=1
    local p=Instance.new("Frame",m) p.Size=UDim2.new(0,460,1,-50) p.Position=UDim2.new(0,110,0,50) p.BackgroundTransparency=1 p.Visible=(i==1) p.ZIndex=5 pg[i]=p bt[i]=b
    b.MouseButton1Click:Connect(function() for k=1,4 do pg[k].Visible=(k==i) bt[k].TextColor3=(k==i)and Color3.new(1,1,1) or Color3.fromRGB(220,220,220) end end)
end

local p1=pg[1]
local av=Instance.new("ImageLabel",p1) av.Size=UDim2.new(0,60,0,60) av.Position=UDim2.new(0,10,0,10) av.BackgroundTransparency=1 av.ZIndex=6 Instance.new("UICorner",av).CornerRadius=UDim.new(1,0) 
LI(av,"https://i.ibb.co/v66wjmJ5/Image-1794149551205-70.jpg","momo_v5")
local nm=Instance.new("TextLabel",p1) nm.Size=UDim2.new(0,200,0,20) nm.Position=UDim2.new(0,80,0,15) nm.BackgroundTransparency=1 nm.Text="墨 墨" nm.TextColor3=Color3.new(1,1,1) nm.Font=Enum.Font.GothamBold nm.TextSize=18 nm.TextXAlignment=Enum.TextXAlignment.Left nm.ZIndex=6 nm.TextStrokeTransparency=1
local tt=Instance.new("TextLabel",p1) tt.Size=UDim2.new(0,200,0,16) tt.Position=UDim2.new(0,80,0,38) tt.BackgroundTransparency=1 tt.Text="SONIC 核心成员" tt.TextColor3=Color3.fromRGB(142,240,255) tt.Font=Enum.Font.GothamBold tt.TextSize=12 tt.TextXAlignment=Enum.TextXAlignment.Left tt.ZIndex=6 tt.TextStrokeTransparency=1
local ann=Instance.new("TextLabel",p1) ann.Size=UDim2.new(1,-20,1,-80) ann.Position=UDim2.new(0,10,0,80) ann.BackgroundTransparency=1 ann.Text="【 墨墨的专属建议 】\n\n1. 界面已去除冗余功能，纯白边框配折叠动画。\n2. 墨墨说：「先见其面，再入其中」\n3. 必须听从墨水墨墨的建议，他敢做敢当，这是他的建议！\n4. 祝大家在游戏中玩得愉快！" ann.TextColor3=Color3.new(1,1,1) ann.Font=Enum.Font.GothamBold ann.TextSize=15 ann.TextXAlignment=Enum.TextXAlignment.Left ann.TextYAlignment=Enum.TextYAlignment.Top ann.ZIndex=6 ann.TextStrokeTransparency=1

local sp=pg[2] local sn=Instance.new("Frame",sp) sn.Size=UDim2.new(1,0,0,30) sn.BackgroundTransparency=1 sn.ZIndex=6
local subP={} local subB={}
for i, sN in ipairs({"飞车", "缝合"}) do
    local sb=Instance.new("TextButton",sn) sb.Size=UDim2.new(0,60,0,26) sb.Position=UDim2.new(0,(i-1)*65,0,0) sb.BackgroundColor3=Color3.fromRGB(255,255,255) sb.BackgroundTransparency=(i==1) and 0.2 or 0.7 sb.Text=sN sb.TextColor3=Color3.new(1,1,1) sb.Font=Enum.Font.GothamBold sb.TextSize=12 sb.ZIndex=7 sb.TextStrokeTransparency=1 Instance.new("UICorner",sb).CornerRadius=UDim.new(0,4) subB[i]=sb
    local spr=Instance.new("Frame",sp) spr.Size=UDim2.new(1,0,1,-40) spr.Position=UDim2.new(0,0,0,40) spr.BackgroundTransparency=1 spr.Visible=(i==1) spr.ZIndex=6 subP[i]=spr
    sb.MouseButton1Click:Connect(function() for k=1,2 do subP[k].Visible=(k==i) subB[k].BackgroundTransparency=(k==i) and 0.2 or 0.7 end end)
end

local fb=Instance.new("TextButton",subP[1]) 
fb.Size=UDim2.new(0,150,0,36) fb.Position=UDim2.new(0,0,0,15) 
fb.BackgroundColor3=Color3.fromRGB(255,255,255) fb.BackgroundTransparency=0.8 
fb.Text="启动 飞车" fb.TextColor3=Color3.fromRGB(255,255,255) fb.Font=Enum.Font.GothamBold fb.TextSize=13 fb.ZIndex=7 fb.TextStrokeTransparency=1
Instance.new("UICorner",fb).CornerRadius=UDim.new(0,18) 
local fs=Instance.new("UIStroke",fb) fs.Color=Color3.fromRGB(255,255,255) fs.Thickness=1.5 fs.Transparency=0.4

fb.MouseButton1Click:Connect(function() 
    fb.Text="正在启动..." 
    T:Create(fb,TweenInfo.new(0.2),{BackgroundTransparency=0.2}):Play() 
    task.wait(0.2) 
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/136289Mm/fA./main/1.lua"))() end) 
    T:Create(fb,TweenInfo.new(0.2),{BackgroundTransparency=0.8}):Play() 
    fb.Text="启动 飞车" 
end)

local st=Instance.new("TextLabel",subP[2]) st.Size=UDim2.new(1,0,1,0) st.BackgroundTransparency=1 st.Text="这里是【缝合】脚本区\n(放入你缝合的代码)" st.TextColor3=Color3.new(1,1,1) st.Font=Enum.Font.GothamBold st.TextSize=14 st.TextStrokeTransparency=1 st.ZIndex=7

local function drag(fr,grip) local d,s,p gripp.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then d=true s=i.Position p=fr.Position end end) U.InputChanged:Connect(function(i) if d and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then local del=i.Position-s fr.Position=UDim2.new(p.X.Scale,p.X.Offset+del.X,p.Y.Scale,p.Y.Offset+del.Y) end end) U.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then d=false end end) end
drag(m,t1) drag(hb,hb)
