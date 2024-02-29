local actor, super = Class(Actor, "berdly")

function actor:init()

    self.name = "Berdly"


	-- Width and height of the actor (if unsure, just use sprite size)
    self.width = 24
    self.height = 40
    self.flip = "left"

    -- In-world hitbox, relative to the actor's topleft
    -- (these numbers are based on the actual deltarune hitbox)
    --self.hitbox = {2, 18, 22, 18}

    self.hitbox = nil

    -- Path to the actor's sprites
    self.path = "party/berdly"
    -- Default animation or sprite relative to the path
    self.default = "walk"

    self.voice = "spamton"

            -- Path to this actor's portrait for dialogue (optional)
        self.portrait_path = "catti_face"
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

         ["walk/down"] = {"idle/down", 0.25, true},
         ["walk/up"] = {"idle/up", 0.25, true},
         ["right/left"] = {"idle/left", 0.25, true},
         ["up/right"] = {"idle/right", 0.25, true},

        --facing left
        ["laughleft"] = {"laughleft", 2/15, true},
        ["laughright"] = {"laughright", 2/15, true},
        ["laugh_glitch"] = {"laugh_glitch", 2/15, true},
        ["battle/defend_ready"] = {"battle/defend", 2/15, false},


        --facing right
        ["punch"] = {"punch", 0.25, false},


        --Battle animations
        ["battle/idle"] = {"battle/idle", 0.25, true},

        --actions
        ["battle/attack"] = {"battle/attack", 1/20, false},
      --  ["battle/defend"] = {"battle/defend", 1/15, false},

        ["battle/act_ready"]    = {"battle/actready", 0.2, true},
        ["battle/spell_ready"]  = {"battle/actready", 0.2, true},
        ["battle/item_ready"]   = {"battle/itemready", 0.2, true},

        ["battle/spare"]        = {"battle/act", 2/15, false, next="battle/idle"},

         ["battle/act"]          = {"battle/act", 1/15, false},
         ["battle/actend"]          = {"battle/intro", 1/15, false},

         ["battle/spell"]        = {"battle/intro", 1/15, false},
          ["battle/item"]         = {"battle/item", 1/12, false, next="battle/item"},

        --reapp
        ["battle/attack_ready"] = {"battle/attack_ready", 1/15, false},


        ["battle/hurt"] = {"battle/hurt", 1/15, false, temp=true, duration=0.5},
        ["battle/defeat"] = {"battle/defeat", 1/15, false},

        --transitions
        ["battle/transition"] = {"battle/intro", 1/15, true},
        ["battle/intro"] = {"battle/intro", 1/15, true},
    }

    self.offsets = {
        ["idle/down"] = {0, 0},
        ["idle/up"] = {0, 0},
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
        ["battle/idle"] = {-5, 0},
        --actions
        ["battle/attack"] = {-10, 2},
        ["battle/defend"] = {0, 5},
      --  ["battle/defeat"] = {0, 5},

       ["battle/act_ready"]    = {0, 20},
        --["battle/spell_ready"]  = {0,5},
        ["battle/itemready"] = {-20, -10},
       -- ["battle/spare"] = {0,},

        ["battle/act"]    = {0,0},
        ["battle/spell"]  = {0,10},
        ["battle/item"] = {-20, -10},
        ["battle/actend"]    = {0,20},




        --ready

        ["battle/attack_ready"] = {-5, -15},

        ["battle/hurt"] = {0, 5},

        ["battle/transition"] = {6, 2},
        ["battle/intro"] = {0, 5},
       }
   end

   return actor