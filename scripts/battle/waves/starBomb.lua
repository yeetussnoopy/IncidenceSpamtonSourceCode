local starBomb, super = Class(Wave)

function starBomb:init()
    super:init(self)

    -- Initialize timer
    self.siner = 100
    self.time = 13

                    self.fart = 0

     self.soul_start_x = 450
                     self.soul_start_y = 250


end

function starBomb:onStart()

    local arena = Game.battle.arena

    arena:setSize(100, 300)
            arena:setOrigin(-1, 0.5)

                        Assets.playSound("laugh")


                self.encounter:setMode("up")


    -- Every 0.33 seconds...

    self.timer:every(3, function()
        local x = Utils.random(Game.battle.arena.left - 30, Game.battle.arena.left - 50)
        local y = Utils.random(Game.battle.arena.top  + 10, Game.battle.arena.top  + 10)

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

end)


    self.timer:every(2, function()
        -- Our X position is offscreen, to the right
       --local x = SCREEN_WIDTH+ 20
        -- Get a random Y position between the top and the bottom of the arena
        --local y = Utils.random(Game.battle.arena.top, Game.battle.arena.bottom)

         --local x = Utils.random(Game.battle.arena.left, Game.battle.arena.right)

          --local y = SCREEN_HEIGHT - 20

          local x = Utils.random(Game.battle.arena.left - 100, Game.battle.arena.left - 150)

          local y = Utils.random(Game.battle.arena.top + 20 , Game.battle.arena.bottom - 20)
          
           local bomb = self:spawnSprite("bullets/warning", x , y)
                              bomb.rotation = math.rad(0)
                              bomb:setScale(2)
                              bomb.layer = BATTLE_LAYERS["above_bullets"]





        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
 		self.timer:script(function(wait)

 		

        wait(1)
         Assets.playSound("bomb")

         for i = 1, 69 do
                                  local burst = RudeBusterBurst("effects/rudebuster/beam_red", bomb.x, bomb.y, math.rad(35 + ((i - 1) * 32)), i > 17)
                                 burst.layer = bomb.layer + (0.01 * i)
                                      bomb.parent:addChild(burst)
                                           end

bomb.graphics.grow = 0

 			bomb:fadeOutAndRemove(0.2)


             local bullet = self:spawnBullet("smallbullet", x, y, math.rad(180), 20)




             local bullet2 = self:spawnBullet("wallBomb", bullet.x, bullet.y, math.rad(0), 10)

         		



        -- Dont remove the bullet offscreen, because we spawn it offscreen
        bullet.remove_offscreen = false

        bullet.graphics.grow = 0.2
                         			bullet:fadeOutAndRemove(0.2)

        end)
    end)


end

function starBomb:update()


    super:update(self)
end

return starBomb