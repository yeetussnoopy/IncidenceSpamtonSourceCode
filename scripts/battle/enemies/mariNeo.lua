local mariNeo, super = Class(EnemyBattler)

function mariNeo:init()
    super:init(self)

    -- Enemy name
    self.name = "Mari-NEO-ette"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("mariNeo")

    self.afim = Game.battle.timer:every(1, function()
        self:addChild(AfterImage(self.sprite, 0.3))
    end)
    

self.defeatedOnce = true

self.customBulletToggle = true

self.guardSoulTurnCount = 0
self.currentEmotionState = "neutral"

--[[self.omor = Sprite("susie_omori", 549 , 1)
    self.omor.rotation = math.rad(0)
        self.omor:setScale(0.5)
    self.omor.layer = BATTLE_LAYERS["ui"] - 1
    Game.battle:addChild(self.omor) --]]

    --self.omor:set

    -- Enemy health
    self.max_health = 3600
    self.health = 3600
    -- Enemy attack (determines bullet damage)
    self.attack = 8
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 0
         self.exit_on_defeat = true

          self.disable_mercy = true

        self:toggleOverlay(false)

        self.wave_index = 0

        self.tired_percentage = 0


    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "mariSpamIDK",
        "supportNukeMari",
        "starBombLots",
        "wireheart",
        "boomerang",
        "supportAttackUp",
         "pendulum",
        "muteWalls",
        "starBomb",
         "pendulum_bomb",
         "wireheartMega",
         "supportAttack",
        "rolebanAttackMari",
        "muteCycle",
        "basic",
        "mariNeoFinal",

      
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "TIME TO GO ON\nA JOURNEY\nSPAMTOING",
        "[Short saving] BY\nTHE SECOND!!",
        "EXPAND\nYOUR MIND!",
        "BURGERS\nON MY MIND!!"


    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 6 DF 9\n[font:omori]* Using the [color:purple]CHECK ACT[color:reset] as usual, I see. You should totally [color:purple]ACT more![color:reset] I've always liked your [color:purple]ACTs!"

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
            "[voice:mari][font:omori]* What will [font:main_mono][SPAMTON G SPAMTON][font:omori]do?"

    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    --self.low_health_text = "* The dummy looks like it's\nabout to fall over."

    -- Register act called "Smile"
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)

    self:registerAct("Scammed Out", "Inflicts\n Envy", {"spamton"}, 35)


    self:registerAct("Heal Deal", "Restores\nHP", {"spamton"}, 25)


    self:registerAct("Big Shot", "Critical\nHit", {"spamton"}, 50)


end

function Mod:getActionButtons(battler, types)
    if battler.chara.id == "spamton" then
        --Utils.removeFromTable(types, "fight")
        Utils.removeFromTable(types, "item")
        Utils.removeFromTable(types, "spare")

    end
    return buttons
end


function mariNeo:getNextWaves()
    self.wave_index=self.wave_index+1
    if self.wave_index<=#self.waves then
        return {self.waves[self.wave_index]}
    else
        return super:getNextWaves(self)
    end
end



function mariNeo:onAct(battler, name)
    if name == "Heal Deal" then
        -- Give the enemy 100% mercy
       
        Game.battle:powerAct("heal_deal", battler, "spamton")
        return

       elseif name == "Big Shot" then --X-Action

            Game.battle:powerAct("jevv_slash", battler, "spamton")

return

elseif name == "Scammed Out" then --X-Action

    battler.sprite:setSprite("dark")
   -- Assets.playSound("cardrive")

      Assets.playSound("vineboom")

   
        Game.battle.camera:shake(5)


    --battler:statusMessage(battler.x, battler.y, msg, "bullets/chaser", {1, 1, 1}, false)

    self.guardSoulTurnCount = 3


    self.currentEmotionState  = "sad"


    return {

        "* SPAMTON reminded himself of the time he got scammed out of a deal!",
        "* SPAMTON feels extremely ENVY!",
        "* SPEED up, DEFENSE down for 3 turns!",
        "* Increased SOUL speed, but zero i-frames!"
    }
        --  return "* Ralsei and Noelle healed the whole party!"

       elseif name == "Question" then

          
                      Game.battle:startActCutscene("mariNeo", "convince")
                      local act1 = self:getAct("Question")

                      act1.name = "Convince"
return

    elseif name == "Convince" then


                      Game.battle:startActCutscene("mariNeo", "convince2")
                      local act2 = self:getAct("Convince")

                      act2.name = "Coerce"
return
   elseif name == "Coerce" then


                      Game.battle:startActCutscene("mariNeo", "convince3")


local act2 = self:getAct("Coerce")

                      act2.name = "End"
                             

    
return

elseif name == "End" then
    Game.battle.encounter.endItAll= true


return "..."
     elseif name == "Berdly Help" then --X-Action


             self:addMercy(0)


     
               return "* Berdly tried to lecture mariNeo! It didn't work!"


    elseif name == "Standard" then --X-Action

        self:addMercy(0)
            -- Text for any other character (like Noelle)
            return {

                "* SPAMTON tried to offer MARI-NEO-ETTE free [[kromer]]!",
                "* MARI-NEO-NETTE felt RIPPED OFF!",
                "* No effect!"
            }
        
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super:onAct(self, battler, name)
end


function mariNeo:onHurt(damage, battler)

    self:sparkle(16, 11, 111)
end

function mariNeo:update()

    if Game.battle.state == "DEFENDING" and self.guardSoulTurnCount > 0 then
            Game.battle:swapSoul(PinkSoul())

    end

    super:update(self)
end

function mariNeo:onTurnStart()
    if self.guardSoulTurnCount > 0  then
       self.guardSoulTurnCount = self.guardSoulTurnCount - 1

  end
end

    


function mariNeo:onDefeat()

if self.defeatedOnce then


self.sprite:setAnimation("hurt")

self.health = 5000
self.defense = 9999

            --Game.battle:finishAction(Game.battle:getActionBy("susie"), false)
           --Game.battle:finishAction(Game.battle:getActionBy("noelle"), false)
            --Game.battle:finishAction(Game.battle:getActionBy("kris"), false)
    Game.battle.encounter.greenlitOnce= true
    self.defeatedOnce = false
            self.tired_percentage = 0

                      self.disable_mercy = false


local act = self:getAct("Check")

act.name = "Question"

    self.name = "GreenLight NEO"


return false
else

self.health = math.random(1, self.max_health)
        self.tired_percentage = 0

end
return false

end

--[[unction mariNeo:update()
    if Game.battle.state == "DEFENDING" then
            Game.battle:swapSoul(SpamSoul())

    end

    super:update(self)
end]]



--[[function mariNeo:onMercy()
    self:onDefeat()
end]]


return mariNeo