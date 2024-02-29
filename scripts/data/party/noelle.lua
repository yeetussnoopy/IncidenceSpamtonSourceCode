local character, super = Class("noelle", false)

function character:init()
    super:init(self)

    self.health = 120
    self.stats.health = 120

    self.has_xact = false
    
        self:removeSpell("ice_shock")
        self:removeSpell("sleep_mist")


self:addSpell("weakIceShock")

self.stats = {
            health = 120,
            attack = 3,
            defense = 1,
            magic = 19
        }

end

return character