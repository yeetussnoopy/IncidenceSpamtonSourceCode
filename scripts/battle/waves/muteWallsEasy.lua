local muteWalls, super = Class(Wave)

function muteWalls:init()
    super:init(self)
    self.time=12
end

function muteWalls:onStart()
    Game.battle.arena:setSize(300, 200)
                    self.encounter:setMode("right")

    
    self.timer:every(0.5, function()
        
        local x = SCREEN_WIDTH
        
        local y = Utils.random(Game.battle.arena.top-10, 0)

        
        local bullet = self:spawnBulletTo(Game.battle.arena.mask, "mute", x, y + 30, math.rad(180), 8, math.rad(90), 0.5)
                local bullet2 = self:spawnBulletTo(Game.battle.arena.mask, "mute", bullet.x, bullet.y+bullet.width + 50, math.rad(180), 8, math.rad(90),  0.5)

        
        bullet.remove_offscreen = false
        bullet.destroy_on_hit = false
        bullet2.remove_offscreen = false
        bullet2.destroy_on_hit = false
    end)



end

function muteWalls:update()
    

    super:update(self)
end

return muteWalls