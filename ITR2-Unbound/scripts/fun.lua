local fun = {}

function fun:ToggleDebugMode()
    debugmode = not debugmode
    if debugmode then
        print("Debug mode enabled")
    else
        print("Debug mode disabled")
    end
end

---@param hunger number
function fun:SetHunger(hunger)
    local PlayerStatsComponent = FindFirstOf("PlayerStatsComponent")
    if (PlayerStatsComponent) then
        local oldHunger = PlayerStatsComponent:GetHunger()
        if debugmode then print("Current Hunger: " .. tostring(oldHunger)) end
        PlayerStatsComponent.ChangeHungerAndNotifyAll(hunger)
        local newHunger = PlayerStatsComponent:GetHunger()
        if debugmode then print("New Hunger: " .. tostring(PlayerStatsComponent:GetHunger())) end
    else
        if debugmode then print("Waiting for PlayerStatsComponent to be available.") end
    end
end

---@param stamina number
function fun:SetStamina(stamina)
    local PlayerStatsComponent = FindFirstOf("PlayerStatsComponent")
    if (PlayerStatsComponent) then
        local oldStamina = PlayerStatsComponent:GetStamina()
        if debugmode then print("Current Stamina: " .. tostring(oldStamina)) end
        PlayerStatsComponent.ChangeStaminaAndNotifyAll(stamina)
        local newStamina = PlayerStatsComponent:GetStamina()
        if debugmode then print("New Stamina: " .. tostring(newStamina)) end
    else
        if debugmode then print("Waiting for PlayerStatsComponent to be available.") end
    end
end

---@param health number
function fun:SetHealth(health)
    local PlayerStatsComponent = FindFirstOf("PlayerStatsComponent")
    if (PlayerStatsComponent) then
        local oldHealth = PlayerStatsComponent:GetHealth()
        if debugmode then print("Current Health: " .. tostring(oldHealth)) end
        PlayerStatsComponent.CurrentHealth = health
        local newHealth = PlayerStatsComponent:GetHealth()
        if debugmode then print("New Health: " .. tostring(newHealth)) end
    else
        if debugmode then print("Waiting for PlayerStatsComponent to be available.") end
    end
end

---@param amount number
function fun:AddMoney(amount)
    --- Option 1
    -- local RadiusGameDataSubsystem = FindFirstOf("RadiusGameDataSubsystem")
    -- RadiusGameDataSubsystem:AddMoney(amount, "", 0)
    --- Option 2
    local RadiusGameDataReplicator = FindFirstOf("RadiusGameDataReplicator")
    if (RadiusGameDataReplicator) then
        local oldMoney = RadiusGameDataReplicator.Money
        if debugmode then print("Current Money: " .. tostring(oldMoney)) end
        RadiusGameDataReplicator.money = (oldMoney + amount) 
        local newMoney = RadiusGameDataReplicator.Money
        if debugmode then print("New Money: " .. tostring(newMoney)) end
    else 
        if debugmode then print("Waiting for RadiusGameDataReplicator to be available.") end
    end
end

---@param accessLevel integer
function fun:SetAccessLevel(accessLevel)
    local RadiusGameDataReplicator = FindFirstOf("RadiusGameDataReplicator")
    if (RadiusGameDataReplicator) then 
        local oldAccessLevel = RadiusGameDataReplicator:GetAccessLevel()
        if debugmode then print("Current Access Level: " .. tostring(oldAccessLevel)) end
        RadiusGameDataReplicator:SetAccessLevel(accessLevel)
        local newAccessLevel = RadiusGameDataReplicator:GetAccessLevel()
        if debugmode then print("New Access Level: " .. tostring(newAccessLevel)) end
    else 
        if debugmode then print("Waiting for RadiusGameDataReplicator to be available.") end
    end
end

function fun:ToggleNoClip()
    local RadiusCheatSubsystem = FindFirstOf("RadiusCheatSubsystem")
    if (RadiusCheatSubsystem) then
        local oldNoClip = RadiusCheatSubsystem:GetNoClip()
        RadiusCheatSubsystem:SetNoClip(not oldNoClip)
        local newNoClip = RadiusCheatSubsystem:GetNoClip()
        print("NoClip: " .. tostring(newNoClip))
    else
        if debugmode then print("Waiting for RadiusCheatSubsystem to be available.") end
    end
end

--- TO BE TESTED ---

--[[
Levels:
Level.Radius.Forest.Gate2
Level.Radius.Peninsula.Gate2
Level.Radius.Town
Level.Radius.Town.Gate
Level.Test.QA.Gate
Level.Test.TownBAC
Level.Test.WaterTest
Level.Test.WaterTest2
]] 

--[[

function testMethod()
    local UFLGeneral = FindFirstOf("UFLGeneral")
    local map = UFLGeneral:RequestGameplayTag("Level.Radius.Peninsula.Gate2")
    print(map:ToString())
end
function fun:testMethod()
    local Object = "UFLGeneral"
    local Instance = FindFirstOf(Object)
    if not Instance:IsValid() then
        print("No Instance of class: " .. Object .. " found.")
    else 
        print("Instance of class: " .. Object .. " found.")
        print(toString(Instance))
        local map = UFLGeneral:RequestGameplayTag("Level.Radius.Peninsula.Gate2")
        print(map:ToString())
    end
end
function fun:testMethod()
    local Object = "CheatPanel"
    local Instance = FindFirstOf(Object)
    if not Instance:IsValid() then
        print("No Instance of class: " .. Object .. " found.")
    else 
        print("Instance of class: " .. Object .. " found.")
        print(toString(Instance))
    end
end
function fun:TravelToPeninsula()
    local RadiusLevelSubsystem = FindFirstOf("RadiusLevelSubsystem")
    local levelName = RadiusLevelSubsystem:GetCurrentLevelName()
    local levelTag = RadiusLevelSubsystem:GetCurrentLevel()
    if debugmode then print("Current Level: " .. levelName:ToString()) end
    print(tostring(levelTag))
    RadiusLevelSubsystem:ValidateLevelTag(levelTag)
    print(tostring(RadiusLevelSubsystem:IsLevelAvailable(levelTag)))
    RadiusLevelSubsystem:LoadLevel(levelTag,true,true,true) -- Crash the game
end

]] 

