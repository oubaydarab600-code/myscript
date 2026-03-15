--[ Zero-Protocol: Pro Admin GUI Framework ]--
local CoreGui = game:GetService("CoreGui")

-- تدمير الواجهة القديمة إذا وُجدت لمنع التراكم
if CoreGui:FindFirstChild("Architect_Pro_Panel") then
    CoreGui.Architect_Pro_Panel:Destroy()
end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "Architect_Pro_Panel"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 220, 0, 300)
Frame.Position = UDim2.new(0.05, 0, 0.3, 0)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Active = true
Frame.Draggable = true

-- دالة إنشاء الأزرار (لتوفير الوقت وتنسيق الشكل)
local function CreateButton(name, text, pos, callback)
    local btn = Instance.new("TextButton", Frame)
    btn.Name = name
    btn.Text = text
    btn.Size = UDim2.new(0, 200, 0, 40)
    btn.Position = pos
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- زر السرعة
CreateButton("SpeedBtn", "Speed: 100", UDim2.new(0.05, 0, 0.05, 0), function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

-- زر الأموال (يجب استبدال RemoteName)
CreateButton("MoneyBtn", "Add Money", UDim2.new(0.05, 0, 0.25, 0), function()
    local remote = game.ReplicatedStorage:FindFirstChild("MoneyRemoteName")
    if remote then remote:FireServer(999999) end
end)

-- زر تفعيل الأحداث (يجب استبدال RemoteName)
CreateButton("EventBtn", "Spawn Brainrot", UDim2.new(0.05, 0, 0.45, 0), function()
    local remote = game.ReplicatedStorage:FindFirstChild("EventRemoteName")
    if remote then remote:FireServer() end
end)
