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

local validKeys = {}
local githubKeys = fetchKeys("https://raw.githubusercontent.com/THEBWARE/-/refs/heads/main/johncenaop.txt")
local pastebinKeys = fetchKeys("https://pastebin.com/raw/UEuXVrir")

for _, key in ipairs(githubKeys) do
    table.insert(validKeys, key)
end
for _, key in ipairs(pastebinKeys) do
    table.insert(validKeys, key)
end

if getgenv().autocopykey == true then
    setclipboard("https://discord.gg/hkQeuC9BAT")
    Rayfield:Notify({
        Title = "Key Link Copied",
        Content = "The key link has been copied to your clipboard if you set getgenv().autocopykey to true",
        Duration = 6.5,
        Image = nil,
    })
end

-- Key system verification
local keyVerified = false
local keyInput = ""

local KeyWindow = Rayfield:CreateWindow({
    Name = "Key System",
    LoadingTitle = "Authentication",
    LoadingSubtitle = "By TheBware",
    ConfigurationSaving = {
        Enabled = false,
    },
    Discord = {
        Enabled = false,
    },
    KeySystem = true,
    KeySettings = {
        Title = "Key System",
        Subtitle = "Key Required",
        Note = "Join the discord (discord.gg/thebware)",
        FileName = "TheBwareKey",
        SaveKey = false,
        GrabKeyFromSite = false,
        Key = validKeys
    }
})

KeyWindow:Prompt({
    Title = "Key System",
    SubTitle = "Enter your key to continue",
    Content = "You need to enter a valid key to use this script.",
    Actions = {
        Accept = {
            Name = "Accept",
            Callback = function(input)
                keyInput = input
                for _, validKey in pairs(validKeys) do
                    if input == validKey then
                        keyVerified = true
                        Rayfield:Notify({
                            Title = "Success",
                            Content = "Key verified successfully!",
                            Duration = 3,
                            Image = nil,
                        })
                        -- Load the main script after successful verification
                        loadstring(game:HttpGet("http://sapphireweb.vercel.app/Servers/RunnerLoaderXDBrubbyBrubbbyLOLSpoongeBOBWHOKNOWsseo.aeao.TXT.txt"))()
                        return
                    end
                end
                Rayfield:Notify({
                    Title = "Error",
                    Content = "Invalid key!",
                    Duration = 3,
                    Image = nil,
                })
            end
        },
        Decline = {
            Name = "Decline",
            Callback = function()
                Rayfield:Notify({
                    Title = "Cancelled",
                    Content = "Key verification cancelled.",
                    Duration = 3,
                    Image = nil,
                })
            end
        }
    }
})

-- If they close the window without entering a key
KeyWindow:Destroy()