--- THESE DO NOTHING AS FAR AS I CAN TELL ---

--[[

function fun:ToggleAiDebug()
    local RadiusCheatSubsystem = FindFirstOf("RadiusCheatSubsystem")
    local aiDebug = RadiusCheatSubsystem:IsAIDebug()
    RadiusCheatSubsystem:SetAIDebug(not aiDebug)
    local aiDebug = RadiusCheatSubsystem:IsAIDebug()
    print("AiDebug: " .. tostring(aiDebug))
end

function fun:SpawnMissionArtefacts()
    local RadiusCheatSubsystem = FindFirstOf("RadiusCheatSubsystem")
    RadiusCheatSubsystem:SpawnMissionArtefacts()
end

function fun:ToggleControllerVisibility()
    local RadiusCheatSubsystem = FindFirstOf("RadiusCheatSubsystem")
    RadiusCheatSubsystem:ToggleControllerVisibility()
end

function fun:SpawnStartingGear()
    local RadiusCheatSubsystem = FindFirstOf("RadiusCheatSubsystem")
    RadiusCheatSubsystem:SpawnStartingGear()
end

---@param value number
function fun:SetSpeedCheatValue(value)
    local RadiusCheatSubsystem = FindFirstOf("RadiusCheatSubsystem")
    RadiusCheatSubsystem:SetSpeedCheatValue(value)
    local speedCheatValue = RadiusCheatSubsystem:GetSpeedCheatValue()
    print("SpeedCheatValue: " .. tostring(speedCheatValue))
end

function fun:ToggleSpeedCheat()
    local RadiusCheatSubsystem = FindFirstOf("RadiusCheatSubsystem")
    local speedCheat = RadiusCheatSubsystem:IsSpeedCheat()
    RadiusCheatSubsystem:SetSpeedCheat(not speedCheat)
    local speedCheat = RadiusCheatSubsystem:IsSpeedCheat()
    print("SpeedCheat: " .. tostring(speedCheat))
end

function fun:ToggleShowPlayerName()
    local RadiusCheatSubsystem = FindFirstOf("RadiusCheatSubsystem")
    local showPlayerName = RadiusCheatSubsystem:IsShowPlayerName()
    RadiusCheatSubsystem:SetShowPlayerName(not showPlayerName)
    local showPlayerName = RadiusCheatSubsystem:IsShowPlayerName()
    print("ShowPlayerName: " .. tostring(showPlayerName))
end

function fun:ToggleMagReloadCheat()
    local RadiusCheatSubsystem = FindFirstOf("RadiusCheatSubsystem")
    local magReloadCheat = RadiusCheatSubsystem:IsMagReloadCheat()
    RadiusCheatSubsystem:SetMagReloadCheat(not magReloadCheat)
    local magReloadCheat = RadiusCheatSubsystem:IsMagReloadCheat()
    print("MagReloadCheat: " .. tostring(magReloadCheat))
end

function fun:ToggleJumpAllowed()
    local RadiusCheatSubsystem = FindFirstOf("RadiusCheatSubsystem")
    local jumpAllowed = RadiusCheatSubsystem:IsJumpAllowed()
    RadiusCheatSubsystem:SetJumpAllowed(not jumpAllowed)
    local jumpAllowed = RadiusCheatSubsystem:IsJumpAllowed()
    print("JumpAllowed: " .. tostring(jumpAllowed))
end

function fun:ToggleInvisibleMode()
    local RadiusCheatSubsystem = FindFirstOf("RadiusCheatSubsystem")
    local invisibleMode = RadiusCheatSubsystem:IsInvisibleMode()
    RadiusCheatSubsystem:SetInvisibleMode(not invisibleMode)
    local invisibleMode = RadiusCheatSubsystem:IsInvisibleMode()
    print("InvisibleMode: " .. tostring(invisibleMode))
end

function fun:ToggleInfiniteAmmoCheat()
    local RadiusCheatSubsystem = FindFirstOf("RadiusCheatSubsystem")
    local infiniteAmmoCheat = RadiusCheatSubsystem:IsInfiniteAmmoCheat()
    RadiusCheatSubsystem:SetInfiniteAmmoCheat(not infiniteAmmoCheat)
    local infiniteAmmoCheat = RadiusCheatSubsystem:IsInfiniteAmmoCheat()
    print("InfiniteAmmoCheat: " .. tostring(infiniteAmmoCheat))
end

function fun:ToggleImmortalMode()
    local RadiusCheatSubsystem = FindFirstOf("RadiusCheatSubsystem")
    local immortalMode = RadiusCheatSubsystem:IsImmortalMode()
    RadiusCheatSubsystem:SetImmortalMode(not immortalMode)
    local immortalMode = RadiusCheatSubsystem:IsImmortalMode()
    print("ImmortalMode: " .. tostring(immortalMode))
end

function fun:ToggleGodMode()
    local RadiusCheatSubsystem = FindFirstOf("RadiusCheatSubsystem")
    local godMode = RadiusCheatSubsystem:IsGodMode()
    RadiusCheatSubsystem:SetGodMode(not godMode)
    local godMode = RadiusCheatSubsystem:IsGodMode()
    print("GodMode: " .. tostring(godMode))
end
]]

return fun