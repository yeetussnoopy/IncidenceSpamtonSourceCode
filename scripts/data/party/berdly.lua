local character, super = Class(PartyMember, "berdly")

function character:init()
    super:init(self)

    -- Display nme
    self.name = "Berdly"

    self.flip = "right"

    -- Actor ID (handles overworld/battle sprites)
    self:setActor("berdly")

    self.health = 140
    self.stats.health = 140

    -- Display level (saved to the save file)
    self.level = 3
    -- Default title / class (saved to the save file)
    self.title = "Zephyr Guard\nProtects the party\nwith wind magic"

    -- Determines which character the soul comes from (higher number = higher priority)
    self.soul_priority = 2

    -- Whether the party member can act / use spells
    self.has_act = false
    self.has_spells = true

    -- X-Action name (displayed in this character's spell menu)
        self.has_xact = true

    self.xact_name = "B-Action"

    -- Spells by id
    --self:addSpell("heal_deal")

    -- Current health (saved to the save file)
    self.health = 140

    -- Base stats (saved to the save file)
    self.stats = {
        health = 140,
        attack = 8,
        defense = 2,
        magic = 12
    }

    -- Weapon icon in equip menu
    self.weapon_icon = "ui/menu/equip/sword"

    -- Equipment (saved to the save file)

    --self:setArmor(1, "dealmaker")
    self:setWeapon("wood_blade")

    -- Character color (for action box outline and hp bar)
    self.color = {0, 0.9, 0.2}
    -- Damage color (for the number when attacking enemies) (defaults to the main color)
    self.dmg_color = nil
    -- Attack bar color (for the target bar used in attack mode) (defaults to the main color)
    self.attack_bar_color = nil
    -- Attack box color (for the attack area in attack mode) (defaults to darkened main color)
    self.attack_box_color = nil
    -- X-Action color (for the color of X-Action menu items) (defaults to the main color)
    self.xact_color = {0, 0.9, 0.2}

    -- Head icon in the equip / power menu
    self.menu_icon = "party/berdly/head"
    -- Path to head icons used in battle
    self.head_icons = "party/berdly/icon"
    -- Name sprite (TODO: optional)
    self.name_sprite = "party/berdly/name"

    -- Effect shown above enemy after attacking it
    self.attack_sprite = "effects/attack/cut"
    -- Sound played when this character attacks
    self.attack_sound = "bigcut"
    -- Pitch of the attack sound
    self.attack_pitch = 0.9

    -- Battle position offset (optional)
    self.battle_offset = nil
    -- Head icon position offset (optional)
    self.head_icon_offset = nil
    -- Menu icon position offset (optional)
    self.menu_icon_offset = nil

    -- Message shown on gameover (optional)
    self.gameover_message = nil
end

    function character:drawPowerStat(index, x, y, menu)
        if index == 1 then
            local icon = Assets.getTexture("ui/menu/icon/exclamation")
            love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
            love.graphics.print("Boldness", x, y, 0, 0.8, 1)
            love.graphics.print(self:getFlag("boldness", 120), x+130, y)
            return true
        elseif index == 3 then
            local icon = Assets.getTexture("ui/menu/icon/fire")
            love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
            love.graphics.print("Nerdiness: High", x, y)
            return true
        end

end

return character