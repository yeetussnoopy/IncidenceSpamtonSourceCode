local muteWalls, super = Class(Wave)

function muteWalls:init()
    super:init(self)
    self.time=15
end

function muteWalls:onStart()
    Game.battle.arena:setSize(400, 170)
    local arena = Game.battle.arena
    arena:setOrigin(0.5, 0.2)

                    self.encounter:setMode("right")
                                                                 Assets.playSound("laugh")


    self.timer:every(5, function()
		
        local y = Utils.random(Game.battle.arena.top + 20 , Game.battle.arena.bottom - 20)

         local angle = Utils.angle(700, y, Game.battle.soul.x, Game.battle.soul.y)

         -- Spawn smallbullet angled towards the player with speed 8 (see scripts/battle/bullets/ssmallbullet.lua)
         Assets.playSound("wing")

         local bullet = self:spawnBullet("boomerang", 700, y, angle, 14)
         bullet.remove_offscreen = false

     end)

    self.timer:every(2, function()
        -- Our X position is offscreen, to the right
       --local x = SCREEN_WIDTH+ 20
        -- Get a random Y position between the top and the bottom of the arena

        Assets.playSound("noise")

        local y = Utils.random(Game.battle.arena.top - 150, Game.battle.arena.top - 150)

         local x = Utils.random(Game.battle.arena.left + 10, Game.battle.arena.right -10)


          --local y = SCREEN_HEIGHT  -30





        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local bullet = self:spawnBullet("head_rotation", x, y, math.rad(90), 9)



    end)

    self.timer:every(2.5, function()

     local tx = Utils.random(Game.battle.arena.left - 100, Game.battle.arena.right + 100)
            local ty = Utils.random(Game.battle.arena.top -20, Game.battle.arena.top - 70)

             local angle = Utils.angle(tx, ty, Game.battle.soul.x, Game.battle.soul.y)


         			         local bullet = self:spawnSprite("bullets/wireheart", tx , ty - 80)



                                                    bullet.rotation = angle
                                                    bullet:setScale(2)
                                                    bullet.shake_x = 5
                                                    bullet.shake_y = 5


             		self.timer:script(function(wait)
             			bullet.targeting = true
             			bullet:slideTo(tx, ty - 10, 0.5)

             			Assets.playSound("vineboom")

             			local bullet2 = self:spawnBullet("smallbullet", bullet.x, bullet.y + 30, angle, 7)
             	        local bullet2 = self:spawnBullet("smallbullet", bullet.x, bullet.y + 30, angle+ 0.3, 7)

             			local bullet2 = self:spawnBullet("smallbullet", bullet.x, bullet.y +30, angle -0.3, 7)

             			local bullet2 = self:spawnBullet("smallbullet", bullet.x, bullet.y +30, angle + 0.6, 7)

             			local bullet2 = self:spawnBullet("smallbullet", bullet.x, bullet.y+ 30, angle -0.6, 7)

             			bullet2:setLayer(self.layer + 0.01)
             			                                     			wait(1/3)

             			bullet.graphics.grow = 0.15
             			wait(1)
             			bullet.graphics.grow = 0
             			bullet:fadeOutAndRemove(0.1)
        end)
        end)



end

function muteWalls:update()
    

    super:update(self)
end

return muteWalls