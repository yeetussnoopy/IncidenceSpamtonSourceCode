local spell, super = Class(Spell, "heal_deal")

function spell:init()

    super:init(self)
    -- Spell ID (optional, defaults to path)
    -- Display name
    self.name = "Heal Deal"

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
        battler:heal(120)
    end
end

function spell:getCastMessage(user, target)
    return {
        "* SPAMTON uses HEAL DEAL!",
        "* SPAMTON recovered 120 HEART!",
    }
end


return spell