local item, super = Class("wood_blade", true)

function item:init()
    super:init(self)

    self.name = "Owen Sheathe"

    self.description = "A trusty blade. Passed down from the vessel to aid you in your battles."

    self.bonus_name = "EGGMAN (does nothing)"
    self.bonus_icon = "ui/menu/icon/smile"

    self.bonuses = {
        attack = 1
    }
end

function item:getDescription()
    return super.super:getDescription(self)
end

return item
