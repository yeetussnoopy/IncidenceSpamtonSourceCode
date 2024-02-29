local wireheartMega, super = Class(Wave)

function wireheartMega:init()
	super:init(self)

	self.time = 10
self.fart = 0
	    self.soul_start_x = 320
                self.soul_start_y = 250
self.current = 3

 self.roleban2 = self:spawnSprite("bullets/yeetHead_2", 322 , 70)
                               self.roleban2.rotation = math.rad(0)
                               self.roleban2:setScale(3)
                               self.roleban2.layer = BATTLE_LAYERS["above_bullets"]
                                           self.encounter:setMode("shoot")

end

function wireheartMega:onStart()

local arena = Game.battle.arena

                            Assets.playSound("cardrive")


        arena:setSize(300, 200)
        arena:setOrigin(0.5, -0.2)

       -- self.sNeo.sprite:slideTo(250, -350, 4)

    self.timer:every(1, function()
        local x = Game.battle.arena.right + 160
                local y = Utils.random(Game.battle.arena.bottom + 70, Game.battle.arena.top - 70)

         local angle = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)


            -- Loop through all attackers

                   -- Get the attacker's center position
                   --local x, y = attacker:getRelativePos(attacker.width/2, attacker.height/2)

                    local wireheart = self:spawnSprite("bullets/wireheart", x , y)

                   -- wireheart:slideTo(x, y - 10, 0.5)

                             local angle1 = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)

                       wireheart.rotation = angle1
                       wireheart:setScale(3)
                       wireheart.shake_x = 5
                       wireheart.shake_y = 5




                         self:spawnBullet("smallbullet", x , y , angle1, 12)
                                 self:spawnBullet("smallbullet", x , y , angle1 - 0.2, 12)
                              self:spawnBullet("smallbullet", x , y  , angle1  +0.2, 12)




                      self.timer:script(function(wait)

wait(1.2)

wireheart:explode()
end)



    end)
        self.timer:every(1.1, function()

                    local angle2 = Utils.angle(self.roleban2.x, self.roleban2.y, Game.battle.soul.x, Game.battle.soul.y)


Game.battle.camera:shake(10)                         --self:spawnBullet("yeetHead", x - 50, randY, angle1, 5)

                            Assets.playSound("bluh")
                        --self:spawnBullet("yeetHead", x - 50, randY, angle1, 5)

      local bullet1 = self:spawnBullet("supportLock", self.roleban2.x, self.roleban2.y,angle2 - 0.1, 7, math.rad(0), 0.6)
         local      bullet2 = self:spawnBullet("supportLock", self.roleban2.x, self.roleban2.y, angle2 +0.1, 7, math.rad(0), 0.6)
          local      bullet3 = self:spawnBullet("supportLock", self.roleban2.x, self.roleban2.y, angle2, 7, math.rad(0), 0.6)
              local bullet4 = self:spawnBullet("supportLock", self.roleban2.x, self.roleban2.y,angle2-0.2, 7, math.rad(0), 0.6)
              local bullet5 = self:spawnBullet("supportLock", self.roleban2.x, self.roleban2.y, angle2 + 0.2, 7, math.rad(0), 0.6)
                  end)




end

function wireheartMega:update()

  self.fart = self.fart + (1 * DTMULT)


self.roleban2.x = 323 + (math.sin(self.fart * 0.08) * 70)
        self.roleban2.y = 70 + (math.sin(self.fart * 0.04) * 10)
    self.roleban2.rotation =math.rad(15*math.cos(self.fart * 0.1) * 1.2)

        super:update(self)
    end
function wireheartMega:onEnd()
    self.encounter:setMode("normal")
    super:onEnd()
end


return wireheartMega