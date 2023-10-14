--[[

________  ________   ___  ________  ________           ___       ___  ________
|\   __  \|\   ___  \|\  \|\   __  \|\   ___  \        |\  \     |\  \|\   __  \
\ \  \|\  \ \  \\ \  \ \  \ \  \|\  \ \  \\ \  \       \ \  \    \ \  \ \  \|\ /_
\ \  \\\  \ \  \\ \  \ \  \ \  \\\  \ \  \\ \  \       \ \  \    \ \  \ \   __  \
\ \  \\\  \ \  \\ \  \ \  \ \  \\\  \ \  \\ \  \       \ \  \____\ \  \ \  \|\  \
\ \_______\ \__\\ \__\ \__\ \_______\ \__\\ \__\       \ \_______\ \__\ \_______\
\|_______|\|__| \|__|\|__|\|_______|\|__| \|__|        \|_______|\|__|\|_______|



Note that this is my first UI lib. I'm aware that it is basic.
I named it onion lib because it was originally purple like Tor



_____ ______ ___________ _____ _____ _____
/  __ \| ___ \  ___|  _  \_   _|_   _/  ___|
| /  \/| |_/ / |__ | | | | | |   | | \ `--.
| |    |    /|  __|| | | | | |   | |  `--. \
| \__/\| |\ \| |___| |/ / _| |_  | | /\__/ /
\____/\_| \_\____/|___/  \___/  \_/ \____/

MAIN DEV: .tip5: Creating Ui, programming ui lib


--People's stuff I used:
Silentben8x: Button Ripple effect
Credit to Gerad ui lib and twink ui lib for the slider calcs

]]
--#region ui lib
local Library = {}
local TweenService = game:GetService("TweenService")
local mouse = game.Players.LocalPlayer:GetMouse()
local UserInputService = game:GetService("UserInputService")

