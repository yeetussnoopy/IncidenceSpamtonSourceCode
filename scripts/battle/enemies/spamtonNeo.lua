local spamtonNeo, super = Class(EnemyBattler)

function spamtonNeo:init()
    super:init(self)

    -- Enemy name
    self.name = "Spamton NEO"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("spamtonneo")

self.defeatedOnce = true



    -- Enemy health
    self.max_health = 5555
    self.health = 5555
    -- Enemy attack (determines bullet damage)
    self.attack = 11
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
        "wireheart",
         "muteCycle",
        "wireheartMega",
        "supportNuke",
        "muteWalls",
         "supportTBomb",
        "rolebanAttack",
        "supportNukeMari",
        "boomerang",
        "starBomb",
        "pendulum",
        "supportAttackUp",
        "pipisChase",
        "mariNeoFinal",

      
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "TIME TO GO ON\n[[DRAIN]]\n[[DRAIN]]\nKRIS",
        "[Short Selling] BY\nTHE SECOND!!",
        "ONE STEP\nAWAY FROM\n[heaven]!!",
        "GET [Urgent!!\nRead ASAP!]\nINFORMATION!!"


    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 27 DF 27\n* THE SMOOTH TASTE OF NEO [[WAKE UP AND BE DRAINED]]"

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* Incidence chapter 27 on top",
        "* The cityscape shifts by.",
        "* Green light fills the battlefield.",


    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    --self.low_health_text = "* The dummy looks like it's\nabout to fall over."

    -- Register act called "Smile"
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)


    self:registerAct("Ralsei Help", "Healing\nhelp.", {"noelle"}, 65)
    
    self:registerAct("Berdly Help", "Master\nplan", {"kris"}, 100)



end

function spamtonNeo:getTarget()
    if Game:getFlag("noHit") then
        return Game.battle:targetAll()
    else
        return Game.battle:randomTarget()
    end
end

function spamtonNeo:getNextWaves()
    self.wave_index=self.wave_index+1
    if self.wave_index<=#self.waves then
        return {self.waves[self.wave_index]}
    else
        return super:getNextWaves(self)
    end
end

function spamtonNeo:onAct(battler, name)
    if name == "Nerd React" then
        -- Give the enemy 100% mercy
        self:addMercy(0)
        -- Change this enemy's dialogue for 1 turn
       -- self.dialogue_override = "grah"
        
        -- Act text (since it's a list, multiple textboxes)
        return {
            "* You nerd react spamtonNeo's discord message.[wait:5]",
            "* Nothing happened. Nerd reacts don't work.",
            "* Mercy's off the table."
        }

        elseif name == "Ralsei Help" then --X-Action

            for _,party in ipairs(Game.battle.party) do
                party:heal(60)
            end


          return "* Ralsei and Noelle healed the whole party!"

          elseif name == "Question" then

          
                      Game.battle:startActCutscene("spamtonNeo", "convince")
                      local act1 = self:getAct("Question")

                      act1.name = "Convince"
return

    elseif name == "Convince" then


                      Game.battle:startActCutscene("spamtonNeo", "convince2")
                      local act2 = self:getAct("Convince")

                      act2.name = "Coerce"
return
   elseif name == "Coerce" then


                      Game.battle:startActCutscene("spamtonNeo", "convince3")

local act2 = self:getAct("Coerce")

                      act2.name = "Snap"
                             

    
return

elseif name == "Snap" then
    Game.battle.encounter.endItAll= true


return "..."
     elseif name == "Berdly Help" then --X-Action


             self:addMercy(0)


     
               return "* Berdly tried to lecture SpamtonNeo! It didn't work!"


    elseif name == "Standard" then --X-Action

        self:addMercy(0)
            -- Text for any other character (like Noelle)
            return "* "..battler.chara:getName().." nerd reacted\nYeetus."
        
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super:onAct(self, battler, name)
end

function spamtonNeo:update()
    --[[if Game.battle.state == "DEFENDING" then
            Game.battle:swapSoul(OrangeSoul())
        
    end]]

    super:update(self)
end


function spamtonNeo:onDefeat()

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



--[[function spamtonNeo:onMercy()
    self:onDefeat()
end]]

return spamtonNeo