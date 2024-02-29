local actor, super = Class(Actor, "spamton")

function actor:init()

    self.name = "Spamton"


	-- Width and height of the actor (if unsure, just use sprite size)
    self.width = 26
    self.height = 34
    self.flip = "left"

    -- In-world hitbox, relative to the actor's topleft
    -- (these numbers are based on the actual deltarune hitbox)
    self.hitbox = {2, 18, 22, 18}

    -- Path to the actor's sprites
    self.path = "party/spamton"
    -- Default animation or sprite relative to the path
    self.default = "walk"

    self.voice = "spamton"

            -- Path to this actor's portrait for dialogue (optional)
        self.portrait_path = nil
        -- Offset position for this actor's portrait (optional)
        self.portrait_offset = nil

        -- Whether this actor as a follower will blush when close to the player
        self.can_blush = false


    self.animations = {
        -- Looping animation with 0.25 seconds between each frame
        -- (even though there's only 1 idle frame)
        ["idle/down"] = {"idle/down", 0.25, true},
        ["idle/up"] = {"idle/up", 0.25, true},
        ["idle/left"] = {"idle/left", 0.25, true},
        ["idle/right"] = {"idle/right", 0.25, true},

         ["walk/down"] = {"idle/down", 0.10, true},
         ["walk/up"] = {"idle/up", 0.10, true},
         ["right/left"] = {"idle/left", 0.10, true},
         ["up/right"] = {"idle/right", 0.10, true},

        --facing left
        ["laughleft"] = {"laughleft", 2/15, true},
        ["laughright"] = {"laughright", 2/15, true},
        ["laugh_glitch"] = {"laugh_glitch", 2/15, true},

        --facing right
        ["punch"] = {"punch", 0.25, false},


        --Battle animations
        ["battle/idle"] = {"battle/idle", 0.25, true},

        --actions
        ["battle/attack"] = {"battle/attack", 0.06, false},
        ["battle/defend"] = {"battle/defend", 1/15, false},

        ["battle/act_ready"]    = {"battle/actready", 0.2, true},
        ["battle/spell_ready"]  = {"battle/actready", 0.2, true},
        ["battle/item_ready"]   = {"battle/actready", 0.2, true},


        ["battle/spare"]        = {"battle/actready", 1/15, false, next="battle/idle"},

         ["battle/act"]          = {"battle/intro", 1/15, false},
         ["battle/actend"]          = {"battle/intro", 1/15, false},

         ["battle/spell"]        = {"battle/intro", 1/15, false},
          ["battle/item"]         = {"battle/intro", 1/12, false, next="battle/idle"},

        --reapp
        ["battle/attack_ready"] = {"battle/attack_ready", 1/15, false},


        ["battle/hurt"] = {"battle/hurt", 1/15, false, temp=true, duration=0.5},
        ["battle/defeat"]       = {"battle/defeat", 1/15, false},

        --transitions
        ["battle/transition"] = {"battle/intro", 1/15, true},
        ["battle/intro"] = {"battle/intro", 1/15, true},
    }

    self.offsets = {
        ["idle/down"] = {0, 0},
        ["idle/up"] = {0, 2},
        ["idle/left"] = {0, 0},
        ["idle/right"] = {0, 0},
        ["walk/down"] = {0, 0},
        ["walk/up"] = {0, 0},
        ["walk/left"] = {0, 0},
        ["walk/right"] = {0, 0},


        ["laughleft"] = {6, 2},
        ["laughright"] = {6, 2},

        ["laugh"] = {6, 1},
        ["laugh_big"] = {9, 5},
        ["laugh_bigger"] = {11, 7},


        ["dark"] = {0, 2},
        ["hands"] = {0, 0},
        ["handsdown"] = {-1, 2},
        ["handsdown_dark"] = {-1, 2},
        ["laugh_arms"] = {3, -1},
        ["arms"] = {0, 0},
        ["grab"] = {0, 0},
        ["grab_dark"] = {0, 1},

        ["laugh_glitch"] = {16, 23},

        ["jumpto"] = {3, 5},

        ["punch"] = {1, 2}, --one pixel above

        ----------Battle
        ["battle/idle"] = {0, 5},
        --actions
        ["battle/attack"] = {-15, -40},
        ["battle/defend"] = {0, 5},
        ["battle/defeat"] = {0, 5},

        ["battle/act_ready"]    = {0,5},
        ["battle/spell_ready"]  = {0,5},
        ["battle/item_ready"] = {0,5},
        ["battle/spare"] = {0,5},

        ["battle/act"]    = {0,10},
               ["battle/spell"]  = {0,10},
                ["battle/item"] = {0,10},
                        ["battle/actend"]    = {0,10},




        --ready

        ["battle/attack_ready"] = {-15, -25},

        ["battle/hurt"] = {0, 5},

        ["battle/transition"] = {6, 2},
        ["battle/intro"] = {0, 5},
       }
   end

   return actor