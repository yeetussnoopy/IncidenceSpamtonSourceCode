local mariNeo, super = Class(Encounter)

function mariNeo:init()
    super:init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "[voice:mari][font:omori]* DONT [Game Over]! THEN THE [Picnic] WILL RESTART!"

    -- Battle music ("battle" is rude buster)
    self.music = "nmn_placeholder"
    -- Enables the purple grid battle background
    self.background = false


    self.hide_world = false
self.tp = 100
    -- Add the dummy enemy to the encounter
   self.mariNeo = self:addEnemy("mariNeo", 470, 240)





     self.timer = 0


        self.mode = "normal"

    self.old_x = self.mariNeo.x
        self.old_y = self.mariNeo.y

        self.ease = false

        self.ease_timer = 0

        self.mariNeo.flip_x = true

        --self.mariNeo.rotation=math.rad(15*math.sin(self.timer * 0.08) * 40)

        Game.battle.party[1].flip_x = false



               self.greenlitOnce = false
               self.greenlight = false

   self.endItAll = false


self.endItAll = false

if Game:getFlag("noHit") then

    Game.battle.party[1].chara.health = 1
    Game.battle.party[1].chara.stats.health = 1

end


end

function mariNeo:onGameOver()

    Utils.hook(Game, "gameOver", function(orig, game, x, y)

    self.died = false

    Assets.playSound("bageldefeat")
        Assets.playSound("smile_death")

    Game.battle:setState("ACTIONSELECT")
    --Game.battle.arena.x = -9000 -- we really need a way to instantly destroy the arena
    Game.battle.soul:remove()
    Game.battle.soul = nil
    Game.battle.turn_count = 1
    
    Game.battle:getActiveEnemies()[1].wave_index = 0
    Game.battle:getActiveEnemies()[1].health = 3600
    
    Game.battle.encounter:setMode("normal")
    
    for _,party in ipairs(Game.battle.party) do
        party:heal(50000)
        end
    
    Game.tension = 0
    
    Game.battle.music:play("nmn_placeholder")
    end)
    end

function mariNeo:getPartyPosition(index)
if index == 1 then
    return 207, 244
else
 return super:getPartyPosition(self, index)
end
end

function mariNeo:setMode(mode)
    self.mode = mode
    self.old_x = self.mariNeo.x
    self.old_y = self.mariNeo.y
    self.ease = true
    self.ease_timer = 0
end

function mariNeo:update()
    super:update(self)

    if self.greenlit then




                 end



    if not self.mariNeo.done_state and (Game.battle:getState() ~= "TRANSITION") then
        self.timer = self.timer + (1 * DTMULT)


        local wanted_x = self.mariNeo.old_x
        local wanted_y = self.mariNeo.old_y

        if self.mode == "normal" then
            wanted_x = 470 + (math.sin(self.timer * 0.08) * 5)
            wanted_y = 217 + (math.sin(self.timer * 0.04) * 5)
            self.mariNeo.flip_x = false





        elseif self.mode == "shoot" then
            wanted_x = 120  + (math.sin(self.timer * 0.08) * 10)
            wanted_y = 180 + (math.sin(self.timer * 0.04) * 5)
            self.mariNeo.flip_x = true
            self.mariNeo:setAnimation("aim", 270)
            self.mariNeo:setAnimation("shaking")



         elseif self.mode == "right" then
                    wanted_x = 520  + (math.sin(self.timer * 0.08) * 10)
                    wanted_y = 180 + (math.sin(self.timer * 0.04) * 5)
                    self.mariNeo:setAnimation("death")
                                        self.mariNeo:setAnimation("shaking")


       elseif self.mode == "up" then
                          wanted_x = 520  + (math.sin(self.timer * 0.08) * 10)
                          wanted_y = -150 + (math.sin(self.timer * 0.04) * 5)
                          self.mariNeo:setAnimation("idle")


                      end


        if not self.ease then
            self.mariNeo.x = wanted_x
            self.mariNeo.y = wanted_y
            self.mariNeo.rotation=math.rad(10*math.sin(self.timer * 0.08) * 1.2)

            self.mariNeo.rotation=math.rad(10*math.cos(self.timer * 0.08) * 0.7)


        else
            self.ease_timer = self.ease_timer + (0.05 * DTMULT)
            self.mariNeo.x = Ease.outQuad(self.ease_timer, self.old_x, wanted_x - self.old_x, 1)
            self.mariNeo.y = Ease.outQuad(self.ease_timer, self.old_y, wanted_y - self.old_y, 1)
           -- self.mariNeo.rotation=math.rad(15*math.sin(self.timer * 0.08) * 40)

            if self.ease_timer >= 1 then
                self.ease = false
            end
        end
    end




