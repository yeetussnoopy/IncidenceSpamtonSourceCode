local pipisSpam, super = Class(Wave)

function pipisSpam:init()
    super:init(self)

    -- Initialize timer
    self.time = 11


    self.encounter:setMode("right")


end

function pipisSpam:onStart()
    -- Every 0.33 seconds...

    local fard = 0
    self.timer:every(1/7, function()
        -- Our X position is offscreen, to the right
       --local x = SCREEN_WIDTH+ 20
        -- Get a random Y position between the top and the bottom of the arena
        --local y = Utils.random(Game.battle.arena.top, Game.battle.arena.bottom)

        -- local x = Utils.random(Game.battle.arena.left, Game.battle.arena.right)
        fard = fard + 5


          local x =  SCREEN_WIDTH - 600

          --local x =  SCREEN_WIDTH - 540 + (math.sin(4 * 0.08) * 5)

          --local ty = Utils.random(Game.battle.arena.top, Game.battle.arena.bottom)

          local ty = SCREEN_HEIGHT - 350 + (math.sin(fard * 0.10) * 50)

                    local y = SCREEN_HEIGHT - 250 + (math.sin(fard * 0.10) * 50)


           local tx = SCREEN_WIDTH - 20


        local bullet1 = self:spawnBullet("smallbullet", x, ty, math.rad(0), 10)

        local bullet2 = self:spawnBullet("smallbullet", tx, y, math.rad(180), 10)


        -- Dont remove the bullet offscreen, because we spawn it offscreen
        bullet1.remove_offscreen = false

        bullet1.destroy_on_hit = false

         bullet2.remove_offscreen = false

                    bullet2.destroy_on_hit = false
    end)


    self.timer:every(1.5, function()


             			 local x = Utils.random(Game.battle.arena.left - 100, Game.battle.arena.right + 100)
                                local y = Utils.random(Game.battle.arena.top -60, Game.battle.arena.top - 80)

                                 local angle = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)
                                     Assets.playSound("bluh")

Game.battle.camera:shake(5)
 			 			local bullet2 = self:spawnBullet("yeetHead", x, y, angle, 7, angle, 1)





             			end)
end

function pipisSpam:update()
    -- Code here gets called every frame

    super:update(self)
end


return pipisSpam