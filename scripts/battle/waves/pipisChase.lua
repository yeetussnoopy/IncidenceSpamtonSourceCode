local pipisChase, super = Class(Wave)

function pipisChase:onStart()

    local x = math.random()<0.5 and 0 or SCREEN_WIDTH
    local y = Utils.random(0, SCREEN_HEIGHT)

   
    local angle = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)
    local speed = Utils.dist(x, y, Game.battle.soul.x, Game.battle.soul.y)

    
    self:spawnBullet("chaser", x, y, angle, speed)
end

function pipisChase:update()
    

    super:update(self)
end



return pipisChase