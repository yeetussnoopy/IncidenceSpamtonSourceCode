local noHitSpamtonNeo, super = Class(Encounter)

function noHitSpamtonNeo:init()
    super:init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* its no spamton no hit time"

    -- Battle music ("battle" is rude buster)
    self.music = "deadringer"
    -- Enables the purple grid battle background
    self.background = false

    self.hide_world = false

    -- Add the dummy enemy to the encounter
   self.spamtonNeo = self:addEnemy("spamtonNeo", 510, 240)

   self.customBulletToggle = false







     self.timer = 0

        self.mode = "normal"

    self.old_x = self.spamtonNeo.x
        self.old_y = self.spamtonNeo.y

        self.ease = false

        self.ease_timer = 0

        self.spamtonNeo.flip_x = false

        --self.spamtonNeo.rotation=math.rad(15*math.sin(self.timer * 0.08) * 40)

        Game.battle.party[3].flip_x = true
       -- Game.battle.party[5].flip_x = true




               self.greenlitOnce = false
               self.greenlight = false

   self.endItAll = false


self.endItAll = false

for _,battler in ipairs(Game.battle.party) do
    battler.chara.health = 1
    battler.chara.stats.health = 1
end


end

function noHitSpamtonNeo:onGameOver()

    Utils.hook(Game, "gameOver", function(orig, game, x, y)

    self.died = false

    Assets.playSound("bageldefeat")
    Game.battle:setState("ACTIONSELECT")
    --Game.battle.arena.x = -9000 -- we really need a way to instantly destroy the arena
    Game.battle.soul:remove()
    Game.battle.soul = nil
    Game.battle.turn_count = 1
    
    Game.battle:getActiveEnemies()[1].wave_index = 0
    Game.battle:getActiveEnemies()[1].health = 5555
    
    Game.battle.encounter:setMode("normal")
    self.spamtonNeo:setAnimation("shaking")

    
    for _,party in ipairs(Game.battle.party) do
        party:heal(50000)
        end
    
    Game.tension = 0
    if self.greenlit then
    Game.battle.music:play("meeting", 1, 1.5)
    else
    Game.battle.music:play("deadringer")
    end
    end)

    Assets.playSound("spam_death")
    Assets.playSound("laugh")


    end


function noHitSpamtonNeo:getPartyPosition(index)
if index == 3 then
    return 370, 302
elseif index == 2 then
    return 225, 283
elseif index == 1 then
    return 179, 310

else
 return super:getPartyPosition(self, index)
end
end


function noHitSpamtonNeo:setMode(mode)
    self.mode = mode
    self.old_x = self.spamtonNeo.x
    self.old_y = self.spamtonNeo.y
    self.ease = true
    self.ease_timer = 0
end

function noHitSpamtonNeo:update()
    super:update(self)

    if self.greenlit then




                 end



    if not self.spamtonNeo.done_state and (Game.battle:getState() ~= "TRANSITION") then
        self.timer = self.timer + (1 * DTMULT)


        local wanted_x = self.spamtonNeo.old_x
        local wanted_y = self.spamtonNeo.old_y

        if self.mode == "normal" then
            wanted_x = 320 + (math.sin(self.timer * 0.08) * 15)
            wanted_y = 190 + (math.sin(self.timer * 0.04) * 20)
            self.spamtonNeo.flip_x = false





        elseif self.mode == "shoot" then
            wanted_x = 120  + (math.sin(self.timer * 0.08) * 10)
            wanted_y = 180 + (math.sin(self.timer * 0.04) * 5)
            self.spamtonNeo.flip_x = true
            self.spamtonNeo:setAnimation("aim", 270)
            self.spamtonNeo:setAnimation("shaking")



         elseif self.mode == "right" then
                    wanted_x = 520  + (math.sin(self.timer * 0.08) * 10)
                    wanted_y = 180 + (math.sin(self.timer * 0.04) * 5)
                    self.spamtonNeo:setAnimation("death")
                                        self.spamtonNeo:setAnimation("shaking")


       elseif self.mode == "up" then
                          wanted_x = 520  + (math.sin(self.timer * 0.08) * 10)
                          wanted_y = -150 + (math.sin(self.timer * 0.04) * 5)
                          self.spamtonNeo:setAnimation("idle")


                      end


        if not self.ease then
            self.spamtonNeo.x = wanted_x
            self.spamtonNeo.y = wanted_y
            self.spamtonNeo.rotation=math.rad(10*math.sin(self.timer * 0.08) * 1.2)

            self.spamtonNeo.rotation=math.rad(10*math.cos(self.timer * 0.08) * 0.7)


        else
            self.ease_timer = self.ease_timer + (0.05 * DTMULT)
            self.spamtonNeo.x = Ease.outQuad(self.ease_timer, self.old_x, wanted_x - self.old_x, 1)
            self.spamtonNeo.y = Ease.outQuad(self.ease_timer, self.old_y, wanted_y - self.old_y, 1)
           -- self.spamtonNeo.rotation=math.rad(15*math.sin(self.timer * 0.08) * 40)

            if self.ease_timer >= 1 then
                self.ease = false
            end
        end
    end




