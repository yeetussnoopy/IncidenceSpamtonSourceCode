local starBullet, super = Class(Bullet)

function starBullet:init(x, y, dir, speed)
    -- Last argument = sprite path
    super:init(self, x, y, "bullets/star")
                    self.fart = 0
                                            self.rotation = math.rad(0)


    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed
end

function starBullet:update()
    -- For more complicated bullet behaviours, code here gets called every update
    self.fart = self.fart + (1 * DTMULT)
    self.rotation=math.rad(20*math.cos(self.fart * 0.11) * 9)

    
    super:update(self)
end

return starBullet