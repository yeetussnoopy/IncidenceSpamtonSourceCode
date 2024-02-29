local mute, super = Class(Bullet)

function mute:init(x, y, dir, speed, rotation, scale)
    -- Last argument = sprite path
    if Game:getFlag("bulletToggleCustom") then
        super:init(self, x, y, "bullets/mute_alt")
      else
        super:init(self, x, y, "bullets/mute")
  
       end
    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed

    self.sprite:setScale(scale, scale)

    self.rotation = rotation

    --self.collider = Hitbox(self, self.width/15 - 10, self.height/2 - 20, self.width/15 + 30, self.height/2  +15)

    self:setHitbox(0, 0, self.sprite.width*scale, self.sprite.height*scale)



end

function mute:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super:update(self)
end

return mute