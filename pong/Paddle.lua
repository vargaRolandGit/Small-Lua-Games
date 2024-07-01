Class = require 'class'

Paddle = Class{}

function Paddle:init(x,y,w,h)
    self.x  = x
    self.y  = y 
    self.w  = w
    self.h  = h
    self.dy = 0 
end