end

function mariNeo:onBattleStart()
	super:onBattleStart(self)
	-- add the BGs you want to use in the battle first



end

function mariNeo:getNextWaves()
    if self.greenlit then
        Game.battle.enemies[1].selected_wave = "sad_strings"
        return {"sad_strings"}
else
local wave=super:getNextWaves(self)
        return wave
end
end

function mariNeo:getDialogueCutscene()


 local enemies = Game.battle:getActiveEnemies()


 if self.endItAll then

 return function(cutscene)
 Game:getActiveMusic():fade(0, 0.5)
 cutscene:wait(3)
 cutscene:text("(Now.)")
 Game.battle.camera:shake(10)
 Assets.playSound("dtrans_flip")
  self.mariNeo:setAnimation("death")
   self.mariNeo:setAnimation("shaking")
 cutscene:wait(1)
 cutscene:text("Shuffle out.")
 cutscene:text("Spamton engineered himself to be variable, in the face of repeated attempts to face him.")
    Assets.playSound("bell_bounce_short")
     Game.battle.camera:shake(5)
  self.mariNeo.sprite:snapStrings(1, true)
 cutscene:text("It is not unlikely that he will win if you attempt to do so again.")
  Game.battle.camera:shake(10)

 Assets.playSound("dtrans_flip")
 self.mariNeo:setAnimation("death")
 cutscene:text("There are rational explanations that can be concocted, using their incomplete information. ")

 cutscene:text("The fight against Spamton may, alternatively, be easier the second time around.")
   Assets.playSound("bell_bounce_short")
    Game.battle.camera:shake(5)
    Assets.playSound("bell_bounce_short")

  self.mariNeo.sprite:snapStrings(1, true)
 cutscene:text("The choice is yours.")
 cutscene:wait(2)
 cutscene:fadeOut(3)
 cutscene:wait(1)
   Assets.playSound("bell_bounce_short")
cutscene:wait(2)
   Assets.playSound("impact", 1, 0.5)

 cutscene:wait(3)

 cutscene:fadeIn(2)

 Game.battle:returnToWorld()


         end
         end

  if self.greenlit then

             return function(cutscene)

       cutscene:battlerText(enemies[1], "...")
end
end

 if self.greenlitOnce then

 return function(cutscene)

local kris = cutscene:getCharacter("kris")



  Game.battle.music:pause()

               -- Wait 1 second
               cutscene:wait(4)

       cutscene:battlerText(enemies[1], "[font:omori_talk]YOU SURE GOT\nSOME FIGHT HUH!")
            cutscene:battlerText(enemies[1], "[font:omori_talk]BUT IM IM FINE!")
       cutscene:battlerText(enemies[1], "[font:omori_talk]MARI\n[[Neo]] IS\n[World-Renowned] FOR\nITS INCREDIBLE\nDEFENESTRATING\nCAPABILITIES!!!")

 self.mariNeo:setAnimation("shaking")

       Assets.playSound("laugh")
             cutscene:wait(3)

       cutscene:battlerText(enemies[1], "[font:omori_talk]MY HP?")
       cutscene:battlerText(enemies[1], "[font:omori_talk]PFFT! YOU'RE\nA GLASS HALF\nEMPTY PERSON I SEE!")
       cutscene:battlerText(enemies[1], "This-")
       cutscene:battlerText(enemies[1], "It can always be more perfect!")

       cutscene:battlerText(enemies[1], "[font:omori_talk]JUST TAKE A LOOK!")





    

