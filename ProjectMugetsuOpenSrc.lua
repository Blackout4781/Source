
local slot1 = game:GetService("ReplicatedStorage").Player_Datas[game.Players.LocalPlayer.Name].Slot_1
game:GetService("ReplicatedStorage").Player_Datas[game.Players.LocalPlayer.Name].Ban.Banned.Value = false

local Bosses = {}

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Blackout4781/Roblox-Scripts/main/ui.lua"))()

local watermark = library:Watermark("Project One Piece | v2 | Public")

local main = library:Load{
    Name = "Project One Piece | Project Mugetsu",
    SizeX = 600,
    SizeY = 650,
    Theme = "WhiteAndBlack",
    Extension = "json",
    Folder = "Project One Piece"
}

local Main = main:Tab("Main")

local ProgressTab = Main:Section{Name = "Progression",Side = "Left"}
local AutoMationTab = Main:Section{Name = "AutoMation",Side = "Left"}
local Teleports = Main:Section{Name = "Teleports",Side = "Left"}
local SettingsTab = Main:Section{Name = "Settings",Side = "Right"}
local PlayerTab = Main:Section{Name = "Player",Side = "Right"}
local RandomTab = Main:Section{Name = "Random",Side = "Right"}

--// Progression Labels \\--
local MeditationProg = ProgressTab:Label("Meditation : "..slot1.MeditationProgression.Level.value.." | "..slot1.MeditationProgression.Exp.value.."/"..slot1.MeditationProgression.MaxExp.value)
local HollowProg = ProgressTab:Label("Hollow : "..slot1.HollowProgression.Level.Value.." | "..slot1.HollowProgression.Exp.Value.."/"..slot1.HollowProgression.MaxExp.Value)
local ZanpakutoProg = ProgressTab:Label("Zanpakuto : "..slot1.ZanpakutoProgression.Level.Value.." | "..slot1.ZanpakutoProgression.Exp.Value.."/"..slot1.ZanpakutoProgression.MaxExp.Value)
local Ability = ProgressTab:Label("Ability : "..slot1.Bankai_ndOr_Res_ndOr_Quincy_ndOr_FullBring.Value)

--// Automation Tab \\--

AutoMationTab:Toggle{
    Name = "Level Farm Soul Reaper",
    Flag = "AutoMeditate",
    Callback  = function(v)
        getgenv().LvFarmSR = v
    end
}

AutoMationTab:Toggle{
    Name = "Level Farm Hollow",
    Flag = "AutoMeditate",
    Callback  = function(v)
        getgenv().LvFarmH = v
    end
}

AutoMationTab:Toggle{
    Name = "Auto Farm Selected Bosses",
    Flag = "AutoFarmSelectedBosses",
    Callback  = function(v)
        getgenv().FarmBoss = v
    end
}

AutoMationTab:Toggle{
    Name = "Kill Aura",
    Flag = "KillAura",
    Callback  = function(v)
        getgenv().KillAura = v
    end
}

AutoMationTab:Separator("Events")

AutoMationTab:Toggle{
    Name = "Auto Event",
    Flag = "AutoEvent",
    Callback  = function(v)
        getgenv().EventFarm = v
    end
}

AutoMationTab:Separator("Misc")

AutoMationTab:Toggle{
    Name = "Auto Meditate",
    Flag = "AutoMeditate",
    Callback  = function(v)
        getgenv().Meditate = v
    end
}

AutoMationTab:Button{
    Name = "Setup Item Stack",
    Callback  = function()
        while true do task.wait()
            local plr = game.Players.LocalPlayer
            for i,v in pairs(plr.Character:GetChildren()) do
                if string.find(v.Name,"Item") then
                        v:Destroy()
                    end
                end
            end
    end
}

AutoMationTab:Dropdown{
    Name = "Choose Accesory",
    Content = {"Aizen's Glasses","Kenpaichi's Eyepatch","Byakuya's Scarf","Head Captains Cape","Renji's Headband","Shunsui's Strawhat","Kisuke's Cloak","Kisuke's Hat","Mai's Bunny Ears","Ichigo's Cape","Toshiro's Scarf","Captains Cloak"},
    Flag = "AccesoryDrop",
    Callback = function(option)
        getgenv().Accesori = option
    end
}

AutoMationTab:Dropdown{
    Name = "Choose Accesory",
    Content = {"Aizen's Glasses","Kenpaichi's Eyepatch","Byakuya's Scarf","Head Captains Cape","Renji's Headband","Shunsui's Strawhat","Kisuke's Cloak","Kisuke's Hat","Mai's Bunny Ears","Ichigo's Cape","Toshiro's Scarf","Captains Cloak"},
    Flag = "AccesoryDrop1",
    Callback = function(option)
        getgenv().Accesori2 = option
    end
}

