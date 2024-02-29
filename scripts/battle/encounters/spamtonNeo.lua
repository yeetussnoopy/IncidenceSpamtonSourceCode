local spamtonNeo, super = Class(Encounter)

function spamtonNeo:init()
    super:init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Attack Spamton Neo to snap his wires!"

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
        --Game.battle.party[5].flip_x = true




               self.greenlitOnce = false
               self.greenlight = false

   self.endItAll = false


self.endItAll = false


end


function spamtonNeo:getPartyPosition(index)
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


function spamtonNeo:setMode(mode)
    self.mode = mode
    self.old_x = self.spamtonNeo.x
    self.old_y = self.spamtonNeo.y
    self.ease = true
    self.ease_timer = 0
end

function spamtonNeo:update()
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

function spamtonNeo:onBattleStart()
	super:onBattleStart(self)
	-- add the BGs you want to use in the battle first



end

function spamtonNeo:getNextWaves()
    if self.greenlit then
        Game.battle.enemies[1].selected_wave = "basic"
        return {"basic"}
else
local wave=super:getNextWaves(self)
        return wave
end
end

function spamtonNeo:getDialogueCutscene()


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
            cutscene:battlerText(enemies[1], "BUT [Have you heard\nabout extended\nwarranty?]???")
       cutscene:battlerText(enemies[1], "SPAMTON\n[[Neo]] IS\n[World-Renowned] FOR\nITS INCREDIBLE\nDEFENESTRATING\nCAPABILITIES!!!")

 --self.spamtonNeo:setAnimation("idle")

       Assets.playSound("laugh")
             cutscene:wait(3)

       cutscene:battlerText(enemies[1], "BUT WITH A\n[Horsie] ON TOP??\nKIDDOS, I CAN SIT\nAND [Weight watchers]\n!!!")

       cutscene:text("(Draining.)")
              cutscene:text("(Spamton took the opportunity while you were fighting.)")
             cutscene:text("(Made you think you would win so you wouldn’t reset.)")

             cutscene:wait(1)

             cutscene:text("The City. It's changing.", "surprise_smile", "noelle")

cutscene:wait(1)




       cutscene:battlerText(enemies[1], "[[Last Chance]] KRIS.")
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

