local wallBomb, super = Class(Bullet)

function wallBomb:init(x, y, dir, speed)

	if Game:getFlag("bulletToggleCustom") then
        super:init(self, x, y, "bullets/picnic_basket")
      else
        super:init(self, x, y, "bullets/head_throw")
  
       end	
	   
	   self.fart = 0
	self.rotation = math.rad(0)

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed
	self.destroy_on_hit = true
end

function wallBomb:update()
    -- For more complicated bullet behaviours, code here gets called every update
	self.fart = self.fart + (1 * DTMULT)
    self.rotation=math.rad(5*math.cos(self.fart * 0.08) * 5)
--Game.battle.arena.right  + 280

	if self.x > SCREEN_WIDTH  then
		Game.battle.camera:shake(5)                         
		Assets.playSound("splat")
		local x, y = self:getRelativePos(self.width/2, self.height/2, Game.battle)
		local star1 = self.wave:spawnBullet("starBullet", x, y, math.rad(180), 8)
		local star2 = self.wave:spawnBullet("starBullet", x, y, math.rad(145), 8)
		local star3 = self.wave:spawnBullet("starBullet", x, y, math.rad(-145), 8)
		local star4 = self.wave:spawnBullet("starBullet", x, y, math.rad(165), 8)
		local star5 = self.wave:spawnBullet("starBullet", x, y, math.rad(-165), 8)
		self:explode()
	end

    super:update(self)
end

return wallBomb
