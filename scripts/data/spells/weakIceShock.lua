local spell, super = Class(Spell, "weakIceShock")

function spell:init()
    super:init(self)

    -- Display name
    self.name = "Unwilling\nIce Shock"
    -- Name displayed when cast (optional)
    self.cast_name = nil

    -- Battle description
    self.effect = "Weak\nw/ Recoil"
    -- Menu description
    self.description = "Deals magical ICE damage to\none enemy."

    -- TP cost
    self.cost = 55

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "enemy"

    -- Tags that apply to this spell
    self.tags = {"ice", "damage"}
end

function spell:getTPCost(chara)
    local cost = super:getTPCost(self, chara)
    if chara and chara:checkWeapon("thornring") then
        cost = Utils.round(cost / 2)
    end
    return cost
end

function spell:onCast(user, target)
    user.chara:addFlag("iceshocks_used", 1)

    local function createParticle(x, y)
        local sprite = Sprite("effects/icespell/snowflake", x, y)
        sprite:setOrigin(0.5, 0.5)
        sprite:setScale(1.5)
        sprite.layer = BATTLE_LAYERS["above_battlers"]
        Game.battle:addChild(sprite)
        return sprite
    end

    local x, y = target:getRelativePos(target.width/2, target.height/2, Game.battle)

    local particles = {}
    Game.battle.timer:script(function(wait)
        wait(1/30)
        Assets.playSound("icespell", 1, 0.7)
        particles[1] = createParticle(x-25, y-20)
        wait(3/30)
        particles[2] = createParticle(x+25, y-20)
        wait(3/30)
        particles[3] = createParticle(x, y+20)
        wait(3/30)
        Game.battle:addChild(IceSpellBurst(x, y))
        for _,particle in ipairs(particles) do
            for i = 0, 9 do
                local effect = IceSpellEffect(particle.x, particle.y)
                effect:setScale(0.75)
                effect.physics.direction = math.rad(30 * i)
                effect.physics.speed = 5
                effect.physics.friction = 0.4
                effect.layer = BATTLE_LAYERS["above_battlers"] - 1
                Game.battle:addChild(effect)
            end
        end
        wait(1/30)
        for _,particle in ipairs(particles) do
            particle:remove()
        end
        wait(4/30)

        local min_magic = Utils.clamp(user.chara:getStat("magic") - 10, 1, 999)
        local damage = math.ceil((min_magic * 1) + 1 + Utils.random(1))
        target:hurt(damage, user)
        wait(0.3)
        user:hurt(damage, user)

user:setSprite("battle/defeat_1")
        Game.battle:finishActionBy(user)
    end)

    return false
end

function spell:getCastMessage(user, target)
    return {"[wait:20][voice:noelle][speed:0.5]* (Not again...Not like with Yellow...)",
            "[voice:noelle]* Kris. I thought you said I didn't have to use it.",
            "(It would be more wise to have Noelle heal and defend for TP than to do this.)",
            }

end

return spell