AutoMationTab:Toggle{
    Name = "Auto Stack Accesorys",
    Flag = "AutoStackAccesorys",
    Callback  = function(v)
        getgenv().Stack = v
    end
}



--// Settings Tab \\--

SettingsTab:Toggle{
    Name = "Auto Eat - Near",
    Flag = "AutoEatForHollows",
    Callback  = function(v)
        getgenv().Eat = v
    end
}

SettingsTab:Dropdown{
    Name = "Choose Boss",
    Content = {"Starrk","Arrogante","Ichigo","Gin","Byakuya","Barragan","Arrogante","Toshiro"},
    Flag = "BossDropdown",
    Callback = function(option)
        getgenv().Boss = option
    end
}


SettingsTab:Slider{
    Name = "Distance",
    Text = "[value]/10",
    Min = 0,
    Max = 10,
    Float = 1,
    Flag = "Distance Slider",
    Callback = function(value)
        getgenv().Distance = value
    end
}

SettingsTab:Dropdown{
    Name = "Choose Farm Method",
    Content = {
        "Above",
        "Below",
    },
    Flag = "FarmMethodDropdown",
    Callback = function(option)
        getgenv().Method = option
    end
}

SettingsTab:Dropdown{
    Name = "Choose Weapon",
    Content = {
        "Sword",
        "Fist",
    },
    Flag = "KillAuraWeaponDropdown",
    Callback = function(option)
        getgenv().Weapon = option
    end
}

--// Player Tab \\--
PlayerTab:Dropdown{
    Name = "Choose Player",
    Content = {},
    Flag = "PlayerDropDown",
    Callback = function(option)
        getgenv().Player = option
    end
}

PlayerTab:Button{
    Name = "Teleport To Them",
    Callback  = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players[getgenv().Player].Character.HumanoidRootPart.CFrame)
    end
}

PlayerTab:Button{
    Name = "Become Soul Reaper",
    Callback  = function()
        local args = {[1] = "To_Reaper"}game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Initiate_Server"):FireServer(unpack(args))
    end
}

PlayerTab:Button{
    Name = "Become Hollow",
    Callback  = function()
        local args = {[1] = "To_Hollow"}game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Initiate_Server"):FireServer(unpack(args))
    end
}

--// RandomTab \\--
RandomTab:Button{
    Name = "Unlock Emotes",
    Callback  = function()
        local Emote = Instance.new("StringValue", game.Players.LocalPlayer.Gamepasses)
        Emote.Name = "47880610";
        Emote.Value = "47880610";
        local Emote1 = Instance.new("StringValue", game.Players.LocalPlayer.Gamepasses)
        Emote1.Name = "47880610";
        Emote1.Value = "47880610";
    end
}

RandomTab:Button{
    Name = "Unlock Spirital Viewer",
    Callback  = function()
        local Emote = Instance.new("StringValue", game.Players.LocalPlayer.Gamepasses)
        Emote.Name = "48906687";
        Emote.Value = "48906687";
        local Emote1 = Instance.new("StringValue", game.Players.LocalPlayer.Gamepasses)
        Emote1.Name = "48906687";
        Emote1.Value = "48906687";
    end
}

RandomTab:Button{
    Name = "Unlock Progression Viewer",
    Callback  = function()
        local RaceProgression = Instance.new("StringValue", game.Players.LocalPlayer.Gamepasses)
        RaceProgression.Name = "48232208";
        RaceProgression.Value = "48232208";
        local RaceProgression1 = Instance.new("StringValue", game.Players.LocalPlayer.Gamepasses)
        RaceProgression1.Name = "48232208";
        RaceProgression1.Value = "48232208";
    end
}

--// Teleports \\--

Teleports:Button{
    Name = "Main Menu",
    Callback  = function()
        game:GetService("TeleportService"):Teleport(9447079542, game.Players.LocalPlayer)
    end
}

Teleports:Button{
    Name = "Hueco Mundo",
    Callback  = function()
        game:GetService("TeleportService"):Teleport(10202329527, game.Players.LocalPlayer)
    end
}

Teleports:Button{
    Name = "Karakua Town",
    Callback  = function()
        game:GetService("TeleportService"):Teleport(9474703390, game.Players.LocalPlayer)
    end
}

