local PinkSoul, super = Class(Soul)

function PinkSoul:init(x, y)
    super:init(self, x, y)

    self:setColor(1, 1, 1)

    self.speed = 6

    self.rotation = math.pi

 


end



return PinkSoul