local spam, super = Class(Wave)

function spam:init()
	super:init(self)

	self.time = 5
end

function spam:onStart()
    self.timer:every(14/15, function()
        local x = Utils.random(Game.battle.arena.left, Game.battle.arena.right)
        local y = Utils.random(Game.battle.arena.bottom, Game.battle.arena.bottom + 30)

         local angle = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)



        self:spawnBullet("smallbullet", x, y, angle, 7)
    end)
end

return spam