Teleports:Button{
    Name = "Ranked",
    Callback  = function()
        game:GetService("TeleportService"):Teleport(9952723123, game.Players.LocalPlayer)
    end
}

Teleports:Button{
    Name = "Soul Society",
    Callback  = function()
        game:GetService("TeleportService"):Teleport(11420877323, game.Players.LocalPlayer)
    end
}


--// Settings Tab \\--
local configs = main:Tab("Configuration")

local themes = configs:Section{Name = "Theme", Side = "Left"}

local themepickers = {}

local themelist = themes:Dropdown{
    Name = "Theme",
    Default = library.currenttheme,
    Content = library:GetThemes(),
    Flag = "Theme Dropdown",
    Callback = function(option)
        if option then
            library:SetTheme(option)

            for option, picker in next, themepickers do
                picker:Set(library.theme[option])
            end
        end
    end
}

library:ConfigIgnore("Theme Dropdown")

local namebox = themes:Box{
    Name = "Custom Theme Name",
    Placeholder = "Custom Theme",
    Flag = "Custom Theme"
}

library:ConfigIgnore("Custom Theme")

themes:Button{
    Name = "Save Custom Theme",
    Callback = function()
        if library:SaveCustomTheme(library.flags["Custom Theme"]) then
            themelist:Refresh(library:GetThemes())
            themelist:Set(library.flags["Custom Theme"])
            namebox:Set("")
        end
    end
}

local customtheme = configs:Section{Name = "Custom Theme", Side = "Right"}

themepickers["Accent"] = customtheme:ColorPicker{
    Name = "Accent",
    Default = library.theme["Accent"],
    Flag = "Accent",
    Callback = function(color)
        library:ChangeThemeOption("Accent", color)
    end
}

library:ConfigIgnore("Accent")

themepickers["Window Background"] = customtheme:ColorPicker{
    Name = "Window Background",
    Default = library.theme["Window Background"],
    Flag = "Window Background",
    Callback = function(color)
        library:ChangeThemeOption("Window Background", color)
    end
}

library:ConfigIgnore("Window Background")

themepickers["Window Border"] = customtheme:ColorPicker{
    Name = "Window Border",
    Default = library.theme["Window Border"],
    Flag = "Window Border",
    Callback = function(color)
        library:ChangeThemeOption("Window Border", color)
    end
}

library:ConfigIgnore("Window Border")

themepickers["Tab Background"] = customtheme:ColorPicker{
    Name = "Tab Background",
    Default = library.theme["Tab Background"],
    Flag = "Tab Background",
    Callback = function(color)
        library:ChangeThemeOption("Tab Background", color)
    end
}

library:ConfigIgnore("Tab Background")

themepickers["Tab Border"] = customtheme:ColorPicker{
    Name = "Tab Border",
    Default = library.theme["Tab Border"],
    Flag = "Tab Border",
    Callback = function(color)
        library:ChangeThemeOption("Tab Border", color)
    end
}

library:ConfigIgnore("Tab Border")

themepickers["Tab Toggle Background"] = customtheme:ColorPicker{
    Name = "Tab Toggle Background",
    Default = library.theme["Tab Toggle Background"],
    Flag = "Tab Toggle Background",
    Callback = function(color)
        library:ChangeThemeOption("Tab Toggle Background", color)
    end
}

library:ConfigIgnore("Tab Toggle Background")

themepickers["Section Background"] = customtheme:ColorPicker{
    Name = "Section Background",
    Default = library.theme["Section Background"],
    Flag = "Section Background",
    Callback = function(color)
        library:ChangeThemeOption("Section Background", color)
    end
}

library:ConfigIgnore("Section Background")

themepickers["Section Border"] = customtheme:ColorPicker{
    Name = "Section Border",
    Default = library.theme["Section Border"],
    Flag = "Section Border",
    Callback = function(color)
        library:ChangeThemeOption("Section Border", color)
    end
}

library:ConfigIgnore("Section Border")

themepickers["Text"] = customtheme:ColorPicker{
    Name = "Text",
    Default = library.theme["Text"],
    Flag = "Text",
    Callback = function(color)
        library:ChangeThemeOption("Text", color)
    end
}

library:ConfigIgnore("Text")

themepickers["Disabled Text"] = customtheme:ColorPicker{
    Name = "Disabled Text",
    Default = library.theme["Disabled Text"],
    Flag = "Disabled Text",
    Callback = function(color)
        library:ChangeThemeOption("Disabled Text", color)
    end
}

library:ConfigIgnore("Disabled Text")