end

function noHitSpamtonNeo:onBattleStart()
	super:onBattleStart(self)
	-- add the BGs you want to use in the battle first



end

function noHitSpamtonNeo:getNextWaves()
    if self.greenlit then
        Game.battle.enemies[1].selected_wave = "basic"
        return {"basic"}
else
local wave=super:getNextWaves(self)
        return wave
end
end

function noHitSpamtonNeo:getDialogueCutscene()


 local enemies = Game.battle:getActiveEnemies()

 if self.endItAll then

 return function(cutscene)
 Game:getActiveMusic():fade(0, 0.5)
 cutscene:wait(3)
 cutscene:text("(Now.)")
 Game.battle.camera:shake(10)
 Assets.playSound("dtrans_flip")
  self.spamtonNeo:setAnimation("death")
   self.spamtonNeo:setAnimation("shaking")
 cutscene:wait(1)
 cutscene:text("Shuffle out.")
 cutscene:text("Spamton engineered himself to be variable, in the face of repeated attempts to face him.")
    Assets.playSound("bell_bounce_short")
     Game.battle.camera:shake(5)
  self.spamtonNeo.sprite:snapStrings(1, true)
 cutscene:text("It is not unlikely that he will win if you attempt to do so again.")
  Game.battle.camera:shake(10)

 Assets.playSound("dtrans_flip")
 self.spamtonNeo:setAnimation("death")
 cutscene:text("There are rational explanations that can be concocted, using their incomplete information. ")

 cutscene:text("The fight against Spamton may, alternatively, be easier the second time around.")
   Assets.playSound("bell_bounce_short")
    Game.battle.camera:shake(5)
    Assets.playSound("bell_bounce_short")

  self.spamtonNeo.sprite:snapStrings(1, true)
 cutscene:text("The choice is yours.")
 cutscene:wait(2)
 cutscene:fadeOut(3)
 cutscene:wait(1)
   Assets.playSound("bell_bounce_short")
cutscene:wait(1)
                                Assets.playSound("badexplosion")
cutscene:wait(2)
   Assets.playSound("impact", 1, 0.5)

 cutscene:wait(2)


 cutscene:fadeIn(4)

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

       cutscene:battlerText(enemies[1], "SORRY TO\n[Cancel Culture]\nTHE SHOW, KIDSS!!")
            cutscene:battlerText(enemies[1], "BUT [Have you heard\nabout NO\nHITTING?]???")
       cutscene:battlerText(enemies[1], "SPAMTON\n[[Neo]] IS\n[World-Renowned] FOR\nITS INCREDIBLE\nDEFENESTRATING\nCAPABILITIES!!!")

 self.spamtonNeo:setAnimation("idle")

       Assets.playSound("laugh")
             cutscene:wait(3)

       cutscene:battlerText(enemies[1], "BUT IT DOESNT\n[matter]")

       cutscene:battlerText(enemies[1], "HOW MANY TIMES\nYOU OPTIMIZE\nRED BUSTERS!")

       cutscene:battlerText(enemies[1], "EVEN IF\nYOU [DODGE]\nEVERYTHING I'VE GOT!")

       cutscene:battlerText(enemies[1], "YOU CAN'T\nEVEN MAKE A\n [Dent] For [Dent]\nIN MY DEFENSES!")




       cutscene:text("(He's bug ABUSING!)")
              cutscene:text("(Spamton took the opportunity while you were fighting.)")
             cutscene:text("(Made you think you would win so you wouldn’t reset on a failed run.)")
        

             cutscene:wait(1)

             cutscene:text("Kris. We've no hitted all the attacks...", "surprise_smile", "noelle")
             cutscene:text("Kris. Is there really where we fail...?", "surprise_smile", "noelle")

             cutscene:text("(At best this would `be considered a 1 hit no heal run...)")



