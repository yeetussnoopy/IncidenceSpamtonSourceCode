local mariNeoFinal, super = Class(Wave)

function mariNeoFinal:init()
	super:init(self)

	self.time = 33

	    self.soul_start_x = 320
                self.soul_start_y = 250
                            self.encounter:setMode("up")

                            --self.encounter.background = true


end

function mariNeoFinal:onStart()

local arena = Game.battle.arena

arena:setSize(100, 100)
arena:setOrigin(0.5, -0.3)

        self.timer:script(function(wait)


       -- self.sNeo.sprite:slideTo(250, -350, 4)

    gun_phase = self.timer:every(9/15, function()
        local x = Utils.random(Game.battle.arena.left - 50, Game.battle.arena.right + 100)
        local y = Utils.random(Game.battle.arena.top - 70, Game.battle.arena.top - 70)

         local angle = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)


            -- Loop through all attackers

                   -- Get the attacker's center position
                   --local x, y = attacker:getRelativePos(attacker.width/2, attacker.height/2)

                   self.timer:script(function(wait)


                    local wireheart = self:spawnSprite("bullets/wireheart", x , y - 80)

                    wireheart:slideTo(x, y - 10, 0.5)

                             local angle1 = Utils.angle(x, y, Game.battle.soul.x, Game.battle.soul.y)

                       wireheart.rotation = angle1
                       wireheart:setScale(3)
                       wireheart.shake_x = 5
                       wireheart.shake_y = 5



                         Assets.playSound("vineboom")

                         self:spawnBullet("smallbullet", x , y -  30 , angle1, 10)
                                 self:spawnBullet("smallbullet", x , y  -30 , angle1 - 0.2, 10)
                              self:spawnBullet("smallbullet", x , y - 30 , angle1  +0.2, 10)
              


wait(1.2)

wireheart:explode()
                   end)
end)


wait(7)
self.timer:cancel(gun_phase)

        wait(1)

        arena:setSize(220, 220)
        arena:setOrigin(0.5, 0.5)

                self.encounter:setMode("right")
                                                             Assets.playSound("laugh")

                                                             Game.battle.soul.x = 316
                                                             Game.battle.soul.y = 175
        

phase_2_bombs = self.timer:every(3.5, function()
        -- Our X position is offscreen, to the right
       --local x = SCREEN_WIDTH+ 20
        -- Get a random Y position between the top and the bottom of the arena
        --local y = Utils.random(Game.battle.arena.top, Game.battle.arena.bottom)

         --local x = Utils.random(Game.battle.arena.left, Game.battle.arena.right)

          --local y = SCREEN_HEIGHT - 20

          local x = Utils.random(Game.battle.arena.left, Game.battle.arena.right)

          local y = Utils.random(Game.battle.arena.top, Game.battle.arena.bottom)
          
           local bomb = self:spawnSprite("bullets/warning", x , y)
                              bomb.rotation = math.rad(0)
                              bomb:setScale(1)
                              bomb.layer = BATTLE_LAYERS["above_bullets"]





        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
 		self.timer:script(function(wait)

 		

        wait(1)
         Assets.playSound("scytheburst")

         for i = 1, 20 do
                                  local burst = RudeBusterBurst("effects/rudebuster/beam_red", bomb.x, bomb.y, math.rad(70 + ((i - 1) * 70)), i > 9)
                                 burst.layer = bomb.layer + (0.01 * i)
                                      bomb.parent:addChild(burst)
                                           end

bomb.graphics.grow = 0
 			bomb:fadeOutAndRemove(0.2)


                local bullet = self:spawnBullet("smallbullet", x, y, math.rad(180), 20)




         			local bullet2 = self:spawnBullet("smallbullet", bullet.x, bullet.y, math.rad(0), 10)
         			 local bullet2 = self:spawnBullet("smallbullet", bullet.x, bullet.y, math.rad(270), 10)
        
         			local bullet2 = self:spawnBullet("smallbullet", bullet.x, bullet.y, math.rad(90), 10)

         			local bullet2 = self:spawnBullet("smallbullet", bullet.x, bullet.y, math.rad(180), 10)

         			local bullet2 = self:spawnBullet("smallbullet", bullet.x, bullet.y, math.rad(45), 10)
                             			 local bullet2 = self:spawnBullet("smallbullet", bullet.x, bullet.y, math.rad(135), 10)

                             			local bullet2 = self:spawnBullet("smallbullet", bullet.x, bullet.y, math.rad(225), 10)

                             			local bullet2 = self:spawnBullet("smallbullet", bullet.x, bullet.y, math.rad(315), 10)




        -- Dont remove the bullet offscreen, because we spawn it offscreen
        bullet.remove_offscreen = false

        bullet.graphics.grow = 0.2
                         			bullet:fadeOutAndRemove(0.2)

        end)
    end)
      

      phase_2_boomerang = self.timer:every(2.7, function()
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

        phase_2_strings= self.timer:every(2.5, function()
             
                Assets.playSound("noise")
        

                local y = Utils.random(Game.battle.arena.top - 100, Game.battle.arena.top - 100)

                local x = Utils.random(Game.battle.arena.left + 10, Game.battle.arena.right -10)
       
                local bullet = self:spawnBullet("head_rotation", x, y, math.rad(90), 11)
        
            end)

        wait(10)
        self.timer:cancel(phase_2_bombs)
        self.timer:cancel(phase_2_boomerang)
        self.timer:cancel(phase_2_strings)


                wait(3)

                local arena = Game.battle.arena

                arena:setSize(200, 300)
                        arena:setOrigin(-0.4, 0.5)

                        Game.battle.soul.x = 450
                        Game.battle.soul.y = 250
            
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
            
                self.timer:every(3, function()
            
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


    end)
end

function mariNeoFinal:onEnd()
    self.encounter:setMode("normal")
    super:onEnd()
end


return mariNeoFinal