cutscene:wait(1)




        Game.battle.music:stop()

       self.greenlitOnce = true
        self.greenlit = true
        self.greenlitOnce = false





                --self.mariNeo.sprite:setScale(1.3)

                --Game.battle.music:play("my_time")

       end
       end

    if Game.battle.turn_count == 1 then

             return function(cutscene)

             cutscene:battlerText(enemies[1], "[font:omori_talk]ITS MY [Castle]!")
                  cutscene:battlerText(enemies[1], "[font:omori_talk]MY [[World!]]")
                  cutscene:battlerText(enemies[1], "[font:omori_talk]MY FACE\nALL OVER\nBLACKSPACE!")


         end
         end

           if Game.battle.turn_count == 2 then

                              return function(cutscene)                                

    cutscene:text("* ...")
        cutscene:text("[voice:sneo]* Is this even canon anymore?")

       cutscene:battlerText(enemies[1], "[font:omori_talk]NOPE BUT!")
       cutscene:battlerText(enemies[1], "[font:omori_talk]EVERY [Kel]\nMEME IS!")


                              end
                         end


    if Game.battle.turn_count == 3 then


            return function(cutscene)
             

                cutscene:battlerText(enemies[1], "[font:omori_talk]NOW [Leave\nthis Dream]")
                cutscene:battlerText(enemies[1], "[font:omori_talk]A PIC NIC\nPARTY JUST\nFOR US")




        end
        end



        if Game.battle.turn_count == 4 then

                    return function(cutscene)
                       
                        cutscene:battlerText(enemies[1], "[font:omori_talk]HORROR, BLOODY HELL")
                        cutscene:battlerText(enemies[1], "[font:omori_talk]SOMETHING [Behind] You?")



         end
    end

     if Game.battle.turn_count == 5 then
        return function(cutscene)

                            
                            cutscene:battlerText(enemies[1], "[font:omori_talk][heavens]\nYOU'RE\n[not][bright~]")
                            cutscene:battlerText(enemies[1], "[font:omori_talk]DID YOU KNOW?")

                             cutscene:battlerText(enemies[1], "[font:omori_talk]YOU CAN'T SPELL\n[Pain] WITHOUT\nLETTERS FROM [Piano]")

             end
        end

           if Game.battle.turn_count == 6 then


                               return function(cutscene)

                  cutscene:battlerText(enemies[1], "Wanna save?")

                  cutscene:battlerText(enemies[1], "[font:omori_talk]HAVE A\nFEW PICNIC\nBASKETS THEN!")


                     end
                end


 if Game.battle.turn_count == 7 then

      return function(cutscene)


      cutscene:battlerText(enemies[1], "[font:omori_talk]A [Hell-Mari] OF\nA TIME FOR\nTHE WHOLE")
      cutscene:battlerText(enemies[1], "[font:omori_talk]family...")

      end
      end

       if Game.battle.turn_count == 8 then


        return function(cutscene)
            cutscene:text("* It was a moving attack!")
            cutscene:text("* lol sike get trolled")


        cutscene:battlerText(enemies[1], "[font:omori_talk]YOU\nLITTLE\nHIKIOMORI")
        cutscene:battlerText(enemies[1], "[font:omori_talk]Hehehe...")



        end
        end
if Game.battle.turn_count == 9 then

        return function(cutscene)
           




                            cutscene:battlerText(enemies[1], "[font:omori_talk]2 FOR 1 DEAL")
                            cutscene:battlerText(enemies[1], "[font:omori_talk]PHOBIAS INCLUDED!")


        end
        end

    if Game.battle.turn_count == 10 then


        return function(cutscene)
            cutscene:battlerText(enemies[1], "[font:omori_talk]IS IT ME?")
            cutscene:battlerText(enemies[1], "[font:omori_talk]OR IS IT\nGETTING [Toasty]\n UP IN HERE?")



        end
        end

        if Game.battle.turn_count == 11 then

        return function(cutscene)

            
            cutscene:battlerText(enemies[1], "[font:omori_talk]SPAMTON! I THINK\nIM GOING TO\nHAVE A [Cardiac Arrest]!")
    
        end
        end

        if Game.battle.turn_count == 12 then

            return function(cutscene)    
        cutscene:battlerText(enemies[1], "[font:omori_talk]A 3.99 Discount\nOn Jumpscares!")
        cutscene:battlerText(enemies[1], "Refunds don't apply.")
        cutscene:battlerText(enemies[1], "[font:omori_talk]ITS ALL SO FUN!!!!!!")


                
        end
        end

        if Game.battle.turn_count == 13 then

            return function(cutscene)    

                cutscene:battlerText(enemies[1], "[font:omori_talk]WE'RE SHORT\nON CLAMS!")
                cutscene:battlerText(enemies[1], "[font:omori_talk]SO LET'S HEAR A\nWORD FROM\nOUR SPONSOR!")
  
            end
        end

        if Game.battle.turn_count == 14 then

            return function(cutscene)    

                cutscene:battlerText(enemies[1], "[font:omori_talk]ILL FORGIVE...")
                cutscene:battlerText(enemies[1], "[font:omori_talk]THESE HIGH PRICES!\nTALK ABOUT A ")

                cutscene:battlerText(enemies[1], "[font:omori_talk][Face]\nFOR [Face]\nvalue")
  
            end
        
        end
    
end


    

function mariNeo:beforeStateChange(old, new)


if new =="DEFENDINGEND" then

self.mode = "normal"
self.mariNeo:setAnimation("idle")



end
end



return mariNeo