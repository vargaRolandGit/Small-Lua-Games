Class = require 'class'

Paddle = Class{}

function Paddle:init(x,y,w,h)
    self.x  = x
    self.y  = y 
    self.w  = w
    self.h  = h
    self.dy = 0 
end

function Paddle:update(dt)
    if self.dy < 0 then
        self.y = math.max(0, self.y + self.dy * dt)
    else
        self.y = math.min(WINDOW_HEIGHT - self.h, self.y + self.dy * dt)
    end
end 

function Paddle:render()
    love.graphics.rectangle('line', self.x, self.y, self.w, self.h) 
end