local UEHelpers = require("UEHelpers")
local fun = require("fun")

print("ITR2-Unbound started")

debugmode = false
if debugmode then
    print("Debug mode enabled")
end

local infiniteStamina = false
local infiniteHealth = false
local noHunger = false

RegisterHook("/Script/IntoTheRadius2.RadiusGameMode:OnLevelLoaded", function()
    ExecuteWithDelay(1000, function()
        LoopAsync(500, function()
            if (infiniteStamina) then
                fun:SetStamina(100)
                fun:SetHunger(10000)
            end
            if (infiniteHealth) then
                fun:SetHealth(100)
            end
            if (noHunger) then
                fun:SetHunger(10000)
            end
            return false -- Loops forever
        end)
    end)
end)

RegisterKeyBind(Key.D, function()
    fun:ToggleDebugMode()
end)

RegisterKeyBind(Key.ZERO, function()
    fun:SetAccessLevel(0)
end)

RegisterKeyBind(Key.ONE, function()
    fun:SetAccessLevel(1)
end)

RegisterKeyBind(Key.TWO, function()
    fun:SetAccessLevel(2)
end)

RegisterKeyBind(Key.THREE, function()
    fun:SetAccessLevel(3)
end)

RegisterKeyBind(Key.M, function()
    fun:AddMoney(10000)
end)

RegisterKeyBind(Key.C, function()
    fun:ToggleNoClip()
end)

RegisterKeyBind(Key.S, function()
    infiniteStamina = not infiniteStamina
    if infiniteStamina then
        if debugmode then print("Infinite Stamina enabled") end
    else
        if debugmode then print("Infinite Stamina disabled") end
    end
end)

RegisterKeyBind(Key.L, function()
    infiniteHealth = not infiniteHealth
    if infiniteHealth then
        if debugmode then print("Infinite Health enabled") end
    else
        if debugmode then print("Infinite Health disabled") end
    end
end)

RegisterKeyBind(Key.H, function()
    noHunger = not noHunger
    if noHunger then
        if debugmode then print("No Hunger enabled") end
    else
        if debugmode then print("No Hunger disabled") end
    end
end)

RegisterKeyBind(Key.J, function()
    fun:ToggleJumpAllowed()
end)


--[[

THESE DON'T ACTUALLY DO ANYTHING

RegisterKeyBind(Key.A, function()
    fun:ToggleAiDebug()
end)

RegisterKeyBind(Key.N, function()
    fun:SpawnMissionArtefacts()
end)

RegisterKeyBind(Key.V, function()
    fun:ToggleControllerVisibility()
end)

RegisterKeyBind(Key.H, function()
    fun:SpawnStartingGear()
end)

RegisterKeyBind(Key.NUM_ONE, function()
    fun:SetSpeedCheatValue(1)
end)

RegisterKeyBind(Key.NUM_TWO, function()
    fun:SetSpeedCheatValue(2)
end)

RegisterKeyBind(Key.NUM_THREE, function()
    fun:SetSpeedCheatValue(3)
end)

RegisterKeyBind(Key.NUM_FOUR, function()
    fun:SetSpeedCheatValue(4)
end)

RegisterKeyBind(Key.NUM_FIVE, function()
    fun:SetSpeedCheatValue(5)
end)

RegisterKeyBind(Key.NUM_SIX, function()
    fun:SetSpeedCheatValue(6)
end)

RegisterKeyBind(Key.NUM_SEVEN, function()
    fun:SetSpeedCheatValue(7)
end)

RegisterKeyBind(Key.NUM_EIGHT, function()
    fun:SetSpeedCheatValue(8)
end)

RegisterKeyBind(Key.NUM_NINE, function()
    fun:SetSpeedCheatValue(9)
end)

RegisterKeyBind(Key.NUM_ZERO, function()
    fun:SetSpeedCheatValue(10)
end)

RegisterKeyBind(Key.F, function()
    fun:ToggleSpeedCheat()
end)

RegisterKeyBind(Key.P, function()
    fun:ToggleShowPlayerName()
end)

RegisterKeyBind(Key.R, function()
    fun:ToggleMagReloadCheat()
end)

RegisterKeyBind(Key.V, function()
    fun:ToggleInvisibleMode()
end)

RegisterKeyBind(Key.A, function()
    fun:ToggleInfiniteAmmoCheat()
end)

RegisterKeyBind(Key.I, function()
    fun:ToggleImmortalMode()
end)

RegisterKeyBind(Key.G, function()
    fun:ToggleGodMode()
end)

RegisterKeyBind(Key.X, function()
    fun:testMethod()
end)

RegisterKeyBind(Key.T, function()
    fun:TravelToPeninsula()
end)

]]
