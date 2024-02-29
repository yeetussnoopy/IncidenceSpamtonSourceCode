local supportFlip, super = Class(Bullet)

function supportFlip:init(x, y, dir, speed)
    -- Last argument = sprite path
    if Game:getFlag("bulletToggleCustom") then
        super:init(self, x, y, "bullets/picnic_basket")
      else
        super:init(self, x, y, "bullets/head_throw")
  
       end	

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed
    
    self.scale = 0.8
    self.fart = 0
    self.rotation = math.rad(0)


    self.sprite:setScale(scale, scale)


    self:setHitbox(0, 0, self.sprite.width*self.scale - 4, self.sprite.height*self.scale)

end

function supportFlip:update()
    -- For more complicated bullet behaviours, code here gets called every update

    self.fart = self.fart + (1 * DTMULT)
    self.rotation=math.rad(5*math.cos(self.fart * 0.08) * 5)

    super:update(self)
end

return supportFlip