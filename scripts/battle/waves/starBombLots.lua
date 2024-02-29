local starBombLots, super = Class(Wave)

function starBombLots:init()
    super:init(self)

    -- Initialize timer
    self.siner = 100
    self.time = 13

                    self.fart = 0

     self.soul_start_x = 450
                     self.soul_start_y = 250


end

function starBombLots:onStart()



    local arena = Game.battle.arena

    arena:setSize(100, 300)
            arena:setOrigin(-0.7, 0.5)

                        Assets.playSound("laugh")


                        self.encounter:setMode("shoot")


    -- Every 0.33 seconds...


    self.timer:every(2, function()
        -- Our X position is offscreen, to the right
       --local x = SCREEN_WIDTH+ 20
        -- Get a random Y position between the top and the bottom of the arena
        --local y = Utils.random(Game.battle.arena.top, Game.battle.arena.bottom)

         --local x = Utils.random(Game.battle.arena.left, Game.battle.arena.right)

          --local y = SCREEN_HEIGHT - 20

          local x = Utils.random(Game.battle.arena.left - 100, Game.battle.arena.left - 150)

          local y = Utils.random(Game.battle.arena.top + 20 , Game.battle.arena.bottom - 20)
          
           local bomb = self:spawnSprite("bullets/warning", x , y)
                              bomb.rotation = math.rad(0)
                              bomb:setScale(2)
                              bomb.layer = BATTLE_LAYERS["above_bullets"]





        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
 		self.timer:script(function(wait)

 		

        wait(1)
         Assets.playSound("bomb")

         for i = 1, 69 do
                                  local burst = RudeBusterBurst("effects/rudebuster/beam_red", bomb.x, bomb.y, math.rad(35 + ((i - 1) * 32)), i > 17)
                                 burst.layer = bomb.layer + (0.01 * i)
                                      bomb.parent:addChild(burst)
                                           end

bomb.graphics.grow = 0

 			bomb:fadeOutAndRemove(0.2)


             local bullet = self:spawnBullet("smallbullet", x, y, math.rad(180), 20)




             local bullet2 = self:spawnBullet("wallBomb", bullet.x, bullet.y, math.rad(0), 11)

         		



        -- Dont remove the bullet offscreen, because we spawn it offscreen
        bullet.remove_offscreen = false

        bullet.graphics.grow = 0.2
                         			bullet:fadeOutAndRemove(0.2)

        end)
    end)

    self.timer:every(4.5, function()

        self.timer:script(function(wait)



    local x = Game.battle.soul.x
    local y = Game.battle.soul.y

     local angle = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)

     local bomb = self:spawnSprite("bullets/warning", x , y)
                                   bomb.rotation = math.rad(0)
                                   bomb:setScale(1)
                                   bomb.layer = BATTLE_LAYERS["above_bullets"]

                                                                        wait(1)


     --bullet.rotation


                                 Assets.playSound("bomb")

         --[[local bullet = self:spawnBullet("supportLock", bomb.x - 100, bomb.y, math.rad(0), 12, math.rad(0), 0.9)
        local bullet = self:spawnBullet("supportLock", bomb.x  + 100, bomb.y, math.rad(180), 12, math.rad(0), 0.9)
        local bullet = self:spawnBullet("supportLock", bomb.x, bomb.y - 100, math.rad(90), 12, math.rad(90), 0.9)
        local bullet = self:spawnBullet("supportLock", bomb.x , bomb.y + 100, math.rad(270), 12, math.rad(270), 0.9)]]
        
              local bullet1 = self:spawnBullet("supportLock", bomb.x + 300, bomb.y + 300, math.rad(225), 14, math.rad(0), 0.6)
               local      bullet2 = self:spawnBullet("supportLock", bomb.x + 300, bomb.y - 300, math.rad(135), 14, math.rad(0), 0.6)
               local      bullet3 = self:spawnBullet("supportLock", bomb.x - 300, bomb.y + 300, math.rad(315), 14, math.rad(0), 0.6)
                    local bullet4 = self:spawnBullet("supportLock", bomb.x - 300, bomb.y - 300, math.rad(45), 14, math.rad(0), 0.6)
bullet1.remove_offscreen = false
bullet1.destroy_on_hit = false
bullet2.remove_offscreen = false
bullet2.destroy_on_hit = false
bullet3.remove_offscreen = false
bullet3.destroy_on_hit = false
bullet4.remove_offscreen = false
bullet4.destroy_on_hit = false

for i = 1, 20 do
                              local burst = RudeBusterBurst("effects/rudebuster/beam_red", bomb.x, bomb.y, math.rad(30 + ((i - 1) * 30)), i > 3)
                             burst.layer = bomb.layer + (0.01 * i)
                                  bomb.parent:addChild(burst)
                                     end

bomb.graphics.grow = 0
         bomb:fadeOutAndRemove(0.2)




end)

end)


end

function starBombLots:update()


    super:update(self)
end

return starBombLots