-- Auto generated script file --

--hide vanilla model
vanilla_model.PLAYER:setVisible(false)

--hide vanilla armor model
vanilla_model.ARMOR:setVisible(false)

--hide vanilla cape model
vanilla_model.CAPE:setVisible(false)

--hide vanilla elytra model
vanilla_model.ELYTRA:setVisible(false)

local mainPage = action_wheel:newPage()
action_wheel:setPage(mainPage)
models.BabaIsYouFigura.Jiji:setVisible(false)
models.BabaIsYouFigura.Keke:setVisible(false)
models.BabaIsYouFigura.It:setVisible(false)
models.BabaIsYouFigura.Fofo:setVisible(false)
models.BabaIsYouFigura.Me:setVisible(false)
models.BabaIsYouFigura.Worm:setVisible(false)
animations.BabaIsYouFigura.ItemLevitate:play()

local rule = {[[rule.rule1]],[[rule.rule2]],[[rule.rule3]],[[rule.rule4]],[[rule.rule5]]}

_G. walk = {[[walk.walk1]],[[walk.walk2]],[[walk.walk3]],[[walk.walk4]],[[walk.walk5]],[[walk.walk6]],[[walk.walk7]],[[walk.walk8]],[[walk.walk9]],[[walk.walk10]],[[walk.walk11]]}

function events.ON_PLAY_SOUND(id, pos, path)
    if not path then return end -- dont trigger if the sound was played by figura (prevent potential infinite loop)
    if not player:isLoaded() then return end -- dont do anything if the player isn't loaded
    if (player:getPos() - pos):length() > 0.05 then return end -- make sure the sound is (most likely) played by *you*
  
    if id:find(".step") then -- if sound contains ".step"
        return true -- stop the actual step sound
    end
end

function events.render()
    local crouching = player:getPose() == "CROUCHING"
    local sleeping = player:getPose() == "SLEEPING"
    local swimming = player:getPose() == "SWIMMING"
    local walking = player:getVelocity().xz:length() > .01
    local sprinting = player:isSprinting()
    animations.BabaIsYouFigura.Walk:play()
    if walking == false then 
        animations.BabaIsYouFigura.Walk:setSpeed(0)
    elseif walking == true then
        animations.BabaIsYouFigura.Walk:setSpeed(1)
    end
    if crouching == true then
        animations.BabaIsYouFigura.Walk:setPlaying(false)
    end
    if player:getVehicle(true) then
        animations.BabaIsYouFigura.Walk:setPlaying(false)
        animations.BabaIsYouFigura.Sit:setPlaying(true)
    end
    if player:isGliding() == true then
        animations.BabaIsYouFigura.Glide:setPlaying(true)
    elseif player:isGliding() == false then
        animations.BabaIsYouFigura.Glide:setPlaying(false)
    end
    if sprinting == true then 
        animations.BabaIsYouFigura.Walk:setSpeed(1.5)
    end
    animations.BabaIsYouFigura.Crouch:setPlaying(crouching)
    animations.BabaIsYouFigura.Sleep:setPlaying(sleeping)
    animations.BabaIsYouFigura.Swimming:setPlaying(swimming)
    
end

config:setName("characterlastused")
local function selectCharacter(name, r, g, b, eye, guh)
    for _, character in ipairs(models.BabaIsYouFigura:getChildren()) do
        character:setVisible(character:getName() == name)
    end
    for _, character in ipairs(models.Portrait.Portrait:getChildren()) do
        character:setVisible(character:getName() == name)
    end
    nameplate.All:setText('[{"color":"#' .. vectors.rgbToHex(r, g, b) .. '","text":"' .. name .. '"}]', 10, 10, 10)
    -- Added loaded check here
    if player:isLoaded() then
        sounds:playSound(rule[math.random(#rule)], player:getPos(), 1, 1, false)
    end
    models.BabaIsYouFigura.LeftItemPivot:setVisible(true)
    models.BabaIsYouFigura.RightItemPivot:setVisible(true)
    avatar:setColor(r, g, b)
    renderer:setOffsetCameraPivot(0, eye, 0)
    nameplate.ENTITY:setPivot(0,guh,0)
    --insert some stupid bullshit about config api lmao :cry_laugh_emoji:
    if host:isHost() then
        config:save("name", name)
        config:save("r", r)
        config:save("g", g)
        config:save("b", b)
        config:save("eye", eye)
        config:save("guh", guh)
    end
  end

function events.ENTITY_INIT()
    if config:load[[name]] then 
        pings.selectCharacter(config:load[[name]], config:load[[r]], config:load[[g]], config:load[[b]], config:load[[eye]], config:load[[guh]])
    end
end

pings.selectCharacter = selectCharacter

local Baba = mainPage:newAction()
    :title("Baba")
    :setTexture(textures["BABA"])
    :hoverColor(0.85, 0.22, 0.42)
    :onLeftClick(function() pings.selectCharacter("Baba", 1, 1, 1, -0.75, 1) end)

local Keke = mainPage:newAction()
    :title("Keke")
    :setTexture(textures["KEKE"])
    :hoverColor(0.89, 0.32, 0.23)
    :onLeftClick(function() pings.selectCharacter("Keke", 0.89, 0.32, 0.23, -.5, 1.1) end)

local Robot = mainPage:newAction()
    :title("Robot")
    :setTexture(textures["ROBOT"])
    :hoverColor(0.45, 0.45, 0.45)
    :onLeftClick(function() pings.selectCharacter("Robot", 0.45, 0.45, 0.45, -.2, 1.8) end)

local Jiji = mainPage:newAction()
    :title("Jiji")
    :setTexture(textures["JIJI"])
    :hoverColor(0.89, 0.60, 0.31)
    :onLeftClick(function() pings.selectCharacter("Jiji", 0.89, 0.60, 0.31, -0.5, 1.7) end)
    
local It = mainPage:newAction()
    :title("It")
    :setTexture(textures["IT"])
    :hoverColor(0.514, 0.784, 0.898)
    :onLeftClick(function() pings.selectCharacter("It", 0.514, 0.784, 0.898, -0.5, 1.2) end)

local Fofo = mainPage:newAction()
    :title("Fofo")
    :setTexture(textures["FOFO"])
    :hoverColor(0.36, 0.51, 0.22)
    :onLeftClick(function() pings.selectCharacter("Fofo", 0.36, 0.51, 0.22, -.5, 1.1) end)

local Me = mainPage:newAction()
    :title("Me")
    :setTexture(textures["ME"])
    :hoverColor(0.56, 0.37, 0.61)
    :onLeftClick(function() pings.selectCharacter("Me", 0.56, 0.37, 0.61, -.5, 1.2) end)

local Worm = mainPage:newAction()
    :title("Worm")
    :setTexture(textures["WORM"])
    :hoverColor(1, 1, 1)
    :onLeftClick(function() pings.selectCharacter("Worm", 1, 1, 1, -1.1, .7) end)





