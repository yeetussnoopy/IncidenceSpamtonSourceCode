local spell, super = Class(Spell, "kuzu_heal")

function spell:init()
    super:init(self)

    -- Display name
    self.name = "weakIceShock"
    -- Name displayed when cast (optional)
    self.cast_name = nil

    -- Battle description
    self.effect = "Rip\nYellow"
    -- Menu description
    self.description = "Ralchee Energy restores your health points."

    -- TP cost
    self.cost = 45

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "enemy"

    -- Tags that apply to this spell
    self.tags = {"hurt"}
end

function spell:onCast(user, target)
    target:hurt(3)
end

function spell:getCastMessage(user, target)
    return "* Noelle could barely bring herself to use IceShock."
end

return spell