function Ripple(obj)
    task.spawn(
        function()
            if obj.ClipsDescendants ~= true then
                obj.ClipsDescendants = true
            end
            local Ripple = Instance.new("ImageLabel")
            Ripple.Name = "Ripple"
            Ripple.Parent = obj
            Ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Ripple.BackgroundTransparency = 1.000
            Ripple.ZIndex = 8
            Ripple.Image = "rbxassetid://2708891598"
            Ripple.ImageTransparency = 0.800
            Ripple.ScaleType = Enum.ScaleType.Fit

            Ripple.ImageColor3 = Color3.fromRGB(255, 255, 255)
            Ripple.Position =
                UDim2.new(
                (mouse.X - Ripple.AbsolutePosition.X) / obj.AbsoluteSize.X,
                0,
                (mouse.Y - Ripple.AbsolutePosition.Y) / obj.AbsoluteSize.Y,
                0
            )
            TweenService:Create(
                Ripple,
                TweenInfo.new(.3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
                {Position = UDim2.new(-5.5, 0, -5.5, 0), Size = UDim2.new(12, 0, 12, 0)}
            ):Play()
            wait(0.15)
            TweenService:Create(
                Ripple,
                TweenInfo.new(.3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
                {ImageTransparency = 1}
            ):Play()
            wait(.3)
            Ripple:Destroy()
        end
    )
end

function Library:Window(name)
    local GUI = {}
    local winName = name or "OnionLib"
    --#region make window
    -- StarterGui.OnionLib
    GUI["1"] = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
    GUI["1"]["IgnoreGuiInset"] = true
    GUI["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets
    GUI["1"]["Name"] = [[OnionLib]]
    GUI["1"]["ResetOnSpawn"] = false

    -- StarterGui.OnionLib.NotifHolder
    GUI["6d"] = Instance.new("Frame", GUI["1"])
    GUI["6d"]["BorderSizePixel"] = 0
    GUI["6d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
    GUI["6d"]["AnchorPoint"] = Vector2.new(1, 0)
    GUI["6d"]["BackgroundTransparency"] = 1
    GUI["6d"]["Size"] = UDim2.new(0, 300, 0.5, 0)
    GUI["6d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
    GUI["6d"]["Position"] = UDim2.new(1, 0, 0.47999998927116394, 0)
    GUI["6d"]["Name"] = [[NotifHolder]]

    -- StarterGui.OnionLib.NotifHolder.MainNotifHolder
    GUI["6e"] = Instance.new("Frame", GUI["6d"])
    GUI["6e"]["BorderSizePixel"] = 0
    GUI["6e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
    GUI["6e"]["BackgroundTransparency"] = 1
    GUI["6e"]["Size"] = UDim2.new(1, 0, 1, 0)
    GUI["6e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
    GUI["6e"]["Name"] = [[MainNotifHolder]]

    -- StarterGui.OnionLib.NotifHolder.MainNotifHolder.UIListLayout
    GUI["6f"] = Instance.new("UIListLayout", GUI["6e"])
    GUI["6f"]["VerticalAlignment"] = Enum.VerticalAlignment.Bottom
    GUI["6f"]["Padding"] = UDim.new(0, 5)
    GUI["6f"]["SortOrder"] = Enum.SortOrder.LayoutOrder

    -- StarterGui.OnionLib.Main
    GUI["2"] = Instance.new("Frame", GUI["1"])
    GUI["2"]["BorderSizePixel"] = 0
    GUI["2"]["BackgroundColor3"] = Color3.fromRGB(44, 44, 44)
    GUI["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
    GUI["2"]["Size"] = UDim2.new(0, 550, 0, 450)
    GUI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
    GUI["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)
    GUI["2"]["Name"] = [[Main]]

    -- StarterGui.OnionLib.Main.DropShadowHolder
    GUI["3"] = Instance.new("Frame", GUI["2"])
    GUI["3"]["ZIndex"] = 0
    GUI["3"]["BorderSizePixel"] = 0
    GUI["3"]["BackgroundTransparency"] = 1
    GUI["3"]["Size"] = UDim2.new(1, 0, 1, 0)
    GUI["3"]["Name"] = [[DropShadowHolder]]

    -- StarterGui.OnionLib.Main.DropShadowHolder.DropShadow
    GUI["4"] = Instance.new("ImageLabel", GUI["3"])
    GUI["4"]["ZIndex"] = 0
    GUI["4"]["BorderSizePixel"] = 0
    GUI["4"]["SliceCenter"] = Rect.new(49, 49, 450, 450)
    GUI["4"]["ScaleType"] = Enum.ScaleType.Slice
    GUI["4"]["ImageColor3"] = Color3.fromRGB(0, 0, 0)
    GUI["4"]["ImageTransparency"] = 0.5
    GUI["4"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
    GUI["4"]["Image"] = [[rbxassetid://6014261993]]
    GUI["4"]["Size"] = UDim2.new(1, 47, 1, 47)
    GUI["4"]["Name"] = [[DropShadow]]
    GUI["4"]["BackgroundTransparency"] = 1
    GUI["4"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)

    -- StarterGui.OnionLib.Main.Topbar
    GUI["5"] = Instance.new("Frame", GUI["2"])
    GUI["5"]["BorderSizePixel"] = 0
    GUI["5"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36)
    GUI["5"]["Size"] = UDim2.new(1, 0, 0.08500000089406967, 0)
    GUI["5"]["BorderColor3"] = Color3.fromRGB(49, 49, 49)
    GUI["5"]["Name"] = [[Topbar]]

    -- StarterGui.OnionLib.Main.Topbar.UICorner
    GUI["6"] = Instance.new("UICorner", GUI["5"])

    -- StarterGui.OnionLib.Main.Topbar.Hide
    GUI["7"] = Instance.new("Frame", GUI["5"])
    GUI["7"]["BorderSizePixel"] = 0
    GUI["7"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36)
    GUI["7"]["AnchorPoint"] = Vector2.new(0, 1)
    GUI["7"]["Size"] = UDim2.new(1, 0, 0.6, 0)
    GUI["7"]["BorderColor3"] = Color3.fromRGB(49, 49, 49)
    GUI["7"]["Position"] = UDim2.new(0, 0, 1, 0)
    GUI["7"]["Name"] = [[Hide]]

    -- StarterGui.OnionLib.Main.Topbar.Title
    GUI["8"] = Instance.new("TextLabel", GUI["5"])
    GUI["8"]["BorderSizePixel"] = 0
    GUI["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
    GUI["8"]["TextXAlignment"] = Enum.TextXAlignment.Left
    GUI["8"]["FontFace"] =
        Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    GUI["8"]["TextSize"] = 20
    GUI["8"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
    GUI["8"]["Size"] = UDim2.new(0.30000001192092896, 0, 1, 0)
    GUI["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
    GUI["8"]["Text"] = winName
    GUI["8"]["Name"] = [[Title]]
    GUI["8"]["BackgroundTransparency"] = 1

    -- StarterGui.OnionLib.Main.Topbar.Title.UIPadding
    GUI["9"] = Instance.new("UIPadding", GUI["8"])
    GUI["9"]["PaddingLeft"] = UDim.new(0, 12)

    -- StarterGui.OnionLib.Main.Topbar.Exit
    GUI["a"] = Instance.new("ImageButton", GUI["5"])
    GUI["a"]["BorderSizePixel"] = 0
    GUI["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
    GUI["a"]["AnchorPoint"] = Vector2.new(1, 0)
    GUI["a"]["Image"] = [[http://www.roblox.com/asset/?id=10152135063]]
    GUI["a"]["Size"] = UDim2.new(0, 25, 0, 25)
    GUI["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
    GUI["a"]["Name"] = [[Exit]]
    GUI["a"]["BackgroundTransparency"] = 1
    GUI["a"]["Position"] = UDim2.new(1, -6, 0, 6)

    -- StarterGui.OnionLib.Main.Topbar.Line
    GUI["b"] = Instance.new("Frame", GUI["5"])
    GUI["b"]["BorderSizePixel"] = 0
    GUI["b"]["BackgroundColor3"] = Color3.fromRGB(83, 9, 173)
    GUI["b"]["Size"] = UDim2.new(1, 0, 0.079999998216066, 0)
    GUI["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
    GUI["b"]["Position"] = UDim2.new(0, 0, 0.949999988079071, 0)
    GUI["b"]["Name"] = [[Line]]

    -- StarterGui.OnionLib.Main.Navbar
    GUI["c"] = Instance.new("Frame", GUI["2"])
    GUI["c"]["BorderSizePixel"] = 0
    GUI["c"]["BackgroundColor3"] = Color3.fromRGB(54, 54, 54)
    GUI["c"]["AnchorPoint"] = Vector2.new(0, 1)
    GUI["c"]["Size"] = UDim2.new(0.30000001192092896, 0, 0.9200000166893005, 0)
    GUI["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
    GUI["c"]["Position"] = UDim2.new(0, 0, 1, 0)
    GUI["c"]["Name"] = [[Navbar]]

    -- StarterGui.OnionLib.Main.Navbar.UICorner
    GUI["d"] = Instance.new("UICorner", GUI["c"])

    -- StarterGui.OnionLib.Main.Navbar.Hide
    GUI["e"] = Instance.new("Frame", GUI["c"])
    GUI["e"]["BorderSizePixel"] = 0
    GUI["e"]["BackgroundColor3"] = Color3.fromRGB(54, 54, 54)
    GUI["e"]["Size"] = UDim2.new(0.10000000149011612, 0, 0.10000000149011612, 0)
    GUI["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
    GUI["e"]["Name"] = [[Hide]]

    -- StarterGui.OnionLib.Main.Navbar.Hide2
    GUI["f"] = Instance.new("Frame", GUI["c"])
    GUI["f"]["BorderSizePixel"] = 0
    GUI["f"]["BackgroundColor3"] = Color3.fromRGB(54, 54, 54)
    GUI["f"]["AnchorPoint"] = Vector2.new(0.5, 0)
    GUI["f"]["Size"] = UDim2.new(0.05, 0, 1, 0)
    GUI["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
    GUI["f"]["Position"] = UDim2.new(1, 0, 0, 0)
    GUI["f"]["Name"] = [[Hide2]]

    -- StarterGui.OnionLib.Main.Navbar.ButtonHolder
    GUI["10"] = Instance.new("ScrollingFrame", GUI["c"])
    GUI["10"]["Active"] = true
    GUI["10"]["BorderSizePixel"] = 0
    GUI["10"]["CanvasSize"] = UDim2.new(0, 0, 0, 0)
    GUI["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
    GUI["10"]["BackgroundTransparency"] = 1
    GUI["10"]["Size"] = UDim2.new(1, 0, 1, 0)
    GUI["10"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0)
    GUI["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
    GUI["10"]["Name"] = [[ButtonHolder]]
    GUI["10"]["ScrollBarImageTransparency"] = 1
    GUI["10"]["ScrollBarThickness"] = 0

    -- StarterGui.OnionLib.Main.Navbar.ButtonHolder.UIListLayout
    GUI["11"] = Instance.new("UIListLayout", GUI["10"])
    GUI["11"]["Padding"] = UDim.new(0, 4)
    GUI["11"]["SortOrder"] = Enum.SortOrder.LayoutOrder

    -- StarterGui.OnionLib.Main.Navbar.close
    GUI["1a"] = Instance.new("ImageButton", GUI["c"])
    GUI["1a"]["ZIndex"] = 4
    GUI["1a"]["BorderSizePixel"] = 0
    GUI["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
    GUI["1a"]["AnchorPoint"] = Vector2.new(1, 0)
    GUI["1a"]["Image"] = [[http://www.roblox.com/asset/?id=7738141518]]
    GUI["1a"]["Size"] = UDim2.new(0, 35, 0, 35)
    GUI["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
    GUI["1a"]["Name"] = [[close]]
    GUI["1a"]["Rotation"] = 180
    GUI["1a"]["BackgroundTransparency"] = 1
    GUI["1a"]["Position"] = UDim2.new(1, 0, 0, 0)

    -- StarterGui.OnionLib.Main.UICorner
    GUI["1b"] = Instance.new("UICorner", GUI["2"])

    -- StarterGui.OnionLib.Main.Tabholder
    GUI["1c"] = Instance.new("Frame", GUI["2"])
    GUI["1c"]["BorderSizePixel"] = 0
    GUI["1c"]["BackgroundColor3"] = Color3.fromRGB(58, 58, 58)
    GUI["1c"]["AnchorPoint"] = Vector2.new(1, 0.5)
    GUI["1c"]["BackgroundTransparency"] = 1
    GUI["1c"]["Size"] = UDim2.new(0.6499999761581421, 0, 0.8799999952316284, 0)
    GUI["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
    GUI["1c"]["Position"] = UDim2.new(0.9839842915534973, 0, 0.5380000472068787, 0)
    GUI["1c"]["Name"] = [[Tabholder]]

    --#endregion
    local currentTab
    local currentFrame
    local navBarClosed = false

    function GUI:Notification(args)
        local title = args[1] or "Notification"
        local desc = args[2] or "Description"
        local time = args[3] or 2.5

        local notif = {}
        -- StarterGui.OnionLib.NotifHolder.MainNotifHolder.Notification
        notif["70"] = Instance.new("Frame", GUI["6e"])
        notif["70"]["BorderSizePixel"] = 0
        notif["70"]["BackgroundColor3"] = Color3.fromRGB(58, 58, 58)
        notif["70"]["Size"] = UDim2.new(0, 290, 0, 0)
        notif["70"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
        notif["70"]["Position"] = UDim2.new(0, 0, 0.800000011920929, 0)
        notif["70"]["Name"] = [[Notification]]
        notif["70"]["BackgroundTransparency"] = 1

        -- StarterGui.OnionLib.NotifHolder.MainNotifHolder.Notification.UICorner
        notif["71"] = Instance.new("UICorner", notif["70"])

        -- StarterGui.OnionLib.NotifHolder.MainNotifHolder.Notification.Title
        notif["72"] = Instance.new("TextLabel", notif["70"])
        notif["72"]["BorderSizePixel"] = 0
        notif["72"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
        notif["72"]["TextXAlignment"] = Enum.TextXAlignment.Left
        notif["72"]["FontFace"] =
            Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        notif["72"]["TextSize"] = 16
        notif["72"]["TextColor3"] = Color3.fromRGB(107, 81, 255)
        notif["72"]["Size"] = UDim2.new(1, 0, 0.4000000059604645, 0)
        notif["72"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
        notif["72"]["Text"] = title
        notif["72"]["Name"] = [[Title]]
        notif["72"]["BackgroundTransparency"] = 1
        notif["72"]["TextTransparency"] = 1

        -- StarterGui.OnionLib.NotifHolder.MainNotifHolder.Notification.Title.UIPadding
        notif["73"] = Instance.new("UIPadding", notif["72"])
        notif["73"]["PaddingLeft"] = UDim.new(0, 7)

        -- StarterGui.OnionLib.NotifHolder.MainNotifHolder.Notification.Desc
        notif["74"] = Instance.new("TextLabel", notif["70"])
        notif["74"]["TextWrapped"] = true
        notif["74"]["BorderSizePixel"] = 0
        notif["74"]["RichText"] = true
        notif["74"]["TextYAlignment"] = Enum.TextYAlignment.Top
        notif["74"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
        notif["74"]["TextXAlignment"] = Enum.TextXAlignment.Left
        notif["74"]["FontFace"] =
            Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        notif["74"]["TextSize"] = 14
        notif["74"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
        notif["74"]["Size"] = UDim2.new(1, 0, 0.6000000238418579, 0)
        notif["74"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
        notif["74"]["Text"] = desc
        notif["74"]["Name"] = [[Desc]]
        notif["74"]["BackgroundTransparency"] = 1
        notif["74"]["Position"] = UDim2.new(0, 0, 0.4000000059604645, 0)
        notif["74"]["TextTransparency"] = 1

        -- StarterGui.OnionLib.NotifHolder.MainNotifHolder.Notification.Desc.UIPadding
        notif["75"] = Instance.new("UIPadding", notif["74"])
        notif["75"]["PaddingLeft"] = UDim.new(0, 7)

        -- StarterGui.OnionLib.NotifHolder.MainNotifHolder.Notification.ProgressBar
        notif["76"] = Instance.new("Frame", notif["70"])
        notif["76"]["BorderSizePixel"] = 0
        notif["76"]["BackgroundColor3"] = Color3.fromRGB(83, 9, 173)
        notif["76"]["AnchorPoint"] = Vector2.new(1, 0)
        notif["76"]["Size"] = UDim2.new(1, 0, 0.07999999821186066, 0)
        notif["76"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
        notif["76"]["Position"] = UDim2.new(1, 0, 0.9200000166893005, 0)
        notif["76"]["Name"] = [[ProgressBar]]
        notif["76"]["BackgroundTransparency"] = 1

        -- StarterGui.OnionLib.NotifHolder.MainNotifHolder.Notification.ProgressBar.UICorner
        notif["77"] = Instance.new("UICorner", notif["76"])
        notif["77"]["CornerRadius"] = UDim.new(1, 100)

        task.spawn(
            function()
                TweenService:Create(
                    notif["70"],
                    TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    {BackgroundTransparency = 0}
                ):Play()
                local sizeTween =
                    TweenService:Create(
                    notif["70"],
                    TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 290, 0, 75)}
                )
                sizeTween:Play()
                sizeTween.Completed:Wait()
                TweenService:Create(
                    notif["72"],
                    TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    {TextTransparency = 0}
                ):Play()
                TweenService:Create(
                    notif["74"],
                    TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    {TextTransparency = 0}
                ):Play()
                TweenService:Create(
                    notif["76"],
                    TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    {BackgroundTransparency = 0}
                ):Play()

                --notification code
                local timerTween =
                    TweenService:Create(
                    notif["76"],
                    TweenInfo.new(time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 0, 0.08, 0)}
                )
                timerTween:Play()
                timerTween.Completed:Wait()

                TweenService:Create(
                    notif["74"],
                    TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    {TextTransparency = 1}
                ):Play()
                local textTween =
                    TweenService:Create(
                    notif["72"],
                    TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    {TextTransparency = 1}
                )
                textTween:Play()
                textTween.Completed:Wait()

                local sizeTween =
                    TweenService:Create(
                    notif["70"],
                    TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 290, 0, 0)}
                )
                sizeTween:Play()
                sizeTween.Completed:Wait()
                TweenService:Create(
                    notif["70"],
                    TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    {BackgroundTransparency = 1}
                ):Play()

                notif["70"]:Destroy()
            end
        )
        return notif
    end

    --#region closeBtn
    GUI["a"].MouseButton1Down:Connect(
        function()

            for i,v in pairs(GUI['2']:GetDescendants()) do
                if v.Name == "Navbar" or v.Name == "Tabholder" or v.Name == "Topbar" or v.Name == "DropShadowHolder" then
                v:Destroy()
                end
            end

            local closeTween =
                TweenService:Create(
                GUI["2"],
                TweenInfo.new(1.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 0, 0, 0)}
            )
            closeTween:Play()
            closeTween.Completed:Wait()
            GUI["1"]:Destroy()
        end
    )

    GUI["1a"].MouseButton1Down:Connect(
        function()
            local navbar = GUI["c"]
            navBarClosed = not navBarClosed

            local rotation = navBarClosed and 0 or 180
            local closedTransparency = navBarClosed and 1 or 0
            local tabholderSize =
                navBarClosed and UDim2.new(0.95, 0, 0.88, 0) or UDim2.new(0.6499999761581421, 0, 0.8799999952316284, 0)
            local size = navBarClosed and UDim2.new(0.001, 0, 0.92, 0) or UDim2.new(0.3, 0, 0.92, 0)
            local closePos = navBarClosed and UDim2.new(0, 30, 0, 10) or UDim2.new(0, 165, 0, 0)
            TweenService:Create(
                navbar,
                TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                {Size = size}
            ):Play()
            local rotate =
                TweenService:Create(
                GUI["1a"],
                TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                {Rotation = rotation}
            )
            rotate:Play()
            TweenService:Create(
                GUI["1a"],
                TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                {Position = closePos}
            ):Play()
            for i, v in pairs(GUI["10"]:GetChildren()) do
                if v:IsA("Frame") then
                    TweenService:Create(
                        v.TextButton,
                        TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                        {TextTransparency = closedTransparency}
                    ):Play()
                    TweenService:Create(
                        v.TextButton.ImageLabel,
                        TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                        {ImageTransparency = closedTransparency}
                    ):Play()
                end
            end

            TweenService:Create(
                navbar,
                TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                {BackgroundTransparency = closedTransparency}
            ):Play()
            TweenService:Create(
                navbar.Hide,
                TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                {BackgroundTransparency = closedTransparency}
            ):Play()
            TweenService:Create(
                navbar.Hide2,
                TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                {BackgroundTransparency = closedTransparency}
            ):Play()

            TweenService:Create(
                GUI["1c"],
                TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                {Size = tabholderSize}
            ):Play()

            if rotation == 180 then
                currentTab.BackgroundTransparency = 0.8
                currentTab.Visible = true
            else
                currentTab.BackgroundTransparency = 1
                currentTab.Visible = false
            end
        end
    )
    --#endregion

    --#region drag

    local gui = GUI["5"]
    local gui2 = GUI["2"]

    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        gui2.Position =
            UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    gui.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = gui2.Position

                input.Changed:Connect(
                    function()
                        if input.UserInputState == Enum.UserInputState.End then
                            dragging = false
                        end
                    end
                )
            end
        end
    )

    gui.InputChanged:Connect(
        function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseMovement or
                    input.UserInputType == Enum.UserInputType.Touch
             then
                dragInput = input
            end
        end
    )

    UserInputService.InputChanged:Connect(
        function(input)
            if input == dragInput and dragging then
                update(input)
            end
        end
    )
    --#endregion
    function GUI:CreateTab(options)
        local name = options[1] or "Tab"
        local icon = options[2] or "http://www.roblox.com/asset/?id=7436811843"

        local Tab = {}

        --#region ui
        -- StarterGui.OnionLib.Main.Navbar.ButtonHolder.Tab
        Tab["12"] = Instance.new("Frame", GUI["10"])
        Tab["12"]["BorderSizePixel"] = 0
        Tab["12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
        Tab["12"]["BackgroundTransparency"] = 1
        Tab["12"]["Size"] = UDim2.new(1, 0, 0, 41)
        Tab["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
        Tab["12"]["Name"] = [[Tab]]

        -- StarterGui.OnionLib.Main.Navbar.ButtonHolder.Tab.TextButton
        Tab["13"] = Instance.new("TextButton", Tab["12"])
        Tab["13"]["ZIndex"] = 3
        Tab["13"]["BorderSizePixel"] = 0
        Tab["13"]["TextXAlignment"] = Enum.TextXAlignment.Left
        Tab["13"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
        Tab["13"]["TextSize"] = 17
        Tab["13"]["FontFace"] =
            Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        Tab["13"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
        Tab["13"]["Size"] = UDim2.new(1, 0, 1, 0)
        Tab["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
        Tab["13"]["BackgroundTransparency"] = 1
        Tab["13"]["Text"] = name

        -- StarterGui.OnionLib.Main.Navbar.ButtonHolder.Tab.TextButton.ImageLabel
        Tab["14"] = Instance.new("ImageLabel", Tab["13"])
        Tab["14"]["BorderSizePixel"] = 0
        Tab["14"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
        Tab["14"]["AnchorPoint"] = Vector2.new(0, 0.5)
        Tab["14"]["Image"] = icon
        Tab["14"]["Size"] = UDim2.new(0, 32.5, 0, 30)
        Tab["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
        Tab["14"]["BackgroundTransparency"] = 1
        Tab["14"]["Position"] = UDim2.new(-0.30, 0, 0.44999998807907104, 0)

        -- StarterGui.OnionLib.Main.Navbar.ButtonHolder.Tab.TextButton.UIPadding
        Tab["15"] = Instance.new("UIPadding", Tab["13"])
        Tab["15"]["PaddingLeft"] = UDim.new(0, 45)

        -- StarterGui.OnionLib.Main.Navbar.ButtonHolder.Tab.UICorner
        Tab["16"] = Instance.new("UICorner", Tab["12"])

        local scrollframe = GUI["10"]
        local tablayout = GUI["11"]
        scrollframe.CanvasSize = UDim2.new(0, 0, 0, tablayout.AbsoluteContentSize.Y + 3)

        -- StarterGui.OnionLib.Main.Navbar.SelectedTab.UICorner
        Tab["19"] = Instance.new("UICorner", Tab["SelectedTab"])

        -- StarterGui.OnionLib.Main.Tabholder.TopTab
        Tab["1d"] = Instance.new("ScrollingFrame", GUI["1c"])
        Tab["1d"]["Active"] = true
        Tab["1d"]["BorderSizePixel"] = 0
        Tab["1d"]["CanvasSize"] = UDim2.new(0, 0, 0, 0)
        Tab["1d"]["CanvasPosition"] = Vector2.new(0, 36.65997314453125)
        Tab["1d"]["ScrollBarImageTransparency"] = 1
        Tab["1d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
        Tab["1d"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
        Tab["1d"]["BackgroundTransparency"] = 1
        Tab["1d"]["Size"] = UDim2.new(1, 0, 1, 0)
        Tab["1d"]["Position"] = UDim2.new(-0.01, 0, 0, 0)
        Tab["1d"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0)
        Tab["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
        Tab["1d"]["Name"] = name
        Tab["1d"]["ZIndex"] = 1
        Tab["1d"]["Visible"] = false

        -- StarterGui.OnionLib.Main.Tabholder.TopTab.UIPadding
        Tab["24"] = Instance.new("UIPadding", Tab["1d"])
        Tab["24"]["PaddingTop"] = UDim.new(0, 1)
        Tab["24"]["PaddingRight"] = UDim.new(0, 1)
        Tab["24"]["PaddingBottom"] = UDim.new(0, 1)
        Tab["24"]["PaddingLeft"] = UDim.new(0, 1)

        -- StarterGui.OnionLib.Main.Tabholder.TopTab.UIListLayout
        Tab["25"] = Instance.new("UIListLayout", Tab["1d"])
        Tab["25"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
        Tab["25"]["Padding"] = UDim.new(0, 10)
        Tab["25"]["SortOrder"] = Enum.SortOrder.LayoutOrder

        if currentTab == nil then
            -- StarterGui.OnionLib.Main.Navbar.SelectedTab
            currentTab = Tab["12"]
            currentFrame = Tab["1d"]
            currentTab["BackgroundTransparency"] = 0.8
            currentFrame.Visible = true
            currentFrame.ZIndex = 5
        end

        Tab["13"].MouseButton1Down:Connect(
            function()
                TweenService:Create(
                    currentTab,
                    TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    {BackgroundTransparency = 1}
                ):Play()
                currentFrame.Visible = false
                currentFrame.ZIndex = 1
                currentTab = Tab["12"]
                currentFrame = Tab["1d"]
                TweenService:Create(
                    currentTab,
                    TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    {BackgroundTransparency = 0.8}
                ):Play()
                currentFrame.ZIndex = 5
                currentFrame.Visible = true
            end
        )
        --#endregion

        local function UpdateScrollFrame()
            local frame = Tab["1d"]
            local layout = Tab["25"]
            frame.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 3)
        end

        function Tab:Button(text, callback)
            local text = text or "Button"
            callback = callback or function()
                end

            local Button = {}

            --#region ui
            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Button
            Button["1e"] = Instance.new("Frame", Tab["1d"])
            Button["1e"]["BorderSizePixel"] = 0
            Button["1e"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36)
            Button["1e"]["Size"] = UDim2.new(0.9300000071525574, 0, 0.10000000149011612, 0)
            Button["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            Button["1e"]["Name"] = [[Button]]

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Button.UIStroke
            Button["1f"] = Instance.new("UIStroke", Button["1e"])
            Button["1f"]["Color"] = Color3.fromRGB(83, 9, 173)
            Button["1f"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Button.UICorner
            Button["20"] = Instance.new("UICorner", Button["1e"])

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Button.ImageLabel
            Button["21"] = Instance.new("ImageLabel", Button["1e"])
            Button["21"]["BorderSizePixel"] = 0
            Button["21"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
            Button["21"]["Image"] = [[http://www.roblox.com/asset/?id=10888474558]]
            Button["21"]["Size"] = UDim2.new(0, 25, 0, 25)
            Button["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            Button["21"]["BackgroundTransparency"] = 1
            Button["21"]["AnchorPoint"] = Vector2.new(1, 0)
            Button["21"]["Position"] = UDim2.new(1, 0 - 8, 0.15000000596046448, 0)

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Button.TextButton
            Button["22"] = Instance.new("TextButton", Button["1e"])
            Button["22"]["ZIndex"] = 2
            Button["22"]["BorderSizePixel"] = 0
            Button["22"]["TextXAlignment"] = Enum.TextXAlignment.Left
            Button["22"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
            Button["22"]["TextSize"] = 17
            Button["22"]["FontFace"] =
                Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            Button["22"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
            Button["22"]["Size"] = UDim2.new(1, 0, 1, 0)
            Button["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            Button["22"]["BackgroundTransparency"] = 1
            Button["22"]["Text"] = text

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Button.TextButton.UIPadding
            Button["23"] = Instance.new("UIPadding", Button["22"])
            Button["23"]["PaddingLeft"] = UDim.new(0, 8)
            --#endregion

            Button["22"].MouseButton1Down:Connect(
                function()
                    Ripple(Button["1e"])
                    task.spawn(callback)
                end
            )
            UpdateScrollFrame()
            return Button
        end

        function Tab:Toggle(Text, Default, Callback)
            local istoggled = Default or false
            local text = Text or "Toggle"
            local toggle = {}
            Callback(istoggled)
            --#region ui
            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Toggle
            toggle["39"] = Instance.new("Frame", Tab["1d"])
            toggle["39"]["BorderSizePixel"] = 0
            toggle["39"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36)
            toggle["39"]["Size"] = UDim2.new(0.9300000071525574, 0, 0.10000000149011612, 0)
            toggle["39"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            toggle["39"]["Position"] = UDim2.new(0, 4, 0, 10)
            toggle["39"]["Name"] = [[Toggle]]

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Toggle.UIStroke
            toggle["3a"] = Instance.new("UIStroke", toggle["39"])
            toggle["3a"]["Color"] = Color3.fromRGB(83, 9, 173)
            toggle["3a"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Toggle.UICorner
            toggle["3b"] = Instance.new("UICorner", toggle["39"])

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Toggle.untoggled
            toggle["3c"] = Instance.new("ImageButton", toggle["39"])
            toggle["3c"]["BorderSizePixel"] = 0
            toggle["3c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
            toggle["3c"]["ImageColor3"] = Color3.fromRGB(123, 111, 255)
            toggle["3c"]["Image"] = [[http://www.roblox.com/asset/?id=9155599240]]
            toggle["3c"]["Size"] = UDim2.new(0, 25, 0, 25)
            toggle["3c"]["Name"] = [[untoggled]]
            toggle["3c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            toggle["3c"]["AnchorPoint"] = Vector2.new(1, 0)
            toggle["3c"]["Position"] = UDim2.new(1, 0 - 8, 0.15000000596046448, 0)
            toggle["3c"]["BackgroundTransparency"] = 1

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Toggle.toggled
            toggle["3d"] = Instance.new("ImageButton", toggle["39"])
            toggle["3d"]["BorderSizePixel"] = 0
            toggle["3d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
            toggle["3d"]["ImageColor3"] = Color3.fromRGB(123, 111, 255)
            toggle["3d"]["Image"] = [[http://www.roblox.com/asset/?id=9155626912]]
            toggle["3d"]["Size"] = UDim2.new(0, 25, 0, 25)
            toggle["3d"]["Name"] = [[toggled]]
            toggle["3d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            toggle["3d"]["AnchorPoint"] = Vector2.new(1, 0)
            toggle["3d"]["Position"] = UDim2.new(1, 0 - 8, 0.15000000596046448, 0)
            toggle["3d"]["BackgroundTransparency"] = 1
            toggle["3d"]["ImageTransparency"] = istoggled and 0 or 1

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Toggle.TextButton
            toggle["3e"] = Instance.new("TextButton", toggle["39"])
            toggle["3e"]["ZIndex"] = 3
            toggle["3e"]["BorderSizePixel"] = 0
            toggle["3e"]["TextXAlignment"] = Enum.TextXAlignment.Left
            toggle["3e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
            toggle["3e"]["TextSize"] = 17
            toggle["3e"]["FontFace"] =
                Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            toggle["3e"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
            toggle["3e"]["Size"] = UDim2.new(1, 0, 1, 0)
            toggle["3e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            toggle["3e"]["Text"] = text
            toggle["3e"]["BackgroundTransparency"] = 1

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Toggle.TextButton.UIPadding
            toggle["3f"] = Instance.new("UIPadding", toggle["3e"])
            toggle["3f"]["PaddingLeft"] = UDim.new(0, 8)
            --#endregion

            toggle["3e"].MouseButton1Down:Connect(
                function()
                    istoggled = not istoggled
                    TweenService:Create(
                        toggle["3d"],
                        TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                        {ImageTransparency = istoggled and 0 or 1}
                    ):Play()
                    Callback(istoggled)
                end
            )
            UpdateScrollFrame()
            return toggle
        end

        function Tab:TextBox(text, Callback)
            local text = text or "Textbox"
            local TextBox = {}

            --#region ui
            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Textbox
            TextBox["56"] = Instance.new("Frame", Tab["1d"])
            TextBox["56"]["BorderSizePixel"] = 0
            TextBox["56"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36)
            TextBox["56"]["Size"] = UDim2.new(0.9300000071525574, 0, 0.10000000149011612, 0)
            TextBox["56"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            TextBox["56"]["Name"] = [[Textbox]]

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Textbox.UIStroke
            TextBox["57"] = Instance.new("UIStroke", TextBox["56"])
            TextBox["57"]["Color"] = Color3.fromRGB(83, 9, 173)
            TextBox["57"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Textbox.UICorner
            TextBox["58"] = Instance.new("UICorner", TextBox["56"])

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Textbox.TextLabel
            TextBox["59"] = Instance.new("TextLabel", TextBox["56"])
            TextBox["59"]["BorderSizePixel"] = 0
            TextBox["59"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
            TextBox["59"]["TextXAlignment"] = Enum.TextXAlignment.Left
            TextBox["59"]["FontFace"] =
                Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            TextBox["59"]["TextSize"] = 17
            TextBox["59"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
            TextBox["59"]["Size"] = UDim2.new(1, 0, 1, 0)
            TextBox["59"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            TextBox["59"]["Text"] = text
            TextBox["59"]["BackgroundTransparency"] = 1

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Textbox.TextLabel.UIPadding
            TextBox["5a"] = Instance.new("UIPadding", TextBox["59"])
            TextBox["5a"]["PaddingLeft"] = UDim.new(0, 8)

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Textbox.TextboxHolder
            TextBox["5b"] = Instance.new("Frame", TextBox["56"])
            TextBox["5b"]["AnchorPoint"] = Vector2.new(1, 0)
            TextBox["5b"]["ZIndex"] = 5
            TextBox["5b"]["BorderSizePixel"] = 0
            TextBox["5b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
            TextBox["5b"]["BackgroundTransparency"] = 1
            TextBox["5b"]["Size"] = UDim2.new(0.53, 0, 0.699999988079071, 0) -- 175 offset X without scaling
            TextBox["5b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            TextBox["5b"]["Position"] = UDim2.new(1, -6, 0.15000000596046448, 0)
            TextBox["5b"]["Name"] = [[TextboxHolder]]

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Textbox.TextboxHolder.UIStroke
            TextBox["5c"] = Instance.new("UIStroke", TextBox["5b"])
            TextBox["5c"]["Color"] = Color3.fromRGB(123, 111, 255)

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Textbox.TextboxHolder.UIPadding
            TextBox["5c"] = Instance.new("UIStroke", TextBox["5b"])
            TextBox["5c"]["Color"] = Color3.fromRGB(123, 111, 255)

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Textbox.TextboxHolder.TextBox
            TextBox["5d"] = Instance.new("TextBox", TextBox["5b"])
            TextBox["5d"]["CursorPosition"] = -1
            TextBox["5d"]["ZIndex"] = 2
            TextBox["5d"]["BorderSizePixel"] = 0
            TextBox["5d"]["RichText"] = true
            TextBox["5d"]["TextSize"] = 14
            TextBox["5d"]["TextXAlignment"] = Enum.TextXAlignment.Left
            TextBox["5d"]["TextWrapped"] = false
            TextBox["5d"]["BackgroundColor3"] = Color3.fromRGB(58, 58, 58)
            TextBox["5d"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
            TextBox["5d"]["FontFace"] =
                Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            TextBox["5d"]["BackgroundTransparency"] = 1
            TextBox["5d"]["Size"] = UDim2.new(1, 0, 1, 0)
            TextBox["5d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            TextBox["5d"]["Text"] = "Input.."
            TextBox["5d"]["ClipsDescendants"] = true

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Textbox.TextboxHolder.TextBox.UICorner
            TextBox["5e"] = Instance.new("UICorner", TextBox["5d"])

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Textbox.TextboxHolder.TextBox.UIPadding
            TextBox["5f"] = Instance.new("UIPadding", TextBox["5d"])
            TextBox["5f"]["PaddingLeft"] = UDim.new(0, 8)

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Textbox.TextboxHolder.UICorner
            TextBox["60"] = Instance.new("UICorner", TextBox["5b"])
            --#endregion

            TextBox["5d"].FocusLost:Connect(
                function()
                    Callback(TextBox["5d"].Text)
                end
            )

            TextBox["5d"].Focused:Connect(
                function()
                    TextBox["5d"].Text = ""
                end
            )
            UpdateScrollFrame()
            return TextBox
        end

        function Tab:Line(text)
            text = text or "Line"
            local section = {}
            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Line
            section["73"] = Instance.new("Frame", Tab["1d"])
            section["73"]["BorderSizePixel"] = 0
            section["73"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36)
            section["73"]["BackgroundTransparency"] = 1
            section["73"]["Size"] = UDim2.new(0.93, 0, 0.08, 0)
            section["73"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            section["73"]["Name"] = [[Line]]

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Line.UICorner
            section["74"] = Instance.new("UICorner", section["73"])

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Line.TextLabel
            section["75"] = Instance.new("TextLabel", section["73"])
            section["75"]["TextWrapped"] = true
            section["75"]["BorderSizePixel"] = 0
            section["75"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
            section["75"]["TextXAlignment"] = Enum.TextXAlignment.Left
            section["75"]["FontFace"] =
                Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            section["75"]["TextSize"] = 20
            section["75"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
            section["75"]["Size"] = UDim2.new(1, 0, 0.9, 0)
            section["75"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            section["75"]["Text"] = text
            section["75"]["BackgroundTransparency"] = 1

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Line.Line
            section["76"] = Instance.new("Frame", section["73"])
            section["76"]["BorderSizePixel"] = 0
            section["76"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
            section["76"]["Size"] = UDim2.new(1, 0, 0.05000000074505806, 0)
            section["76"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            section["76"]["Position"] = UDim2.new(0, 0, 0.89, 0)
            section["76"]["Name"] = [[Line]]

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Line.Line.UICorner
            section["77"] = Instance.new("UICorner", section["76"])
            section["77"]["CornerRadius"] = UDim.new(0, 24)
            UpdateScrollFrame()
            return section
        end

        function Tab:Keycode(options, callback)
            local text = options[1] or "Keycode"
            local default = options[2] or nil
            local defaultText = default and tostring(default):gsub("Enum.KeyCode.", "") or ""
            local Keycode = {}
            local isPress = true
            if default then
                callback(default)
            end
            --#region ui
            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Keycode
            Keycode["3f"] = Instance.new("Frame", Tab["1d"])
            Keycode["3f"]["BorderSizePixel"] = 0
            Keycode["3f"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36)
            Keycode["3f"]["Size"] = UDim2.new(0.9300000071525574, 0, 0.10000000149011612, 0)
            Keycode["3f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            Keycode["3f"]["Name"] = [[Keycode]]

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Keycode.UIStroke
            Keycode["40"] = Instance.new("UIStroke", Keycode["3f"])
            Keycode["40"]["Color"] = Color3.fromRGB(83, 9, 173)
            Keycode["40"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Keycode.UICorner
            Keycode["41"] = Instance.new("UICorner", Keycode["3f"])

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Keycode.TextLabel
            Keycode["42"] = Instance.new("TextButton", Keycode["3f"])
            Keycode["42"]["BorderSizePixel"] = 0
            Keycode["42"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
            Keycode["42"]["TextXAlignment"] = Enum.TextXAlignment.Left
            Keycode["42"]["FontFace"] =
                Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            Keycode["42"]["TextSize"] = 17
            Keycode["42"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
            Keycode["42"]["Size"] = UDim2.new(1, 0, 1, 0)
            Keycode["42"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            Keycode["42"]["Text"] = text
            Keycode["42"]["BackgroundTransparency"] = 1

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Keycode.TextLabel.UIPadding
            Keycode["43"] = Instance.new("UIPadding", Keycode["42"])
            Keycode["43"]["PaddingLeft"] = UDim.new(0, 12)

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Keycode.TextLabel2
            Keycode["44"] = Instance.new("TextLabel", Keycode["3f"])
            Keycode["44"]["BorderSizePixel"] = 0
            Keycode["44"]["TextSize"] = 16
            Keycode["44"]["BackgroundColor3"] = Color3.fromRGB(123, 111, 255)
            Keycode["44"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
            Keycode["44"]["FontFace"] =
                Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            Keycode["44"]["AnchorPoint"] = Vector2.new(1, 0.5)
            Keycode["44"]["Size"] = UDim2.new(0, 28, 0, 28)
            Keycode["44"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            Keycode["44"]["Text"] = defaultText
            Keycode["44"]["Position"] = UDim2.new(1, -6, 0.5, 0)

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Keycode.UICorner
            Keycode["44-1"] = Instance.new("UICorner", Keycode["44"])
            --#endregion

            Keycode["42"].MouseButton1Down:Connect(
                function()
                    Keycode["44"]["Text"] = "..."
                    isPress = false
                end
            )

            UserInputService.InputBegan:Connect(
                function(input, chat)
                    if input.UserInputType == Enum.UserInputType.Keyboard and not chat and not isPress then
                        callback(input.KeyCode)
                        Keycode["44"]["Text"] = tostring(input.KeyCode):gsub("Enum.KeyCode.", "")
                        isPress = true
                    end
                end
            )
            UpdateScrollFrame()
            return Keycode
        end

        function Tab:Slider(Text, dict, Callback)
            Text = Text or "Slider"
            local oldTxt
            local Minimum = dict.Minimum or dict.minimum or dict.Min or dict.min
            local Maximum = dict.Maximum or dict.maximum or dict.Max or dict.max
            local Default = dict.Default or dict.default or dict.Def or dict.def
            local oldSliderVal -- prevent useless callbacks if nothing has changed

            Default = math.clamp(Default, Minimum, Maximum)
            SizeDefault = math.clamp(Default / Maximum, 0, 1)

            local slider = {}

            --#region ui

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Slider
            slider["2c"] = Instance.new("Frame", Tab["1d"])
            slider["2c"]["BorderSizePixel"] = 0
            slider["2c"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36)
            slider["2c"]["Size"] = UDim2.new(0.9300000071525574, 0, 0.15000000596046448, 0)
            slider["2c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            slider["2c"]["Name"] = [[Slider]]

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Slider.UIStroke
            slider["2d"] = Instance.new("UIStroke", slider["2c"])
            slider["2d"]["Color"] = Color3.fromRGB(83, 9, 173)
            slider["2d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Slider.UICorner
            slider["2e"] = Instance.new("UICorner", slider["2c"])

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Slider.TextLabel
            slider["2f"] = Instance.new("TextLabel", slider["2c"])
            slider["2f"]["BorderSizePixel"] = 0
            slider["2f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
            slider["2f"]["TextXAlignment"] = Enum.TextXAlignment.Left
            slider["2f"]["FontFace"] =
                Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            slider["2f"]["TextSize"] = 17
            slider["2f"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
            slider["2f"]["Size"] = UDim2.new(0.8500000238418579, 0, 0.5, 0)
            slider["2f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            slider["2f"]["Text"] = Text
            slider["2f"]["BackgroundTransparency"] = 1

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Slider.TextLabel.UIPadding
            slider["30"] = Instance.new("UIPadding", slider["2f"])
            slider["30"]["PaddingTop"] = UDim.new(0, 8)
            slider["30"]["PaddingLeft"] = UDim.new(0, 12)

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Slider.TextBox
            slider["31"] = Instance.new("TextBox", slider["2c"])
            slider["31"]["BorderSizePixel"] = 0
            slider["31"]["TextSize"] = 14
            slider["31"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
            slider["31"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
            slider["31"]["FontFace"] =
                Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            slider["31"]["BackgroundTransparency"] = 1
            slider["31"]["Size"] = UDim2.new(0.10000000149011612, 0, 0.5, 0)
            slider["31"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            slider["31"]["Text"] = [[]]
            slider["31"]["Position"] = UDim2.new(0.8799999952316284, 0, 0, 0)

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Slider.TextBox.UIPadding
            slider["32"] = Instance.new("UIPadding", slider["31"])
            slider["32"]["PaddingTop"] = UDim.new(0, 8)
            slider["32"]["PaddingRight"] = UDim.new(0, 8)
            slider["32"]["PaddingLeft"] = UDim.new(0, 8)

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Slider.Frame
            slider["33"] = Instance.new("Frame", slider["2c"])
            slider["33"]["BorderSizePixel"] = 0
            slider["33"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
            slider["33"]["BackgroundTransparency"] = 1
            slider["33"]["Size"] = UDim2.new(0.8999999761581421, 0, 0.5, 0)
            slider["33"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            slider["33"]["Position"] = UDim2.new(0.05000000074505806, 0, 0.5, 0)

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Slider.Frame.slider1
            slider["34"] = Instance.new("Frame", slider["33"])
            slider["34"]["BorderSizePixel"] = 0
            slider["34"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
            slider["34"]["AnchorPoint"] = Vector2.new(0, 1)
            slider["34"]["Size"] = UDim2.new(1, 0, 0.25, 0)
            slider["34"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            slider["34"]["Position"] = UDim2.new(0, 0, 0.5, 0)
            slider["34"]["Name"] = [[slider1]]
            slider["34"]["ZIndex"] = 1

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Slider.Frame.slider1
            slider["3533"] = Instance.new("ImageButton", slider["33"])
            slider["3533"]["BorderSizePixel"] = 0
            slider["3533"].ImageTransparency = 1
            slider["3533"]["BackgroundTransparency"] = 1
            slider["3533"]["AnchorPoint"] = Vector2.new(0, 1)
            slider["3533"]["Size"] = UDim2.new(1, 0, 0.25, 0)
            slider["3533"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            slider["3533"]["Position"] = UDim2.new(0, 0, 0.5, 0)
            slider["3533"]["Name"] = [[clickable]]
            slider["3533"]["ZIndex"] = 5

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Slider.Frame.slider1.UICorner
            slider["35"] = Instance.new("UICorner", slider["34"])
            slider["35"]["CornerRadius"] = UDim.new(1, 0)

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Slider.Frame.slider2
            slider["36"] = Instance.new("Frame", slider["33"])
            slider["36"]["BorderSizePixel"] = 0
            slider["36"]["BackgroundColor3"] = Color3.fromRGB(83, 9, 173)
            slider["36"]["AnchorPoint"] = Vector2.new(0, 1)
            slider["36"]["Size"] = UDim2.new(0.5, 0, 0.25, 0)
            slider["36"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            slider["36"]["Position"] = UDim2.new(0, 0, 0.5, 0)
            slider["36"]["Name"] = [[slider2]]

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Slider.Frame.slider2.UICorner
            slider["37"] = Instance.new("UICorner", slider["36"])
            slider["37"]["CornerRadius"] = UDim.new(20, 0)

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.Slider.Frame.slider2.ImageButton
            slider["38"] = Instance.new("ImageButton", slider["36"])
            slider["38"]["BorderSizePixel"] = 0
            slider["38"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
            slider["38"]["Image"] = [[http://www.roblox.com/asset/?id=4560909609]]
            slider["38"]["Size"] = UDim2.new(0, 15, 0, 15)
            slider["38"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            slider["38"]["Position"] = UDim2.new(1, -2, 1, -10)
            slider["38"]["BackgroundTransparency"] = 1
            --#endregion

            local SliderBar = slider["3533"]
            local SliderFill = slider["36"]
            local sliderBox = slider["31"]

            function slider:update(textbox)
                local percent
                if textbox then
                    local boxNum = tonumber(sliderBox.Text)
                    local txtClamp = boxNum and math.clamp(boxNum, Minimum, Maximum) or oldTxt or Minimum
                    sliderBox.Text = txtClamp
                    oldTxt = txtClamp
                    percent = 1 - ((Maximum - txtClamp) / (Maximum - Minimum))
                    Callback(txtClamp)
                else
                    percent = (mouse.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X
                    percent = math.clamp(percent, 0, 1)
                    local Value = math.floor(Minimum + ((Maximum - Minimum) * percent))
                    sliderBox.Text = math.ceil(Value)
                    --prevent lag and useless callbacks
                    if oldSliderVal ~= math.ceil(Value) then
                        oldSliderVal = math.ceil(Value)
                        Callback(math.ceil(Value))
                    end
                end
                TweenService:Create(
                    SliderFill,
                    TweenInfo.new(0.05, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                    {Size = UDim2.new(percent, 0, 0.25, 0)}
                ):Play()
            end
            
            sliderBox.Text = Default
            slider:update(true)

            sliderBox.FocusLost:Connect(
                function()
                    slider:update(true)
                end
            )

            SliderBar.MouseButton1Down:Connect(
                function()
                    slider:update(false)
                end
            )

            SliderBar.InputBegan:Connect(
                function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        local SliderMove, SliderKill
                        SliderMove =
                            mouse.Move:Connect(
                            function()
                                slider:update(false)
                            end
                        )
                        SliderKill =
                            UserInputService.InputEnded:Connect(
                            function(UserInput)
                                if UserInput.UserInputType == Enum.UserInputType.MouseButton1 then
                                    SliderMove:Disconnect()
                                    SliderKill:Disconnect()
                                end
                            end
                        )
                    end
                end
            )
            UpdateScrollFrame()
            return slider
        end

        function Tab:Label(Text, Type)
            local Type = Type or "Label"
            local Text = Text or Type
            local col = Type == "Warning" and Color3.fromRGB(255, 208, 33) or Type == "Label" and --[[Color3.fromRGB(125, 125, 125)]] Color3.fromRGB(83, 9, 173) or Type == "Info" and Color3.fromRGB(8, 189, 255)
            local img = Type == "Warning" and [[http://www.roblox.com/asset/?id=11745872910]] or Type == "Info" and [[http://www.roblox.com/asset/?id=7546954294]] or Type == "Label" and [[http://www.roblox.com/asset/?id=9290090585]]
            local Label = {}
            -- StarterGui.OnionLib.Main.Tabholder.TopTab.WarningLabel
            Label["47"] = Instance.new("Frame", Tab["1d"])
            Label["47"]["BorderSizePixel"] = 0
            Label["47"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36)
            Label["47"]["Size"] = UDim2.new(0.9300000071525574, 0, 0.07999999821186066, 0)
            Label["47"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            Label["47"]["Name"] = Type..[[Label]]
            Label["47"]["ClipsDescendants"] = true

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.WarningLabel.UIStroke
            Label["48"] = Instance.new("UIStroke", Label["47"])
            Label["48"]["Color"] = col
            Label["48"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.WarningLabel.UICorner
            Label["49"] = Instance.new("UICorner", Label["47"])

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.WarningLabel.TextLabel
            Label["4a"] = Instance.new("TextLabel", Label["47"])
            Label["4a"]["BorderSizePixel"] = 0
            Label["4a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
            Label["4a"]["TextXAlignment"] = Enum.TextXAlignment.Left
            Label["4a"]["TextYAlignment"] = Enum.TextYAlignment.Top
            Label["4a"]["FontFace"] =Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            Label["4a"]["TextSize"] = 17
            Label["4a"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
            Label["4a"]["Size"] = UDim2.new(0.935, 0, 1, 0)
            Label["4a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            Label["4a"]["BackgroundTransparency"] = 1
            Label["4a"]["Position"] = UDim2.new(0, 30, 0, 0)
            Label["4a"]["Text"] = Text

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.WarningLabel.TextLabel.UIPadding
            Label["4b"] = Instance.new("UIPadding", Label["4a"])
            Label["4b"]["PaddingLeft"] = UDim.new(0, 4)
            Label["4b"]["PaddingTop"] = UDim.new(0, 8)

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.WarningLabel.ImageLabel
            Label["4c"] = Instance.new("ImageLabel", Label["47"])
            Label["4c"]["BorderSizePixel"] = 0
            Label["4c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
            Label["4c"]["ImageColor3"] = col
            Label["4c"]["AnchorPoint"] = Vector2.new(0, 0.5)
            Label["4c"]["Image"] = img
            Label["4c"]["Size"] = UDim2.new(0, 25, 0, 25)
            Label["4c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
            Label["4c"]["BackgroundTransparency"] = 1
            Label["4c"]["Position"] = UDim2.new(0, 7, 0, 16)

            -- StarterGui.OnionLib.Main.Tabholder.TopTab.WarningLabel.ImageLabel.UIAspectRatioConstraint
            Label["4d"] = Instance.new("UIAspectRatioConstraint", Label["4c"])
            UpdateScrollFrame()
            return Label
        end

        return Tab
    end

    return GUI
end
--#endregion
return Library