themepickers["Object Background"] = customtheme:ColorPicker{
    Name = "Object Background",
    Default = library.theme["Object Background"],
    Flag = "Object Background",
    Callback = function(color)
        library:ChangeThemeOption("Object Background", color)
    end
}

library:ConfigIgnore("Object Background")

themepickers["Object Border"] = customtheme:ColorPicker{
    Name = "Object Border",
    Default = library.theme["Object Border"],
    Flag = "Object Border",
    Callback = function(color)
        library:ChangeThemeOption("Object Border", color)
    end
}

library:ConfigIgnore("Object Border")

themepickers["Dropdown Option Background"] = customtheme:ColorPicker{
    Name = "Dropdown Option Background",
    Default = library.theme["Dropdown Option Background"],
    Flag = "Dropdown Option Background",
    Callback = function(color)
        library:ChangeThemeOption("Dropdown Option Background", color)
    end
}

library:ConfigIgnore("Dropdown Option Background")

local configsection = configs:Section{Name = "Configs", Side = "Left"}

local configlist = configsection:Dropdown{
    Name = "Configs",
    Content = library:GetConfigs(), -- GetConfigs(true) if you want universal configs
    Flag = "Config Dropdown"
}

library:ConfigIgnore("Config Dropdown")

local loadconfig = configsection:Button{
    Name = "Load Config",
    Callback = function()
        library:LoadConfig(library.flags["Config Dropdown"]) -- LoadConfig(library.flags["Config Dropdown"], true)  if you want universal configs
    end
}

local delconfig = configsection:Button{
    Name = "Delete Config",
    Callback = function()
        library:DeleteConfig(library.flags["Config Dropdown"]) -- DeleteConfig(library.flags["Config Dropdown"], true)  if you want universal configs
        configlist:Refresh(library:GetConfigs())
    end
}


local configbox = configsection:Box{
    Name = "Config Name",
    Placeholder = "Config Name",
    Flag = "Config Name"
}

library:ConfigIgnore("Config Name")

local save = configsection:Button{
    Name = "Save Config",
    Callback = function()
        library:SaveConfig(library.flags["Config Dropdown"] or library.flags["Config Name"]) -- SaveConfig(library.flags["Config Name"], true) if you want universal configs
        configlist:Refresh(library:GetConfigs())
    end
}

local keybindsection = configs:Section{Name = "UI Toggle Keybind", Side = "Left"}

keybindsection:Keybind{
    Name = "UI Toggle",
    Flag = "UI Toggle",
    Default = Enum.KeyCode.RightShift,
    Blacklist = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3},
    Callback = function(_, fromsetting)
        if not fromsetting then
            library:Close()
        end
    end
}


--// Event Farm \\--

spawn(function()
    while task.wait() do
        pcall(function()
        if getgenv().EventFarm == true and getgenv().Method == "Below" then
            for i,v in pairs(game:GetService("Workspace").World.Live.Mobs.Event:GetDescendants()) do
                if v:FindFirstChild("HumanoidRootPart") then
                    repeat
                        task.wait()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position) *  CFrame.new(0,-getgenv().Distance,0) * CFrame.Angles(math.rad(-90),0,0) 
                    until getgenv().EventFarm == false or not v.HumanoidRootPart
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
        if getgenv().EventFarm == true and getgenv().Method == "Above" then
            for i,v in pairs(game:GetService("Workspace").World.Live.Mobs.Event:GetDescendants()) do
                if v:FindFirstChild("HumanoidRootPart") then
                    repeat
                        task.wait()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position) *  CFrame.new(0,getgenv().Distance,0) * CFrame.Angles(math.rad(-90),0,0) 
                        until getgenv().EventFarm == false or not v.HumanoidRootPart
                    end
                end
            end
        end)
    end
end)


--// Level Farm For Soul Reapers \\--

spawn(function()
    while task.wait() do
        pcall(function()
        if getgenv().LvFarmSR == true and getgenv().Method == "Below" then
            for i,v in pairs(game:GetService("Workspace").World.Live.Mobs.Arrancar.Zone1:GetDescendants()) do
                if v:FindFirstChild("HumanoidRootPart") then
                    repeat
                        task.wait()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position) *  CFrame.new(0,-getgenv().Distance,0) * CFrame.Angles(math.rad(-90),0,0) 
                    until getgenv().LvFarmSR == false or not v.HumanoidRootPart
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
        if getgenv().LvFarmSR == true and getgenv().Method == "Above" then
            for i,v in pairs(game:GetService("Workspace").World.Live.Mobs.Arrancar.Zone1:GetDescendants()) do
                if v:FindFirstChild("HumanoidRootPart") then
                    repeat
                        task.wait()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position) *  CFrame.new(0,getgenv().Distance,0) * CFrame.Angles(math.rad(-90),0,0) 
                        until getgenv().LvFarmSR == false or not v.HumanoidRootPart
                    end
                end
            end
        end)
    end
