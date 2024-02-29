local SmallBullet, super = Class(Bullet)

function SmallBullet:init(x, y, dir, speed, rotation, scale)
    -- Last argument = sprite path
    if Game:getFlag("bulletToggleCustom") then
        super:init(self, x, y, "bullets/supportLock_alt")
      else
        super:init(self, x, y, "bullets/supportLock")
  
       end
    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed

   self.sprite:setScale(scale, scale)

       self.rotation = rotation
      
           self:setHitbox(0, 0, self.sprite.width*scale, self.sprite.height*scale)

end

function SmallBullet:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super:update(self)
end

return SmallBullet