cutscene:text("Kris?", "concern", "ralsei")
cutscene:text("(Spamton cares about you, in his own twisted way. And he doesn’t want to lose the you of now.)")
cutscene:battlerText(enemies[1], "WHOHOA!\nNOT MY\n[[Lightbulb]]\n!!!")
cutscene:battlerText(enemies[1], "WHEN YOU’RE\n[Green Around\nthe Gills?],\nYOU CAN@T JUST\n[Cross Country\nCompetition]\nLIKE THAT!!!")
cutscene:text("What the hell were you trying!?", "angry", "susie")





       cutscene:battlerText(enemies[1], "I THINK\nIT'S TIME\nFOR A\nGREENLIT\nSPECIL")

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

       finalText=Text("greenlit", 404, 25, 600, 400)

                       finalText.font_size=40
                       finalText:setColor(love.math.colorFromBytes(238, 75, 43))
                       finalText:setText("NOW WATCHING:\n[[GREENLIGHT]]\nREAL SPECIL\nSTARRING:\nSPAMTON")
                       finalText:setLayer(BATTLE_LAYERS["top"] + 1)

                       Game.battle:addChild(finalText)

       local rect3 = Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
                                         local rect3 = Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
                                          rect3:setColor(love.math.colorFromBytes(144, 238, 144))
                                          rect3:setLayer(BATTLE_LAYERS["ui"] + 1)
                                          rect3.alpha = 0.6
                                          Game.battle:addChild(rect3)

       Assets.playSound("boost")

       cutscene:wait(3)

           cutscene:fadeIn(2, {color={0, 0.2, 0}, 0.5})




        Game.battle.music:stop()

       self.greenlitOnce = true
        self.greenlit = true
        self.greenlitOnce = false





                self.spamtonNeo.sprite:setScale(1.3)

                Game.battle.music:play("meeting", 1, 1.5)

       end
       end

 if Game.battle.turn_count == 1 then

             return function(cutscene)

                    Assets.playSound("bell_bounce_short")

            self.spamtonNeo.sprite:snapStrings(1, true)

             cutscene:battlerText(enemies[1], "I CANT\nBVELIVE YOU’VE BEEN\n[Getting High On\nYour Own Supply]!!!")
                  cutscene:battlerText(enemies[1], "YOUOUOU@vE BETRAYED ME!!\nDRINKING [Pasta Water]\nON A A LATE kNIGHT!!!E")


         end
         end

           if Game.battle.turn_count == 2 then
            Assets.playSound("bell_bounce_short")
            self.spamtonNeo.sprite:snapStrings(2, true)

                              return function(cutscene)

    cutscene:text("Ralsei! Susie!")
    cutscene:text("* Next time you’re gonna be a dumbass, Kris, you’ve gotta tell us. Alright?", "neutral", "susie")
        cutscene:text("* How about you don't do that crap alone.", "neutral", "susie")

       cutscene:battlerText(enemies[1], "YOUU LiTTLE\n[Teens With A\nDeath Wish]!!!")
       cutscene:battlerText(enemies[1], "DO YOU KNOW HOW\n[Blood Diamonds]\nIT’’’S TO FIN D A GOOOD\n[Businessman doing ]\nPARTNER???”")


                              end
                         end


    if Game.battle.turn_count == 3 then
                        Assets.playSound("bell_bounce_short")

            self.spamtonNeo.sprite:snapStrings(3, true)

            return function(cutscene)

                cutscene:battlerText(enemies[1], "I [Extendo-matic!]\nMY [[Heart]] TO\nYOU KRISS!!!")
                   cutscene:battlerText(enemies[1], "I THOUGHT YOU WERR\n[[9000 IQ!]]!!!")


        end
        end



        if Game.battle.turn_count == 4 then
                            Assets.playSound("bell_bounce_short")

                    self.spamtonNeo.sprite:snapStrings(3, true)


                    return function(cutscene)
                        cutscene:battlerText(enemies[1], "I THOUGHT YOU WERE\n[effective altruism]!!\nI THOUGHT YOU WERE\n[Logic Puzzles]\n!!!")


         end
    end

     if Game.battle.turn_count == 5 then
                         Assets.playSound("bell_bounce_short")

            self.spamtonNeo.sprite:snapStrings(2, true)

                        return function(cutscene)
                        cutscene:text("I think Berdly is a literal PNG LOL", "concern", "ralsei")
                        cutscene:text("[facec:smug][voice:berdly]* false lol")
                            cutscene:battlerText(enemies[1], "BUT YOU WERE JUST ANOTHER\n[[Customer Service\nRepresentative]]!")
                             cutscene:battlerText(enemies[1], "ANOTEHR\n[Scam Caller]\n!!")



             end
        end

           if Game.battle.turn_count == 6 then
                               Assets.playSound("bell_bounce_short")

                       self.spamtonNeo.sprite:snapStrings(1, true)


                    return function(cutscene)
                  cutscene:battlerText(enemies[1], "WELLL IlL DO IT\n[[Again]]\n[[Again]]!!")

                     end
                end


 if Game.battle.turn_count == 7 then

      return function(cutscene)
                          Assets.playSound("bell_bounce_short")

                  self.spamtonNeo.sprite:snapStrings(1, true)

      cutscene:battlerText(enemies[1], "SHE’s GONNA [BUrnign!\nOH ANGEL thE\nBURNinG!]!!!")

      end
      end

       if Game.battle.turn_count == 8 then
                           Assets.playSound("bell_bounce_short")

            self.spamtonNeo.sprite:snapStrings(1, true)

        return function(cutscene)
        cutscene:battlerText(enemies[1], "BUT IM A\n[Customer Loyalty\nScheme]\nKRIS!!! NO\n[Murder]!! NOT YET\n!!!")


        end
        end
