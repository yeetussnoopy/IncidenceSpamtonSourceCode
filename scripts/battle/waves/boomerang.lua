local Boomerang, super = Class(Wave)

function Boomerang:init()
    super:init(self)
    self.time = 11
end

function Boomerang:onStart()
    -- Every 0.5 seconds...

	Assets.playSound("weWon")

	local arena = Game.battle.arena


	self.encounter:setMode("shoot")
	arena:setSize(160, 160)

	arena:setOrigin(0.5, 0.20)


	
		self.timer:every(1.4, function()
		
			   local y = Utils.random(Game.battle.arena.top + 20 , Game.battle.arena.bottom - 20)

				local angle = Utils.angle(700, y, Game.battle.soul.x, Game.battle.soul.y)

				-- Spawn smallbullet angled towards the player with speed 8 (see scripts/battle/bullets/ssmallbullet.lua)
				Assets.playSound("wing")

				local bullet = self:spawnBullet("boomerang", 700, y, angle, 14)
				bullet.remove_offscreen = false

			end)

			self.timer:every(3, function()
				local x = Utils.random(Game.battle.arena.left - 50, Game.battle.arena.right + 100)
				local y = Utils.random(Game.battle.arena.top - 70, Game.battle.arena.top - 70)
		
				 
				
				
				
				
				
				
				
				local angle = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)
		
		
					-- Loop through all attackers
		
						   -- Get the attacker's center position
						   --local x, y = attacker:getRelativePos(attacker.width/2, attacker.height/2)
		
							local wireheart = self:spawnSprite("bullets/wireheart", x , y - 80)
		
							wireheart:slideTo(x, y - 10, 0.5)
		
									 local angle1 = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)
		
							   wireheart.rotation = angle1
							   wireheart:setScale(3)
							   wireheart.shake_x = 5
							   wireheart.shake_y = 5
		
		
		
								 Assets.playSound("vineboom")
		
								 self:spawnBullet("smallbullet", x , y -  30 , angle1, 6)
										 self:spawnBullet("smallbullet", x , y  -30 , angle1 - 0.25, 6)
									  self:spawnBullet("smallbullet", x , y - 30 , angle1  +0.25, 6)
								 
		
		
							 --self:spawnBullet("yeetHead", x - 50, randY, angle1, 5)
		
							   --self:spawnBullet("yeetHead", x - 50, randY, angle1, 5)
		
							  self.timer:script(function(wait)
								wait(1.2)

		
		
		local alphafx = wireheart:addFX(AlphaFX(1))
		Game.world.timer:tween(1, alphafx, {alpha = 0})


		wait(2.5)


		wireheart:remove()		
	
	end)
end)
end

function Boomerang:update()
    -- Code here gets called every frame

    super:update(self)
end

return Boomerang
