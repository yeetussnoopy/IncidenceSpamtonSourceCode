local roleban, super = Class(Wave)

function roleban:init()
    super:init(self)

    -- Initialize timer
    self.siner = 100
    self.time = 11
end

function roleban:onStart()
    -- Get the arena object
    local arena = Game.battle.arena



    -- Spawn spikes on top of arena
   --self:spawnBulletTo(Game.battle.arena, "arenahazard", arena.width/2, 0, math.rad(0))

    -- Spawn spikes on bottom of arena (rotated 180 degrees)
    --self:spawnBulletTo(Game.battle.arena, "arenahazard", arena.width/2, arena.height, math.rad(180))
    
    -- spawn spikes on left of arena
   self:spawnBulletTo(Game.battle.arena, "arenahazard", 0, arena.height/2, math.rad(270))

      --spawn spikes on right of arena
      self:spawnBulletTo(Game.battle.arena, "arenahazard", arena.width, arena.height/2, math.rad(90))

                self:spawnBullet("rolebanHazard", arena.x, arena.y + 30, math.rad(0))

              self:spawnBullet("rolebanHazard", arena.x, arena.y - 200, math.rad(0))





    -- Store starting arena position
    self.arena_start_x = arena.x
    self.arena_start_y = arena.y

     self.timer:every(1/2, function()
            -- Get all enemies that selected this wave as their attack
            local attackers = self:getAttackers()
    
            -- Loop through all attackers
            for _, attacker in ipairs(attackers) do

                -- Get the attacker's center position
                local x, y = attacker:getRelativePos(attacker.width/2, attacker.height/2)

                -- Get the angle between the bullet position and the soul's position
                local angle = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)

                -- Spawn smallbullet angled towards the player with speed 8 (see scripts/battle/bullets/smallbullet.lua)
                --self:spawnBullet("smallbullet", x, y, angle, 8)
            end
        end)
end

function roleban:update()
    -- Increment timer for arena movement
    self.siner = self.siner + DT

    -- Calculate the arena Y offset
    local offset = math.sin(self.siner * 1.5) * 80

    -- Move the arena
   -- Game.battle.arena:setPosition(self.arena_start_x, self.arena_start_y + offset)

        Game.battle.arena:setPosition(self.arena_start_x, self.arena_start_y - offset)



    super:update(self)
end

return roleban