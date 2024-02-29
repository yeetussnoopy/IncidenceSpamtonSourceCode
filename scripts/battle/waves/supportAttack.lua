local supportAttack, super = Class(Wave)

function supportAttack:init()
    super:init(self)

    -- Initialize timer
    self.siner = 100
    self.time = 12
    self.soul_start_x = 176
                self.soul_start_y = 177

                self.fart = 0

                self.roleban1 = self:spawnSprite("bullets/rolebanHazardMari", 322 , 70)
               self.roleban1.rotation = math.rad(0)
               self.roleban1:setScale(0.95)
               self.roleban1.layer = BATTLE_LAYERS["above_bullets"]

end

function supportAttack:onStart()

    local arena = Game.battle.arena

    arena:setSize(150, 200)
    self.encounter:setMode("right")
    arena:setOrigin(1.5, 0.5)



    -- Every 0.33 seconds...
    self.timer:every(4/7, function()
        -- Our X position is offscreen, to the right
       --local x = SCREEN_WIDTH+ 20
        -- Get a random Y position between the top and the bottom of the arena
        --local y = Utils.random(Game.battle.arena.top, Game.battle.arena.bottom)

         --local x = Utils.random(Game.battle.arena.left, Game.battle.arena.right)

          --local y = SCREEN_HEIGHT - 20

          local x = SCREEN_WIDTH  -20

          local y = Utils.random(Game.battle.arena.top, Game.battle.arena.bottom)





        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local bullet = self:spawnBullet("support", x, y, math.rad(180), 15)

    end)

    self.timer:every(2.3, function()
        -- Our X position is offscreen, to the right
       --local x = SCREEN_WIDTH+ 20
        -- Get a random Y position between the top and the bottom of the arena

        Assets.playSound("noise")

        local y = Utils.random(Game.battle.arena.top - 150, Game.battle.arena.top - 150)

         local x = Utils.random(Game.battle.arena.left - 50, Game.battle.arena.right -200)


          --local y = SCREEN_HEIGHT  -30





        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local bullet = self:spawnBullet("head_rotation", x, y, math.rad(90), 10)



    end)
end

function supportAttack:update()
    -- Code here gets called every frame

    self.fart = self.fart + (1 * DTMULT)
    self.roleban1.x = 434 + (math.sin(self.fart * 0.08) * 30)
    self.roleban1.y = 170 + (math.sin(self.fart * 0.04) * 100)
    self.roleban1.rotation=math.rad(10*math.sin(self.fart * 0.08) * 1.2)

    super:update(self)
end

return supportAttack