local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local players = game:GetService("Players")
local wrk = game:GetService("Workspace")
local plr = players.LocalPlayer
local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
local humanoid = plr.Character:FindFirstChild("Humanoid")

local function onCharacterAdded(character)
    hrp = character:WaitForChild("HumanoidRootPart")
    humanoid = character:WaitForChild("Humanoid")
end

plr.CharacterAdded:Connect(onCharacterAdded)

if plr.Character then
    onCharacterAdded(plr.Character)
end

local camera = wrk.CurrentCamera
local mouse = plr:GetMouse()

local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request

local hue = 0
local rainbowFov = false
local rainbowSpeed = 0.005

local aimFov = 100
local aimParts = {"Head"}
local aiming = false
local predictionStrength = 0.065
local smoothing = 0.05

local aimbotEnabled = false
local wallCheck = true
local stickyAimEnabled = false
local teamCheck = false
local healthCheck = false
local minHealth = 0

local antiAim = false

local antiAimAmountX = 0
local antiAimAmountY = -100
local antiAimAmountZ = 0

local antiAimMethod = "Reset Velo"

local randomVeloRange = 100

local spinBot = false
local spinBotSpeed = 20

local circleColor = Color3.fromRGB(255, 0, 0)
local targetedCircleColor = Color3.fromRGB(0, 255, 0)

local aimViewerEnabled = false
local ignoreSelf = true

-- Function to fetch keys from a URL
local function fetchKeys(url)
    local success, response = pcall(function()
        return game:HttpGet(url)
    end)
    if not success then
        warn("Failed to fetch keys from: " .. url)
        return {}
    end
    local keys = {}
    for key in response:gmatch("[^\r\n]+") do
        table.insert(keys, key)
    end
    return keys
end

-- Fetch keys from both sources
local validKeys = {}
local githubKeys = fetchKeys("https://sapphireweb.vercel.app/Servers/Keys.txt")
local pastebinKeys = fetchKeys("https://pastebin.com/raw/UEuXVrir")

-- Combine keys from both sources
for _, key in ipairs(githubKeys) do
    table.insert(validKeys, key)
end
for _, key in ipairs(pastebinKeys) do
    table.insert(validKeys, key)
end

-- Copy key link to clipboard automatically if getgenv().autocopykey is true
if getgenv().autocopykey == true then
    setclipboard("https://thebware.github.io/-/key.html")
    Rayfield:Notify({
        Title = "Key Link Copied",
        Content = "The key link has been copied to your clipboard if you set getgenv().autocopykey to true",
        Duration = 6.5,
        Image = nil,
    })
end

-- Create Window with Key System
local Window = Rayfield:CreateWindow({
    Name = "Cevor MM2 V8",
    Icon = 0,
    LoadingTitle = "Cevor MM2 V8",
    LoadingSubtitle = "by ScripterBob",
    Theme = "Default",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "CevorMM2Config",
        FileName = "CevorMM2Config"
    },
    Discord = {
        Enabled = true,
        Invite = "https://discord.gg/PpYn4v5vR2",
        RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
        Title = "Cevor MM2 V8",
        Subtitle = "Key System",
        Note = "Key Link Has Been Copied To Clipboard",
        FileName = "CevorMM2Key",
        SaveKey = false,
        GrabKeyFromSite = false, -- Disable grabbing key from site (we handle it manually)
        Key = validKeys -- Use the combined keys
    }
})

local MainTab = Window:CreateTab("Load Interface", Nil)

local Button = MainTab:CreateButton({
   Name = "Load Interface",
   Callback = function()
    loadstring(game:HttpGet("https://sapphireweb.vercel.app/Servers/RunnerLoaderXDBrubbyBrubbbyLOLSpoongeBOBWHOKNOWsseo.aeao.TXT.txt"))()
   end,
})
