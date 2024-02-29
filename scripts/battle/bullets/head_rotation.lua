local head_rotation, super = Class(Bullet)

function head_rotation:init(x, y, dir, speed)
    -- Last argument = sprite path
    if Game:getFlag("bulletToggleCustom") then
      super:init(self, x, y, "bullets/head_death")
    else
      super:init(self, x, y, "bullets/left")

     end	
    -- Origin point (will be rotated around it)
    self:setOrigin(0.5, 0.65)

     self.temp = Utils.random(-20, 20)

    
    self.rotation = dir + math.rad(self.temp)

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    --self.physics.direction = dir

    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed
    self.negative_speed_cap = -speed

    -- Don't destroy this bullet when it damages the player
    self.destroy_on_hit = false
    self.init_x = x
    self.init_y = y

    self.fart = 0

    self.ratio = Utils.random(-0.007, 0.007)

end

function head_rotation:update()
  -- For more complicated bullet behaviours, code here gets called every update

  super:update(self)

if self.y > Game.battle.arena:getBottom() + 30 then
  if self.physics.speed > self.negative_speed_cap then
    self.physics.speed = self.physics.speed - 0.4

    if self.y > SCREEN_HEIGHT + 80 then
    --self.remove_offscreen = true

    self:explode()
  end
  end
end
end

function head_rotation:draw()
super:draw(self)

self.fart = self.fart + (5 * DTMULT)


--love.graphics.setColor(love.math.colorFromBytes(234, 221, 202))
if Game:getFlag("bulletToggleCustom") then

  love.graphics.setColor(love.math.colorFromBytes(234, 221, 202))

else
  love.graphics.setColor(love.math.colorFromBytes(34, 134, 34))
end

love.graphics.setLineWidth(1.7)
--love.graphs.setLineHLength(50)

love.graphics.line(math.min(self.init_y + 9 - self.y + 4, 5) + 7, -math.min(self.init_x + 24 - self.x + self.fart * 3, 5) + 7, 7, 12)

self.x = self.x + self.fart * self.ratio

self.rotation = self.rotation + math.rad(self.fart * self.ratio * 0.13)
end

return head_rotation