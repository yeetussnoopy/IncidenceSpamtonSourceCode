local muteCycleEasy, super = Class(Wave)

function muteCycleEasy:init()
    super:init(self)

    -- Initialize timer
    self.siner = 100
    self.time = 11



end

function muteCycleEasy:onStart()
local arena = Game.battle.arena

        arena:setSize(120, 90)


    -- Every 0.33 seconds...
    self.timer:every(2, function()
        -- Our X position is offscreen, to the right
       local x = SCREEN_WIDTH - 150
        -- Get a random Y position between the top and the bottom of the arena
        --local y = Utils.random(Game.battle.arena.top, Game.battle.arena.bottom)

         --local x = Utils.random(Game.battle.arena.left, Game.battle.arena.right)

          local y = SCREEN_HEIGHT - 20

     local tx = SCREEN_WIDTH - 480






        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local bullet = self:spawnBullet("mute", x, y, math.rad(270), 10, math.rad(0))

                --local bullet = self:spawnBullet("mute", tx, y, math.rad(270), 10, math.rad(180))


          local angle = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)

        self.timer:script(function(wait)
         			wait(5/7)

                         local bullet = self:spawnBullet("mute", tx, y, math.rad(270), 10, math.rad(180))
                         wait(5/7)

         			end)


    end)
end

function muteCycleEasy:update()
    -- Code here gets called every frame

    super:update(self)
end

return muteCycleEasy