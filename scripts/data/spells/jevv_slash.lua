local Spell = Class(Spell, "jevv_slash")

function Spell:init()
    -- Display name
    self.name = "Big Shot"
    -- Name displayed when cast (optional)
    self.cast_name = "Big Shot"

    -- Battle description
    self.effect = "Heavy\nDamage"
    -- Menu description
    self.description = "Deal heavy roleban damage with a red circular slash."

    -- TP cost
    self.cost = 50
    -- Whether the spell can be used
    self.usable = true

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "enemy"

    -- Tags that apply to this spell
    self.tags = {}
end

function Spell:getName() return self.name end
function Spell:getCastName() return self.cast_name or self:getName():upper() end

function Spell:getDescription() return self.description end
function Spell:getBattleDescription() return self.effect end

function Spell:getTPCost(chara) return self.cost end
function Spell:isUsable(chara) return self.usable end

function Spell:hasTag(tag)
    return Utils.containsValue(self.tags, tag)
end

function Spell:getCastMessage(user, target)
    return {
       

    }
end

function Spell:onCast(self, target)
    -- Returning false here allows you to call 'Game.battle:finishActionBy(user)' yourself

--Game.battle:startCutscene("dummy.refuse", "susie", "kris")

 --for i, target in ipairs(Game.battle.enemies) do

 Game.battle.timer:script(function(wait)

 

 local x, y = target.x, target.y

 local wireheart = Sprite("bullets/wireheart", x - 150  , y - 300)

 local angle = Utils.angle(wireheart.x, wireheart.y, x, y)



 wireheart.rotation = math.rad(45)
 wireheart:setScale(2.5)


 Game.battle:addChild(wireheart)




 wireheart:slideTo(wireheart.x, y - 240, 0.3)

wait(0.6) 

Game.battle.camera:shake(10)


        for i = 1, 20 do
            Assets.playSound("omori_hit")
                local burst = RudeBusterBurst("effects/rudebuster/beam_red", target.target_x, target.target_y - 80, math.rad(70 + ((i - 1) * 70)), i > 9)
                burst.layer = target.layer + (0.01 * i)
                target.parent:addChild(burst)
            end
--target.onDefeatFatal

           target:sparkle(12, 213, 11)

           
                  target:hurt(300, self)

                  --wireheart:remove()

             



                  wait(0.6) 

                      wireheart:slideTo(wireheart.x, y - 300, 0.3)

                      wait(0.6) 
wireheart:remove()

Game.battle:finishActionBy(self)



        end)            
        return false        
end

function Spell:onStart(user, target)
    Game.battle:battleText(self:getCastMessage(user, target))
    user:setAnimation("battle/spell", function()
        local result = self:onCast(user, target)
        if result or result == nil then
            Game.battle:finishActionBy(user)
        end
    end)
end

return Spell