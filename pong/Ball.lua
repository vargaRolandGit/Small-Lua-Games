Class = require 'class'

Ball = Class{}

function Ball:init(x, y, r) 
    self.x  = x
    self.y  = y 
    self.r  = r
    self.dx = math.random(2) == 1 and 100 or -100
    self.dy = math.random(-50, 50)
end

function Ball:reset()
    self.x  = WINDOW_WIDTH  / 2 - 10
    self.y  = WINDOW_HEIGHT / 2 - 10
    self.dx = math.random(2) == 1 and 100 or -100
    self.dy = math.random(-50, 50)
end

function Ball:update(dt)
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt
end 

function Ball:render()
    love.graphics.rectangle('line', self.x, self.y, self.r, self.r) 
end