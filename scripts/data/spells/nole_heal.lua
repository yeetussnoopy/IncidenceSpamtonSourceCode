local spell, super = Class(Spell, "nole_heal")

function spell:init()

    super:init(self)
    -- Spell ID (optional, defaults to path)
    -- Display name
    self.name = "Heal Prayer"

    self.cast_name = nil

    -- Battle description
    self.effect = "Heals"
    -- Menu description
    self.description = "heal"

    -- TP cost
    self.cost = 32

    -- Target mode (party, enemy, or none/nil)
    self.target = "party"

    -- Tags that apply to this spell
    self.tags = {}
end

function spell:onCast(user, target)
    for _,battler in ipairs(Game.battle.party) do
        battler:heal(90)
    end
end

function Spell:getCastMessage(user, target)
    return {
        "* Noelle healed the party. (Imagine using heal prayer when you have items lol).",
    }
end


return spell