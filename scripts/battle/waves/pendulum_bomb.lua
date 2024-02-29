local pendulum, super = Class(Wave)

function pendulum:init()
    super:init(self)

    -- Initialize timer
    self.siner = 100
    self.time = 14



end

function pendulum:onStart()

    self.encounter:setMode("shoot")

local arena = Game.battle.arena

        arena:setSize(190, 190)

                        arena:setOrigin(0.5, 0.1)



    -- Every 0.33 seconds...
    self.timer:every(1.8, function()
        -- Our X position is offscreen, to the right
       --local x = SCREEN_WIDTH+ 20
        -- Get a random Y position between the top and the bottom of the arena

        Assets.playSound("noise")

        local y = Utils.random(Game.battle.arena.top - 150, Game.battle.arena.top - 150)

         local x = Utils.random(Game.battle.arena.left + 10, Game.battle.arena.right -10)


          --local y = SCREEN_HEIGHT  -30





        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local bullet = self:spawnBullet("head_rotation", x, y, math.rad(90), 10)



    end)

    self.timer:every(4, function()
			-- Get all enemies that selected this wave as their attack

			-- Loop through all attackers

				-- Get the attacker's center position

				-- Get the angle between the bullet position and the soul's position
			   local y = Utils.random(Game.battle.arena.top + 20 , Game.battle.arena.bottom - 20)

				local angle = Utils.angle(700, y, Game.battle.soul.x, Game.battle.soul.y)

				-- Spawn smallbullet angled towards the player with speed 8 (see scripts/battle/bullets/ssmallbullet.lua)
				Assets.playSound("wing")

				local bullet = self:spawnBullet("boomerang", 700, y, angle, 14)
				bullet.remove_offscreen = false

			end)
end

    function pendulum:update()
    -- Code here gets called every frame

    super:update(self)
end

return pendulum