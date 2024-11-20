-- Auto generated script file --

--hide vanilla model
vanilla_model.PLAYER:setVisible(false)

--hide vanilla armor model
vanilla_model.ARMOR:setVisible(false)

--hide vanilla cape model
vanilla_model.CAPE:setVisible(false)

--hide vanilla elytra model
vanilla_model.ELYTRA:setVisible(false)

function events.render()
  local crouching = player:getPose() == "CROUCHING"
  -- local sleeping = player:getPose() == "SLEEPING"
  -- local swimming = player:getPose() == "SWIMMING"
  local walking = player:getVelocity().xz:length() > .01
  local sprinting = player:isSprinting()
  animations.model.Walk:play()
  if walking == false then 
      animations.model.Walk:setSpeed(0)
  elseif walking == true then
      animations.model.Walk:setSpeed(1)
  end
  if crouching == true then
      animations.model.Walk:setPlaying(false)
  end
  if player:getVehicle(true) then
      animations.model.Walk:setPlaying(false)
      animations.model.Sit:setPlaying(true)
  end
--[[  if player:isGliding() == true then
      animations.model.Glide:setPlaying(true)
  elseif player:isGliding() == false then
      animations.model.Glide:setPlaying(false)
  end --]]
  if sprinting == true then 
      animations.model.Walk:setSpeed(1.5)
  end
  animations.model.Crouch:setPlaying(crouching)
 -- animations.model.Sleep:setPlaying(sleeping)
--  animations.model.Swimming:setPlaying(swimming)
  
end
