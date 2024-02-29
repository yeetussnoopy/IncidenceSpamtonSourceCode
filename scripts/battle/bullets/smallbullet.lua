local SmallBullet, super = Class(Bullet)

function SmallBullet:init(x, y, dir, speed)
    -- Last argument = sprite path

    if Game:getFlag("bulletToggleCustom") then
      super:init(self, x, y, "bullets/smallbullet_alt")
    else
      super:init(self, x, y, "bullets/smallbullet")

     end
                    self.fart = 0
                                            self.rotation = math.rad(0)

                                           -- Game:getFlag("bulletToggleCustom")

                   



    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed
end

function SmallBullet:update()
    -- For more complicated bullet behaviours, code here gets called every update
  self.fart = self.fart + (1 * DTMULT)
    self.rotation=math.rad(10*math.cos(self.fart * 0.08) * 5)

    super:update(self)
end

return SmallBullet