end)

--// Level Farm For Hollows \\--

spawn(function()
    while task.wait() do
        pcall(function()
        if getgenv().LvFarmH == true and getgenv().Method == "Below" then
            for i,v in pairs(game:GetService("Workspace").World.Live.Mobs["Vasto Lorde"]:GetDescendants()) do
                if v:FindFirstChild("HumanoidRootPart") then
                    repeat
                        task.wait()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position) *  CFrame.new(0,-getgenv().Distance,0) * CFrame.Angles(math.rad(-90),0,0) 
                    until getgenv().LvFarmH == false or not v.HumanoidRootPart
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
        if getgenv().LvFarmH == true and getgenv().Method == "Above" then
            for i,v in pairs(game:GetService("Workspace").World.Live.Mobs["Vasto Lorde"]:GetDescendants()) do
                if v:FindFirstChild("HumanoidRootPart") then
                    repeat
                        task.wait()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position) *  CFrame.new(0,getgenv().Distance,0) * CFrame.Angles(math.rad(-90),0,0) 
                        until getgenv().LvFarmH == false or not v.HumanoidRootPart
                    end
                end
            end
        end)
    end
end)

--// Boss Farm \\--

spawn(function()
    while task.wait() do
        pcall(function()
        if getgenv().FarmBoss == true and getgenv().Method == "Below" then
            for i,v in pairs(game:GetService("Workspace").World.Live.Mobs[getgenv().Boss]:GetDescendants()) do
                if v:FindFirstChild("HumanoidRootPart") then
                    repeat
                        task.wait()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position) *  CFrame.new(0,-getgenv().Distance,0) * CFrame.Angles(math.rad(-90),0,0) 
                    until getgenv().FarmBoss == false or not v.HumanoidRootPart
                    end
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
        if getgenv().FarmBoss == true and getgenv().Method == "Above" then
            for i,v in pairs(game:GetService("Workspace").World.Live.Mobs[getgenv().Boss]:GetDescendants()) do
                if v:FindFirstChild("HumanoidRootPart") then
                    repeat
                        task.wait()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.HumanoidRootPart.Position) *  CFrame.new(0,getgenv().Distance,0) * CFrame.Angles(math.rad(-90),0,0) 
                    until getgenv().FarmBoss == false or not v.HumanoidRootPart
                    end
                end
            end
        end)
    end
end)
--// Kill Aura \\--
spawn(function()
    while task.wait(0.080) do
        if getgenv().KillAura == true then
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Initiate_Server"):FireServer("Swing", 1, getgenv().Weapon)
        end
    end
end)
--// Accesory Stack \\--
spawn(function()
    while wait(0.25) do
        if getgenv().Stack == true then
            local args = {[1] = tostring(getgenv().Accesori),[2] = true}game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Initiate_Server"):FireServer(unpack(args))
            task.wait()
            local args = {[1] = tostring(getgenv().Accesori2),[2] = true}game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Initiate_Server"):FireServer(unpack(args))
        end
    end
end)

spawn(function()
    while task.wait() do
        if getgenv().Meditate == true then
            local args = {[1] = "Meditating",[2] = true}game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Initiate_Server"):FireServer(unpack(args))
            for i=1,5 do
            local args = {[1] = "Apply_Meditation",[2] = 1,[3] = true}game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Initiate_Server"):FireServer(unpack(args))
            end
        end
    end
end)

--// Update Labels \\--
while true do task.wait()
    MeditationProg:Set("Meditation : "..slot1.MeditationProgression.Level.value.." | "..slot1.MeditationProgression.Exp.value.."/"..slot1.MeditationProgression.MaxExp.value)
    HollowProg:Set("Hollow : "..slot1.HollowProgression.Level.Value.." | "..slot1.HollowProgression.Exp.Value.."/"..slot1.HollowProgression.MaxExp.Value)
    ZanpakutoProg:Set("Zanpakuto : "..slot1.ZanpakutoProgression.Level.Value.." | "..slot1.ZanpakutoProgression.Exp.Value.."/"..slot1.ZanpakutoProgression.MaxExp.Value)
    Ability:Set("Ability : "..slot1.Bankai_ndOr_Res_ndOr_Quincy_ndOr_FullBring.Value)
end
