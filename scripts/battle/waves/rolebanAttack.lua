local rolebanAttack, super = Class(Wave)

function rolebanAttack:init()
    super:init(self)

    -- Initialize timer
    self.time = 11


                    self.fart = 0

                     self.roleban1 = self:spawnSprite("bullets/rolebanHazard", 322 , 70)
                    self.roleban1.rotation = math.rad(0)
                    self.roleban1:setScale(0.8)
                    self.roleban1.layer = BATTLE_LAYERS["above_bullets"]
end

function rolebanAttack:onStart()
    -- Get the arena object
    local arena = Game.battle.arena



    -- Spawn spikes on top of arena
   --self:spawnBulletTo(Game.battle.arena, "arenahazard", arena.width/2, 0, math.rad(0))

    -- Spawn spi~kes on bottom of arena (rotated 180 degrees)
    --self:spawnBulletTo(Game.battle.arena, "arenahazard", arena.width/2, arena.height, math.rad(180))
    
    -- spawn spikes on left of arena
   --self:spawnBulletTo(Game.battle.arena, "arenahazard", 0, arena.height/2, math.rad(270))

      --spawn spikes on right of arena
      --self:spawnBulletTo(Game.battle.arena, "arenahazard", arena.width, arena.height/2, math.rad(90))

                --self:spawnBullet("rolebanHazard", arena.x, arena.y + 30, math.rad(0))


        arena:setSize(300, 100)








--[[local roleban2 = self:spawnSprite("bullets/rolebanHazard", 322 , 356)
roleban2.rotation = math.rad(0)
roleban2:setScale(1.6)]]

--roleban1.layer = BATTLE_LAYERS["above_bullets"]


             -- self:spawnBullet("rolebanHazard", arena.x, arena.y - 200, math.rad(0))





    -- Store starting arena position

     self.timer:every(3/8, function()
            -- Get all enemies that selected this wave as their attack

            -- Loop through all attackers

                -- Get the attacker's center position

                -- Get the angle between the bullet position and the soul's position


                        -- Get a random Y p~osition between the top and the bottom of the arena
                       local x = Utils.random(Game.battle.arena.left, Game.battle.arena.right)
                            local tx = Utils.random(Game.battle.arena.left, Game.battle.arena.right)

                               local y = SCREEN_HEIGHT +80

                               local ty = SCREEN_HEIGHT - 80


                -- Spawn smallbullet angled towards the player with speed 8 (see scripts/battle/bullets/smallbullet.lua)
                local bullet = self:spawnBullet("yeetHead", x, y, math.rad(270), 12)
                                --local bullet2 = self:spawnBullet("smallbullet", tx, ty, math.rad(90), 12)


                        bullet.remove_offscreen = false
                        --bullet2.remove_offscreen = false

        end)
end

function rolebanAttack:update()

    super:update(self)


    self.fart = self.fart + (1 * DTMULT)
    self.roleban1.x = 322 + (math.sin(self.fart * 0.08) * 50)
    self.roleban1.y = 200 + (math.sin(self.fart * 0.04) * 50)
    self.roleban1.rotation=math.rad(10*math.sin(self.fart * 0.08) * 1.2)





    super:update(self)
end

return rolebanAttack