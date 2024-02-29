local mariNeo, super = Class(Actor, "mariNeo")

function mariNeo:init()
    super:init(self)
    self.width, self.height = 50, 84
    self.hitbox = {12,41, 30,40}
    self.path = "npcs/mari"
    self.voice = "mari"
    self.flip = "right"
    self.portrait_path = "face/mari"
    self.portrait_offset = {-18, -14}

  

end

function mariNeo:createSprite()
    return mariActor(self)
end

function mariNeo:onSetAnimation(sprite, anim, ...)
    local args = {...}
    if anim == "idle" then
        sprite:resetParts(true)
          sprite:setSwingSpeed(1.3)

    elseif anim == "down" then
        sprite:resetParts()
        sprite:setHeadFrame(1)
        sprite:setSwingSpeed(0.7)
        elseif anim == "left" then
                sprite:resetParts()
                sprite:setHeadFrame(1)
                sprite:setSwingSpeed(0.7)
    elseif anim == "shaking" then
        sprite:setHeadFrame(3)
        sprite:setAllPartsShaking(true)
        for _,part in ipairs(sprite.parts) do
            sprite:setSwingSpeed(0)
        end
    elseif anim == "walk" then
        sprite:setPartSine("arm_l", 0)
        sprite:setPartSine("leg_l", 0)
        sprite:setPartSine("arm_r", math.pi*27)
        sprite:setPartSine("leg_r", math.pi*27)
        for _,part in ipairs{"arm_l", "leg_l", "arm_r", "leg_r"} do
            sprite:setPartSwingSpeed(part, 3)
            sprite:setPartSwingRange(part, math.rad(50))
        end
        elseif anim == "snap" then
                sprite:snapStrings(25, true)


    elseif anim == "aim" then
        sprite:resetParts()
        sprite:setHeadFrame(1)
        sprite:setPartSprite("arm_l", "npcs/mari/arm_cannon")
        sprite:setPartSwingSpeed("arm_l", 0)
        local angle = args[1] or math.rad(170)
        sprite:tweenPartRotation("arm_l", angle, 0.3, "out-cubic")
    elseif anim == "death" then
        sprite:resetParts(true)
        sprite:setSwingSpeed(0.7)
        sprite:setPartSprite("head", "npcs/mari/head_death")


    elseif anim == "hurt" then
            sprite:setPartSprite("head", "npcs/mari/head_death")

        end


end

return mariNeo