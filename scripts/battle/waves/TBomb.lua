local TBomb, super = Class(Wave)

function TBomb:init()
	super:init(self)

	self.time = 7
end

function TBomb:onStart()
            self.timer:every(5/15, function()
        local x = Utils.random(Game.battle.arena.left - 50, Game.battle.arena.right + 50)
        local y = Utils.random(Game.battle.arena.top -20, Game.battle.arena.bottom - 20)

         local angle = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)

         --bullet.rotation

     local bullet = self:spawnBullet("smallbullet", x, y)
 		self.timer:script(function(wait)
 			wait(1/3)
 			bullet.targeting = true
 			--bullet.graphics.grow = 0.4
 			wait(1/3)
 			local bullet2 = self:spawnBullet("yeetHead", bullet.x, bullet.y, math.rad(0), 5)
 			 local bullet2 = self:spawnBullet("yeetHead", bullet.x, bullet.y, math.rad(270), 5)

 			local bullet2 = self:spawnBullet("yeetHead", bullet.x, bullet.y, math.rad(90), 5)

 			local bullet2 = self:spawnBullet("yeetHead", bullet.x, bullet.y, math.rad(180), 5)

 			bullet2:setLayer(self.layer + 0.01)
 			wait(1/4)
 			bullet.graphics.grow = 0.2
 			bullet:fadeOutAndRemove(0.2)




       --self:spawnSprite("bullets/wireheart", x, y, math.rad(180))
      -- self.rotation = Utils.angle(self.x, self.y, Game.battle.soul.x, Game.battle.soul.y)

        --self:spawnBullet("smallbullet", x, y, angle, 2)


end)


    end)
end

return TBomb