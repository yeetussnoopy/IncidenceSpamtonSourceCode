local multiAttackYeet, super = Class(Wave)

function multiAttackYeet:init()
	super:init(self)

	self.time = 7
end

function multiAttackYeet:onStart()
            self.timer:every(14/15, function()
        local x = Utils.random(Game.battle.arena.left - 100, Game.battle.arena.right + 100)
        local y = Utils.random(Game.battle.arena.top -20, Game.battle.arena.top - 70)

         local angle = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)

         --bullet.rotation

     local bullet = self:spawnBullet("smallbullet", x, y)
 		self.timer:script(function(wait)
 			wait(1/3)
 			bullet.targeting = false
 			bullet.graphics.grow = 0.3
 			wait(1/3)
 			local bullet2 = self:spawnBullet("yeetHead", bullet.x, bullet.y, angle, 7)
 	        local bullet2 = self:spawnBullet("yeetHead", bullet.x, bullet.y, angle+ 0.2, 7)

 			local bullet2 = self:spawnBullet("yeetHead", bullet.x, bullet.y, angle -0.2, 7)

 			local bullet2 = self:spawnBullet("yeetHead", bullet.x, bullet.y, angle + 0.4, 7)

 			local bullet2 = self:spawnBullet("yeetHead", bullet.x, bullet.y, angle -0.4, 7)

 			bullet2:setLayer(self.layer + 0.01)
 			wait(1/4)
 			bullet.graphics.grow = 0
 			bullet:fadeOutAndRemove(0.2)




       --self:spawnSprite("bullets/wireheart", x, y, math.rad(180))
      -- self.rotation = Utils.angle(self.x, self.y, Game.battle.soul.x, Game.battle.soul.y)

        --self:spawnBullet("smallbullet", x, y, angle, 2)


end)


    end)
end

return multiAttackYeet