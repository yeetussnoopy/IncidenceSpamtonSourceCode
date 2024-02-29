local supportNuke, super = Class(Wave)

function supportNuke:init()
    super:init(self)

    -- Initialize timer
    self.siner = 100
    self.time = 9

end

function supportNuke:onStart()

    local arena = Game.battle.arena

    arena:setSize(300, 300)

                self.encounter:setMode("right")



    -- Every 0.33 seconds...
    self.timer:every(7/8, function()
        -- Our X position is offscreen, to the right
       --local x = SCREEN_WIDTH+ 20
        -- Get a random Y position between the top and the bottom of the arena
        --local y = Utils.random(Game.battle.arena.top, Game.battle.arena.bottom)

         --local x = Utils.random(Game.battle.arena.left, Game.battle.arena.right)

          --local y = SCREEN_HEIGHT - 20

          local x = Utils.random(Game.battle.arena.left, Game.battle.arena.right)

          local y = Utils.random(Game.battle.arena.top, Game.battle.arena.bottom)
          
           local bomb = self:spawnSprite("bullets/warning", x , y)
                              bomb.rotation = math.rad(0)
                              bomb:setScale(1)
                              bomb.layer = BATTLE_LAYERS["above_bullets"]





        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
 		self.timer:script(function(wait)

 		

        wait(1)
         Assets.playSound("scytheburst")

         for i = 1, 20 do
                                  local burst = RudeBusterBurst("effects/rudebuster/beam_red", bomb.x, bomb.y, math.rad(70 + ((i - 1) * 70)), i > 9)
                                 burst.layer = bomb.layer + (0.01 * i)
                                      bomb.parent:addChild(burst)
                                           end

bomb.graphics.grow = 0
 			bomb:fadeOutAndRemove(0.2)


                local bullet = self:spawnBullet("smallbullet", x, y, math.rad(180), 20)




         			local bullet2 = self:spawnBullet("smallbullet", bullet.x, bullet.y, math.rad(0), 10)
         			 local bullet2 = self:spawnBullet("smallbullet", bullet.x, bullet.y, math.rad(270), 10)
        
         			local bullet2 = self:spawnBullet("smallbullet", bullet.x, bullet.y, math.rad(90), 10)

         			local bullet2 = self:spawnBullet("smallbullet", bullet.x, bullet.y, math.rad(180), 10)

         			local bullet2 = self:spawnBullet("smallbullet", bullet.x, bullet.y, math.rad(45), 10)
                             			 local bullet2 = self:spawnBullet("smallbullet", bullet.x, bullet.y, math.rad(135), 10)

                             			local bullet2 = self:spawnBullet("smallbullet", bullet.x, bullet.y, math.rad(225), 10)

                             			local bullet2 = self:spawnBullet("smallbullet", bullet.x, bullet.y, math.rad(315), 10)




        -- Dont remove the bullet offscreen, because we spawn it offscreen
        bullet.remove_offscreen = false

        bullet.graphics.grow = 0.2
                         			bullet:fadeOutAndRemove(0.2)

        end)
    end)
end

function supportNuke:update()
    -- Code here gets called every frame

    super:update(self)
end

return supportNuke