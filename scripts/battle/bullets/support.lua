local SmallBullet, super = Class(Bullet)

function SmallBullet:init(x, y, dir, speed)
    -- Last argument = sprite path
    if Game:getFlag("bulletToggleCustom") then
        super:init(self, x, y, "bullets/support_alt")
      else
        super:init(self, x, y, "bullets/support")
  
       end	
    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed

    self.collider = Hitbox(self, self.width/4, self.height/4, self.width/2, self.height/2)

end

function SmallBullet:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super:update(self)
end

return SmallBullet