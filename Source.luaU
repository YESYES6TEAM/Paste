local Paste = {}

function Paste:Create(titleText)
    local player = game:GetService("Players").LocalPlayer
    local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local frame = Instance.new("Frame", gui)
    frame.Size = UDim2.new(0, 190, 0, 240)
    frame.Position = UDim2.new(0.4, 0, 0.3, 0)
    frame.BackgroundColor3 = Color3.fromRGB(23, 23, 22)
    frame.BackgroundTransparency = 0.55
    Instance.new("UICorner", frame)

    local title = Instance.new("TextLabel", frame)
    title.Size = UDim2.new(1, 0, 0, 30)
    title.BackgroundTransparency = 1
    title.Text = titleText or "Library"
    title.TextColor3 = Color3.new(1,1,1)
    title.FontFace = Font.new("rbxassetid://12187371840")
    title.TextSize = 14

    local scroll = Instance.new("ScrollingFrame", frame)
    scroll.Size = UDim2.new(1, -12, 1, -40)
    scroll.Position = UDim2.new(0, 6, 0, 35)
    scroll.BackgroundTransparency = 1
    scroll.BorderSizePixel = 0
    scroll.ScrollBarThickness = 4
    local layout = Instance.new("UIListLayout", scroll)
    layout.Padding = UDim.new(0, 5)

    local drag, input, start, startPos
    frame.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            drag = true
            start = i.Position
            startPos = frame.Position
            i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then drag = false end end)
        end
    end)
    frame.InputChanged:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then input = i end
    end)
    game:GetService("UserInputService").InputChanged:Connect(function(i)
        if i == input and drag then
            local delta = i.Position - start
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    local toggle = Instance.new("ImageButton", gui)
    toggle.Size = UDim2.new(0, 56, 0, 56)
    toggle.Position = UDim2.new(0, 6, 0, 94)
    toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggle.BorderSizePixel = 0
    toggle.Image = "rbxassetid://135089453328154"
    Instance.new("UICorner", toggle).CornerRadius = UDim.new(1, 0)
    toggle.MouseButton1Click:Connect(function() frame.Visible = not frame.Visible end)

    local section = {}
    function section:AddButton(txt, callback)
        local b = Instance.new("TextButton", scroll)
        b.Size = UDim2.new(1, -6, 0, 26)
        b.BackgroundColor3 = Color3.fromRGB(73,73,73)
        b.TextColor3 = Color3.new(1,1,1)
        b.Text = txt
        Instance.new("UICorner", b)
        b.MouseButton1Click:Connect(function() if callback then callback() end end)
    end
    function section:AddTextbox(placeholder, callback)
        local box = Instance.new("TextBox", scroll)
        box.Size = UDim2.new(1, -6, 0, 26)
        box.BackgroundColor3 = Color3.fromRGB(73,73,73)
        box.TextColor3 = Color3.new(1,1,1)
        box.PlaceholderText = placeholder
        box.ClearTextOnFocus = false
        Instance.new("UICorner", box)
        box.FocusLost:Connect(function() if callback then callback(box.Text) end end)
    end
    function section:AddToggle(name, callback)
        local t = Instance.new("TextButton", scroll)
        t.Size = UDim2.new(1, -6, 0, 26)
        t.BackgroundColor3 = Color3.fromRGB(73,73,73)
        t.TextColor3 = Color3.new(1,1,1)
        t.Text = name..": Off"
        Instance.new("UICorner", t)
        local state = false
        t.MouseButton1Click:Connect(function()
            state = not state
            t.Text = name..": "..(state and "On" or "Off")
            if callback then callback(state) end
        end)
    end
    function section:AddDropdown(name, options, callback)
        local main = Instance.new("TextButton", scroll)
        main.Size = UDim2.new(1, -6, 0, 26)
        main.BackgroundColor3 = Color3.fromRGB(73,73,73)
        main.TextColor3 = Color3.new(1,1,1)
        main.Text = name
        Instance.new("UICorner", main)
        local drop = Instance.new("Frame", scroll)
        drop.Size = UDim2.new(1, -6, 0, #options * 24)
        drop.BackgroundColor3 = Color3.fromRGB(30,30,30)
        drop.Visible = false
        Instance.new("UICorner", drop)
        local layout2 = Instance.new("UIListLayout", drop)
        layout2.Padding = UDim.new(0, 2)
        for _,v in ipairs(options) do
            local o = Instance.new("TextButton", drop)
            o.Size = UDim2.new(1, -6, 0, 22)
            o.BackgroundColor3 = Color3.fromRGB(50,50,50)
            o.TextColor3 = Color3.new(1,1,1)
            o.Text = v
            Instance.new("UICorner", o)
            o.MouseButton1Click:Connect(function()
                if callback then callback(v) end
                drop.Visible = false
                main.Text = name..": "..v
            end)
        end
        main.MouseButton1Click:Connect(function()
            drop.Visible = not drop.Visible
        end)
    end
    return section
end

return Paste
