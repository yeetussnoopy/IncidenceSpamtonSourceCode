local pendulum, super = Class(Wave)

function pendulum:init()
    super:init(self)

    -- Initialize timer
    self.siner = 100
    self.time = 20



end

function pendulum:onStart()

    self.encounter:setMode("right")

local arena = Game.battle.arena

        arena:setSize(100, 100)

        self.timer:script(function(wait)

    given_up = self.timer:every(4, function()
  

        Assets.playSound("noise")

        local y = Utils.random(Game.battle.arena.top - 150, Game.battle.arena.top - 150)

        local x = Utils.random(Game.battle.arena.left + 10, Game.battle.arena.right -10)


    
        local bullet = self:spawnBullet("head_rotation", x, y, math.rad(90), 9)

    end)
wait(11)
    self.timer:cancel(given_up)


    --Assets.playSound("weWon")


    local rect = Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
                                   rect:setColor(love.math.colorFromBytes(0, 0, 0))
                                   rect:setLayer(BATTLE_LAYERS["bottom"])
                                   rect.alpha = 0
                                   Game.stage:addChild(rect)

                                   local rect2 = Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
                                  local rect2 = Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
                                   rect2:setColor(love.math.colorFromBytes(0, 0, 0))
                                   rect2:setLayer(BATTLE_LAYERS["above_battlers"])
                                   rect2.alpha = 0
                                   Game.stage:addChild(rect2)

                                   --Game.battle:shakeCamera(5, 5, 0)

                                   Game.battle.timer:tween(2, rect, {alpha=1})
                                   wait(2.7)
                                   Game.battle.timer:tween(1, rect2, {alpha=1})
                                   wait(2.7)
                                   Game.battle.timer:tween(1, rect2, {color={0, 0.0, 0}})

       rect:remove()
       rect2:remove()

    Game.battle:returnToWorld()


end)
end



    function pendulum:update()
    -- Code here gets called every frame

    super:update(self)
end

return pendulum