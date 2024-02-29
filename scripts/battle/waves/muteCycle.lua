local muteCycle, super = Class(Wave)

function muteCycle:init()
    super:init(self)

    -- Initialize timer
    self.siner = 100
    self.time = 11



end

function muteCycle:onStart()
local arena = Game.battle.arena

        arena:setSize(90, 90)


    -- Every 0.33 seconds...
    self.timer:every(1.5, function()
        -- Our X position is offscreen, to the right
       local x = SCREEN_WIDTH - 150
        -- Get a random Y position between the top and the bottom of the arena
        --local y = Utils.random(Game.battle.arena.top, Game.battle.arena.bottom)

         --local x = Utils.random(Game.battle.arena.left, Game.battle.arena.right)

          local y = SCREEN_HEIGHT - 20

     local tx = SCREEN_WIDTH - 480






        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local bullet = self:spawnBullet("mute", x, y, math.rad(270), 10, math.rad(0), 1)

                --local bullet = self:spawnBullet("mute", tx, y, math.rad(270), 10, math.rad(180))


          local angle = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)

        self.timer:script(function(wait)
         			wait(4/7)
                         local bullet = self:spawnBullet("mute", tx, y, math.rad(270), 10, math.rad(180), 1)
                         wait(4/7)

         			end)

         			 local sx = SCREEN_WIDTH  -20

                              local sy = Utils.random(Game.battle.arena.top, Game.battle.arena.bottom)


         			local bullet = self:spawnBullet("support", sx, sy, math.rad(180), 10)



    end)
end

function muteCycle:update()
    -- Code here gets called every frame

    super:update(self)
end

return muteCycle