if Game.battle.turn_count == 10 then

        return function(cutscene)
                            Assets.playSound("bell_bounce_short")

                    self.spamtonNeo.sprite:snapStrings(1, true)

         cutscene:text("How are we on tension points? Enough juice yet?")
         cutscene:text("[facec:smug][voice:berdly]* No need!")
         cutscene:text("[facec:smug][voice:berdly]* I’ve been getting in\nthe occasional chip\ndamage, my friends!")
          cutscene:text("[facec:smug][voice:berdly]* I think he’s on the\nend of his rope!")
                     cutscene:text("(It’s remarkable how far they’ve come.)")

        cutscene:battlerText(enemies[1], "ALL I NEED\nIS THAT[[LIL]\nSOUL")



        end
        end

        if Game.battle.turn_count == 9 then

            return function(cutscene)
                                Assets.playSound("bell_bounce_short")
    
                        self.spamtonNeo.sprite:snapStrings(1, true)

                        cutscene:battlerText(enemies[1], "WHO NEEDS\nPIPIS [canons]")
                        cutscene:battlerText(enemies[1], "WITH HEADS\nLIKE THESE!")
                    
    
             cutscene:text("I think that's Mettaton's line...?")
             cutscene:text("How does Spamton even know about Undertale?")

             cutscene:text("[facec:smug][voice:berdly]* A fake fan!")
             cutscene:text("[facec:smug][voice:berdly]* It's clear now!")
             cutscene:text("[facec:smug][voice:berdly]* We've got an\nimposter it seems!")
             cutscene:text("Did Berdly just say what I thought he said?", "smirk", "susie")
             cutscene:text("This looks like a grossley poor attempt at impersonation!", "confused", "noelle")
             cutscene:text("Looks like we'll have to ban Spamton...", "dejected", "noelle")

             cutscene:text("* -ban Spamton")
             cutscene:text("* But it refused.")


             cutscene:battlerText(enemies[1], "NICE TRY!")
             cutscene:battlerText(enemies[1], "NEO IS KNOWN\nFOR IT'S [High\n-as-heck] DEFENSE!")
             cutscene:battlerText(enemies[1], "THAT INCLUDES\nBAN IMMUNITY!")

    
            end
            end
        
            if Game.battle.turn_count == 11 then
                Assets.playSound("bell_bounce_short")

        self.spamtonNeo.sprite:snapStrings(1, true)

    return function(cutscene)
    cutscene:battlerText(enemies[1], "FREE\nFALLING!")
    cutscene:battlerText(enemies[1], "STARRING!")
    cutscene:battlerText(enemies[1], "ME!")


    end
    end

        
if Game.battle.turn_count == 12 then
            Assets.playSound("bell_bounce_short")

    self.spamtonNeo.sprite:snapStrings(1, true)

return function(cutscene)
cutscene:battlerText(enemies[1], "KRIS JUST [SLIDE] THAT")
cutscene:battlerText(enemies[1], "S O U L!")
cutscene:battlerText(enemies[1], "OR ELSE\nILL LEAK\nYOUR PERSONAL\nINFO!")
cutscene:text("Spamton, I won't give you my soul.")
cutscene:battlerText(enemies[1], "OK THEN!")
cutscene:battlerText(enemies[1], "11.223.221.114")
cutscene:text("Erm, Kris. What are those numbers?", "concern", "ralsei")
cutscene:text("* I think that puppet guy exposed Kris.", "neutral", "susie")
cutscene:text("[facec:smug][voice:berdly]* Heh! My visor captures\neverything dear Kris!")
cutscene:text("(Berdly may have memorized your personal info.)")
cutscene:text("Wait, I think that's my INFO!", "surprise_smile", "noelle")
cutscene:text("I may have, uh. Used your internet before in the past.")
cutscene:text("Why?!", "upset", "noelle")
cutscene:text("I mean it is faster...than mines.")
cutscene:battlerText(enemies[1], "STOP BICKERING!")
cutscene:battlerText(enemies[1], "AND GET DODGING!")


end
end

if Game.battle.turn_count == 13 then
                    Assets.playSound("bell_bounce_short")

            self.spamtonNeo.sprite:snapStrings(1, true)

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

function spamtonNeo:beforeStateChange(old, new)



if new =="DEFENDINGEND" then

self.mode = "normal"
self.spamtonNeo:setAnimation("idle")



end
end



return spamtonNeo