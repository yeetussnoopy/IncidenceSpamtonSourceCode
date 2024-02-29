local supportAttackUp, super = Class(Wave)

function supportAttackUp:init()
    super:init(self)

    -- Initialize timer
    self.siner = 100
    self.time = 13



end

function supportAttackUp:onStart()
local arena = Game.battle.arena

        arena:setSize(320, 80)
        arena:setOrigin(0.5, 0.1)

        self.encounter:setMode("right")




    -- Every 0.33 seconds...

    self.timer:every(2.7, function()
        -- Our X position is offscreen, to the right
       --local x = SCREEN_WIDTH+ 20
        -- Get a random Y position between the top and the bottom of the arena

        Assets.playSound("noise")

        local y = Utils.random(Game.battle.arena.top - 200, Game.battle.arena.top - 200)

         local x = Utils.random(Game.battle.arena.left + 10, Game.battle.arena.right -10)


          --local y = SCREEN_HEIGHT  -30





        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local bullet = self:spawnBullet("head_rotation", x, y, math.rad(90), 6)



    end)
    self.timer:every(1.4, function()
        -- Our X position is offscreen, to the right
       --local x = SCREEN_WIDTH+ 20
        -- Get a random Y position between the top and the bottom of the arena
        --local y = Utils.random(Game.battle.arena.top, Game.battle.arena.bottom)

         local x = Utils.random(Game.battle.arena.left, Game.battle.arena.right)

          local y = SCREEN_HEIGHT - 20





        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local bullet = self:spawnBullet("supportFlip", x, y, math.rad(270), 8)


        self.timer:script(function(wait)
         			wait(2)
     

         			--local bullet2 = self:spawnBullet("smallbullet", bullet.x, bullet.y, angle - 1.1, 7)

                     Assets.playSound("screenshake")

                     Game.battle.camera:shake(6)  

                     local angle = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)

         	        local bullet2 = self:spawnBullet("starBullet", bullet.x, bullet.y, angle+ 2.8, 7)
                    
         	        local bullet2 = self:spawnBullet("starBullet", bullet.x, bullet.y, angle - 4, 7)

         			local bullet2 = self:spawnBullet("starBullet", bullet.x, bullet.y, angle -2.8, 7)

         			--local bullet2 = self:spawnBullet("smallbullet", bullet.x, bullet.y, angle + 2.5, 7)

         			--local bullet2 = self:spawnBullet("smallbullet", bullet.x, bullet.y, angle -2.5, 7)

         			 			bullet2.targeting = true

                                bullet:explode()

         			bullet2:setLayer(self.layer + 0.01)
         			end)

    end)
end

function supportAttackUp:update()
    -- Code here gets called every frame

    super:update(self)
end

return supportAttackUp