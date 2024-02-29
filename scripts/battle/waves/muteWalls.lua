local muteWalls, super = Class(Wave)

function muteWalls:init()
    super:init(self)
    self.time=13
end

function muteWalls:onStart()
    Game.battle.arena:setSize(300, 200)
    local arena = Game.battle.arena
    arena:setOrigin(0.5, 0.2)

                    self.encounter:setMode("right")
                                                                 Assets.playSound("laugh")


    
    self.timer:every(2, function()
        
        local x = SCREEN_WIDTH
        
        local y = Utils.random(Game.battle.arena.top-10, 0)

        
        local bullet = self:spawnBulletTo(Game.battle.arena.mask, "mute", x, y + 30, math.rad(180), 8, math.rad(90), 0.5)
                local bullet2 = self:spawnBulletTo(Game.battle.arena.mask, "mute", bullet.x, bullet.y+bullet.width + 50, math.rad(180), 8, math.rad(90),  0.5)

        
        bullet.remove_offscreen = false
        bullet.destroy_on_hit = false
        bullet2.remove_offscreen = false
        bullet2.destroy_on_hit = false

    end)

    self.timer:every(1.5, function()

     local tx = Utils.random(Game.battle.arena.left - 100, Game.battle.arena.right + 100)
            local ty = Utils.random(Game.battle.arena.top -20, Game.battle.arena.top - 70)

             local angle = Utils.angle(tx, ty, Game.battle.soul.x, Game.battle.soul.y)


         			         local bullet = self:spawnSprite("bullets/wireheart", tx , ty - 50)



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