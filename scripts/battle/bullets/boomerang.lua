local Boomerang, super = Class(Bullet)

function Boomerang:init(x, y, dir, speed)
    -- Last argument = sprite path
	if Game:getFlag("bulletToggleCustom") then
        super:init(self, x, y, "bullets/boomerang_alt")
      else
        super:init(self, x, y, "bullets/boomerang")
  
       end	
    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed
	self.physics.friction = 0.18
	self.returning = false

	self.sprite:setScale(0.8, 0.8)


	self.fart = 0
	self.rotation = math.rad(0)

end

function Boomerang:update()
    -- For more complicated bullet behaviours, code here gets called every update
	if self.physics.speed == 0 then
		self.physics.direction = self.physics.direction - math.rad(180)
		self.physics.speed = 1
		self.physics.friction = -0.2
		self.returning = true
	end

	if self.x > 650 and self.returning == true then
		self:remove()
	end

	self.fart = self.fart + (1 * DTMULT)
   self.rotation = math.rad(30*math.cos(self.fart * 0.11) * 10)

    super:update(self)
end

return Boomerang
