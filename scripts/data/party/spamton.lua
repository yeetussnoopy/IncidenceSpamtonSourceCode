local character, super = Class(PartyMember, "spamton")

function character:init()
    super:init(self)

    -- Display name
    self.name = "Spamton"

    self.flip = "right"

    -- Actor ID (handles overworld/battle sprites)
    self:setActor("spamton")

    -- Display level (saved to the save file)
    self.level = 1
    -- Default title / class (saved to the save file)
    self.title = "Spamton \nRoleplayer\nEasily rolebanned"

    -- Determines which character the soul comes from (higher number = higher priority)
    self.soul_priority = 2

    -- Whether the party member can act / use spells
    self.has_act = true
    self.has_spells = false

    -- X-Action name (displayed in this character's spell menu)
        self.has_xact = false

   -- self.xact_name = "Deal"

    -- Spells by id
    self:addSpell("jevv_slash")
    self:addSpell("heal_deal")


    -- Current health (saved to the save file)



    self.health = 200

    self.stats = {
        health = 200,
        attack = 17,
        defense = 2,
        magic = 15
    }



    -- Weapon icon in equip menu
    self.weapon_icon = "ui/menu/equip/sword"

    -- Equipment (saved to the save file)

    self:setArmor(1, "pink_ribbon")
    self:setWeapon("wood_blade")

    -- Character color (for action box outline and hp bar)
    self.color = {1, 1, 1}
    -- Damage color (for the number when attacking enemies) (defaults to the main color)
    self.dmg_color = nil
    -- Attack bar color (for the target bar used in attack mode) (defaults to the main color)
    self.attack_bar_color = nil
    -- Attack box color (for the attack area in attack mode) (defaults to darkened main color)
    self.attack_box_color = nil
    -- X-Action color (for the color of X-Action menu items) (defaults to the main color)
    self.xact_color = {1, 1, 1}

    -- Head icon in the equip / power menu
    self.menu_icon = "party/spamton/head"
    -- Path to head icons used in battle
    self.head_icons = "party/spamton/icon"
    -- Name sprite (TODO: optional)
    self.name_sprite = "party/spamton/name"

    -- Effect shown above enemy after attacking it
    self.attack_sprite = "effects/attack/bite"
    -- Sound played when this character attacks
    self.attack_sound = "omori_hit"
    -- Pitch of the attack sound
    self.attack_pitch = 1

    -- Battle position offset (optional)
    self.battle_offset = nil
    -- Head icon position offset (optional)
    self.head_icon_offset = nil
    -- Menu icon position offset (optional)
    self.menu_icon_offset = nil

    -- Message shown on gameover (optional)
    self.gameover_message = nil

end

return character