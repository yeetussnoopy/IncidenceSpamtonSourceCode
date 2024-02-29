local character, super = Class("kris", false)

function character:init()
    super:init(self)

    self.health = 140
    self.stats.health = 140

     self:addSpell("jevv_slash")
          self:addSpell("kuzu_heal")

     self.has_spells = false
     
         self.has_xact = false

         self.title = "chaothixx\nkris pfp\nhates crocheting"

 self.stats = {
            health = 140,
            attack = 12,
            defense = 3,
            magic = 0
        }



end

return character