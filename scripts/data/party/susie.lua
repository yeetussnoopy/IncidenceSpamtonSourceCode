local character, super = Class("susie", false)

function character:init()
    super:init(self)

    self.health = 160
    self.stats.health = 160

     self.has_xact = false

     self.has_act = false



    self:removeSpell("rude_buster")
    self:removeSpell("ultimate_heal")
    self:addSpell("red_buster")

end

return character