cutscene:wait(1)




       cutscene:battlerText(enemies[1], "[[Last Chance]] KRIS.")
       cutscene:battlerText(enemies[1], "[[ILL MAKE]]")
       cutscene:battlerText(enemies[1], "[font:omori_talk]AN ATTACK\nWITH SO MUCH[Rng]\nYOU'LL NEVER\nBE ABLE TO DODGE IT")
       cutscene:battlerText(enemies[1], "SO RESET!\nRESET NOW!")
        cutscene:battlerText(enemies[1], "DO IT.\nDO IT NOW OR\n1LL DO IT FOR\nYOU IN\n[[1997\nDeciseconds\n]]!!!")

cutscene:wait(1)

Assets.playSound("weaponpull_fast")
kris:setSprite("battle/intro_07")
cutscene:wait(0.5)
cutscene:shakeCamera(3)
cutscene:wait(0.5)
Assets.playSound("impact")
kris:setSprite("landed_1")
cutscene:wait(1)

cutscene:text("Kris. We can't seriously be thinking about resetting this attempt?", "concern", "ralsei")
cutscene:text("(You've made it this far without a Pink Ribbon? Is it worth it to keep trying?)")
cutscene:battlerText(enemies[1], "WHOHOA!\nNOT MY\n[[Lightbulb]]\n!!!")
cutscene:battlerText(enemies[1], "WHEN YOU’RE\n[Green Around\nthe Gills?],\nYOU CAN@T JUST\n[GIVE UP\nEASILY]\nLIKE THAT!!!")
cutscene:text("KRIS PLEASE DONT RESET", "angry", "susie")
Assets.playSound("vineboom")

cutscene:text("I DONT WANNA TRY AND HAVE TO NO HIT ANOTHER SANS FANGAMES WITH", "angry", "susie")
Assets.playSound("vineboom")

cutscene:text("LIKE 30 DIFFERENT PHASES", "angry", "susie")

