local supportTBomb, super = Class(Wave)

function supportTBomb:init()
	super:init(self)

	self.time = 11

	 self.soul_start_x = 320
        self.soul_start_y = 250


end

function supportTBomb:onStart()

local arena = Game.battle.arena


        arena:setSize(200, 200)
        arena:setOrigin(0.5, -0.1)

                                             Assets.playSound("laugh")



            self.timer:every(1, function()

            self.timer:script(function(wait)



        local x = Game.battle.soul.x
        local y = Game.battle.soul.y

         local angle = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)

         local bomb = self:spawnSprite("bullets/warning", x , y)
                                       bomb.rotation = math.rad(0)
                                       bomb:setScale(1)
                                       bomb.layer = BATTLE_LAYERS["above_bullets"]

                                                                			wait(1)


         --bullet.rotation


                                     Assets.playSound("bomb")

 			--[[local bullet = self:spawnBullet("supportLock", bomb.x - 100, bomb.y, math.rad(0), 12, math.rad(0), 0.9)
            local bullet = self:spawnBullet("supportLock", bomb.x  + 100, bomb.y, math.rad(180), 12, math.rad(0), 0.9)
            local bullet = self:spawnBullet("supportLock", bomb.x, bomb.y - 100, math.rad(90), 12, math.rad(90), 0.9)
            local bullet = self:spawnBullet("supportLock", bomb.x , bomb.y + 100, math.rad(270), 12, math.rad(270), 0.9)]]
            
                  local bullet1 = self:spawnBullet("supportLock", bomb.x + 300, bomb.y + 300, math.rad(225), 14, math.rad(0), 0.6)
                   local      bullet2 = self:spawnBullet("supportLock", bomb.x + 300, bomb.y - 300, math.rad(135), 14, math.rad(0), 0.6)
                   local      bullet3 = self:spawnBullet("supportLock", bomb.x - 300, bomb.y + 300, math.rad(315), 14, math.rad(0), 0.6)
                        local bullet4 = self:spawnBullet("supportLock", bomb.x - 300, bomb.y - 300, math.rad(45), 14, math.rad(0), 0.6)
bullet1.remove_offscreen = false
bullet1.destroy_on_hit = false
bullet2.remove_offscreen = false
bullet2.destroy_on_hit = false
bullet3.remove_offscreen = false
bullet3.destroy_on_hit = false
bullet4.remove_offscreen = false
bullet4.destroy_on_hit = false

    for i = 1, 20 do
                                  local burst = RudeBusterBurst("effects/rudebuster/beam_red", bomb.x, bomb.y, math.rad(30 + ((i - 1) * 30)), i > 3)
                                 burst.layer = bomb.layer + (0.01 * i)
                                      bomb.parent:addChild(burst)
                                         end

bomb.graphics.grow = 0
 			bomb:fadeOutAndRemove(0.2)




end)

    end)
end

return supportTBomb