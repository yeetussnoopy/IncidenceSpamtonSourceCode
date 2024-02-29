local chaser, super = Class(Bullet)

function chaser:init(x, y, dir, speed)
    
    super:init(self, x, y, "bullets/chaser")

    self.sprite:setScale(2, 2)

    self.speed = speed


    self:setHitbox(0, 0, self.sprite.width/4, self.sprite.height/4)

    self.xspeed = 0
    self.yspeed = 0

    self.destroy_on_hit=false

end

function chaser:update()
    

    -- Shameless port of one of CYF's bullettest waves xd
   local xdifference = (Game.battle.soul.x+Game.battle.soul.width*2) - self.x
       local ydifference = (Game.battle.soul.y+Game.battle.soul.height*2) - self.y
       local xspeed =  self.xspeed / 2 + xdifference / 50
       local yspeed = self.yspeed /2 + ydifference / 50
       self.x, self.y=self.x+xspeed, self.y+yspeed
       self.xspeed = xspeed
       self.yspeed = yspeed


    super:update(self)
end

return chaser