cutscene:battlerText(enemies[1], "I THINK\nIT'S TIME\nFOR A\nPHASE 2")

       cutscene:text("* SpamtonNeo's DEFENSE and HEALTH is rapidly rising.")




                   cutscene:shakeCamera(50)

                   Assets.playSound("fountain_make")

                    Assets.playSound("weWon")
                          Assets.playSound("laugh")

                                   local rect = Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
                                   rect:setColor(love.math.colorFromBytes(144, 238, 144))
                                   rect:setLayer(BATTLE_LAYERS["bottom"])
                                   rect.alpha = 0
                                   Game.stage:addChild(rect)

                                   local rect2 = Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
                                  local rect2 = Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
                                   rect2:setColor(love.math.colorFromBytes(144, 238, 144))
                                   rect2:setLayer(BATTLE_LAYERS["above_battlers"])
                                   rect2.alpha = 0
                                   Game.stage:addChild(rect2)

                                   --Game.battle:shakeCamera(5, 5, 0)

                                   Game.battle.timer:tween(2, rect, {alpha=1})
                                   cutscene:wait(2.7)
                                   Game.battle.timer:tween(1, rect2, {alpha=1})
                                   cutscene:wait(2.7)
                                   Game.battle.timer:tween(1, rect2, {color={0, 0.2, 0}})

       rect:remove()
       rect2:remove()

       cutscene:fadeOut(0)

       Game.battle.music:stop()




       Assets.playSound("boost")

       cutscene:wait(3)

      


        Game.battle.music:stop()

       self.greenlitOnce = true
        self.greenlit = true
        self.greenlitOnce = false

        cutscene:fadeIn(0)

        cutscene:battlerText(enemies[1], "erm what\nthe scallop ")
        cutscene:battlerText(enemies[1], "WHERES MY\nPHASE 420?")

 
        cutscene:text("I didn't want to have to use this but...", "roaring", "ralsei")
        cutscene:text("Looks like this is my last resort...", "roaring", "ralsei")
        cutscene:wait(3)
 
        Assets.playSound("vineboom")

        cutscene:text("Ratio.", "roaring", "ralsei")
        cutscene:wait(3)
        cutscene:battlerText(enemies[1], "what")

        self.spamtonNeo:explode()

        Assets.playSound("vineboom")

        cutscene:wait(2)



        Game.battle:returnToWorld()

 


       end
       end

 if Game.battle.turn_count == 1 then

             return function(cutscene)

                 

             cutscene:battlerText(enemies[1], "I CANT\nBVELIVE YOU’VE BEEN\n[Getting High On\nYour Own Supply]!!!")
                  cutscene:battlerText(enemies[1], "YOUOUOU@vE BETRAYED ME!!\nDRINKING [Pasta Water]\nON A A LATE kNIGHT!!!E")


         end
         end

           if Game.battle.turn_count == 2 then
     

                              return function(cutscene)

       cutscene:battlerText(enemies[1], "YOUU LiTTLE\n[Teens With A\nDeath Wish]!!!")
       cutscene:battlerText(enemies[1], "DO YOU KNOW HOW\n[Blood Diamonds]\nIT’’’S TO FIN D A GOOOD\n[Businessman doing ]\nPARTNER???”")


                              end
                         end


    if Game.battle.turn_count == 3 then

            return function(cutscene)

                cutscene:battlerText(enemies[1], "I [Extendo-matic!]\nMY [[Heart]] TO\nYOU KRISS!!!")
                   cutscene:battlerText(enemies[1], "I THOUGHT YOU WERR\n[[9000 IQ!]]!!!")


        end
        end



        if Game.battle.turn_count == 4 then
                  

                    return function(cutscene)
                        cutscene:battlerText(enemies[1], "I THOUGHT YOU WERE\n[effective altruism]!!\nI THOUGHT YOU WERE\n[Logic Puzzles]\n!!!")


         end
    end

     if Game.battle.turn_count == 5 then


                        return function(cutscene)
                            cutscene:battlerText(enemies[1], "BUT YOU WERE JUST ANOTHER\n[[Customer Service\nRepresentative]]!")
                             cutscene:battlerText(enemies[1], "ANOTEHR\n[Scam Caller]\n!!")



             end
        end

           if Game.battle.turn_count == 6 then
                           


                    return function(cutscene)
                  cutscene:battlerText(enemies[1], "WELLL IlL DO IT\n[[Again]]\n[[Again]]!!")

                     end
                end


 if Game.battle.turn_count == 7 then

      return function(cutscene)
                       

      cutscene:battlerText(enemies[1], "SHE’s GONNA [BUrnign!\nOH ANGEL thE\nBURNinG!]!!!")

      end
      end

       if Game.battle.turn_count == 8 then
                       

        return function(cutscene)
        cutscene:battlerText(enemies[1], "BUT IM A\n[Customer Loyalty\nScheme]\nKRIS!!! NO\n[Murder]!! NOT YET\n!!!")


        end
        end
if Game.battle.turn_count == 10 then

        return function(cutscene)
                            

        cutscene:battlerText(enemies[1], "ALL I NEED\nIS THAT[[LIL]\nSOUL")



        end
        end
        
        if Game.battle.turn_count == 9 then

            return function(cutscene)
                                Assets.playSound("bell_bounce_short")
    

                        cutscene:battlerText(enemies[1], "WHO NEEDS\nPIPIS [canons]")
                        cutscene:battlerText(enemies[1], "WITH WINGS\nLIKE THESE!")
                

    
            end
            end

            if Game.battle.turn_count == 11 then
                Assets.playSound("bell_bounce_short")


    return function(cutscene)
    cutscene:battlerText(enemies[1], "FREE\nFALLING!")



    end
    end
        
        
if Game.battle.turn_count == 12 then
            

return function(cutscene)

cutscene:battlerText(enemies[1], "AND GET DODGING!")


end
end

if Game.battle.turn_count == 13 then
                    

        return function(cutscene)
        cutscene:battlerText(enemies[1], "HUH")
        cutscene:battlerText(enemies[1], "ITS MY\nBUDDY")
        cutscene:battlerText(enemies[1], "THE OFFICIAL MR PIPIS!")


        end
        end

if Game.battle.turn_count == 14 then

        return function(cutscene)
        cutscene:battlerText(enemies[1], "GET READY YOU\n[[HeartOnAString]]")
        cutscene:battlerText(enemies[1], "ITS TIME")
        cutscene:battlerText(enemies[1], "FOR THE")
        cutscene:battlerText(enemies[1], "[[BIGGEST]]\n[[SHOT]")


        end
        end

end

function noHitSpamtonNeo:beforeStateChange(old, new)



if new =="DEFENDINGEND" then

self.mode = "normal"
self.spamtonNeo:setAnimation("idle")



end
end



return noHitSpamtonNeo