local wireheart, super = Class(Wave)

function wireheart:init()
	super:init(self)

	self.time = 9

	    self.soul_start_x = 320
                self.soul_start_y = 250
                            self.encounter:setMode("up")


end

function wireheart:onStart()

local arena = Game.battle.arena


        arena:setSize(100, 100)
        arena:setOrigin(0.5, -0.3)

       -- self.sNeo.sprite:slideTo(250, -350, 4)

    self.timer:every(9/15, function()
        local x = Utils.random(Game.battle.arena.left - 50, Game.battle.arena.right + 100)
        local y = Utils.random(Game.battle.arena.top - 70, Game.battle.arena.top - 70)

         local angle = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)


            -- Loop through all attackers

                   -- Get the attacker's center position
                   --local x, y = attacker:getRelativePos(attacker.width/2, attacker.height/2)

                    local wireheart = self:spawnSprite("bullets/wireheart", x , y - 80)

                    wireheart:slideTo(x, y - 10, 0.5)

                             local angle1 = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)

                       wireheart.rotation = angle1
                       wireheart:setScale(3)
                       wireheart.shake_x = 5
                       wireheart.shake_y = 5



                         Assets.playSound("vineboom")

                         self:spawnBullet("smallbullet", x , y -  30 , angle1, 10)
                                 self:spawnBullet("smallbullet", x , y  -30 , angle1 - 0.2, 10)
                              self:spawnBullet("smallbullet", x , y - 30 , angle1  +0.2, 10)
                         


                     --self:spawnBullet("yeetHead", x - 50, randY, angle1, 5)

                       --self:spawnBullet("yeetHead", x - 50, randY, angle1, 5)

                      self.timer:script(function(wait)

wait(1.2)

wireheart:explode()
end)






       --self:spawnSprite("bullets/wireheart", x, y, math.rad(180))
      -- self.rotation = Utils.angle(self.x, self.y, Game.battle.soul.x, Game.battle.soul.y)

        --self:spawnBullet("smallbullet", x, y, angle, 2)





    end)
end

function wireheart:onEnd()
    self.encounter:setMode("normal")
    super:onEnd()
end


return wireheart