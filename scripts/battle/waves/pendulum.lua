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

        arena:setSize(250, 80)


    -- Every 0.33 seconds...
    self.timer:every(1, function()
        -- Our X position is offscreen, to the right
       --local x = SCREEN_WIDTH+ 20
        -- Get a random Y position between the top and the bottom of the arena

        Assets.playSound("noise")

        local y = Utils.random(Game.battle.arena.top - 150, Game.battle.arena.top - 150)

         local x = Utils.random(Game.battle.arena.left + 10, Game.battle.arena.right -10)


          --local y = SCREEN_HEIGHT  -30





        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local bullet = self:spawnBullet("head_rotation", x, y, math.rad(90), 9)



    end)
end

    function pendulum:update()
    -- Code here gets called every frame

    super:update(self)
end

return pendulum