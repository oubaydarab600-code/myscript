--[ Zero-Protocol: Pro Spawner Integration ]--
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- قائمة أسماء الـ Brainrot (يجب أن تطابق الأسماء الموجودة في اللعبة)
local BrainrotList = {"Classic_Brainrot", "Super_Brainrot", "Mega_Brainrot", "Ultimate_Brainrot"}

-- استبدل 'RemoteName' باسم الـ RemoteEvent المسؤول عن الاستدعاء (تأكد منه من F9)
local SpawnerRemote = ReplicatedStorage:FindFirstChild("SpawnRemoteName") 

local function CreateSpawnerMenu(parentFrame)
    local List = Instance.new("ScrollingFrame", parentFrame)
    List.Size = UDim2.new(0, 200, 0, 150)
    List.Position = UDim2.new(0, 10, 0, 80)
    
    for i, name in pairs(BrainrotList) do
        local btn = Instance.new("TextButton", List)
        btn.Size = UDim2.new(0, 180, 0, 30)
        btn.Position = UDim2.new(0, 0, 0, (i-1)*35)
        btn.Text = "Spawn: " .. name
        
        btn.MouseButton1Click:Connect(function()
            if SpawnerRemote then
                SpawnerRemote:FireServer(name) -- إرسال اسم الشخصية المحددة للـ Remote
                print("تم إرسال أمر استدعاء: " .. name)
            else
                warn("خطأ: لم يتم العثور على SpawnerRemote")
            end
        end)
    end
end
