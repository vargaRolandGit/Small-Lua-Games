WINDOW_WIDTH  = 1280
WINDOW_HEIGHT = 720

PADDLE_SPEED = 300

Class = require 'class'

require 'Ball'
require 'Paddle'

function love.load()
    love.window.setTitle('pong')
    math.randomseed(os.time())

    font = love.graphics.newFont('Inter-Bold.ttf', 34)

    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    player1Score = 0
    player2Score = 0

    ball = Ball(WINDOW_WIDTH  / 2 - 10, WINDOW_HEIGHT / 2 - 10, 20)
    player1 = Paddle(
        (WINDOW_WIDTH/100) * 3, 
        (WINDOW_HEIGHT/100) + 10,
        20,
        150 
    )
    player2 = Paddle(
        WINDOW_WIDTH - (WINDOW_WIDTH/100) * 3, 
        WINDOW_HEIGHT - (WINDOW_HEIGHT/100) - 160,
        20,
        150
    )

    gameState = 'start'

end

function love.draw()

    love.graphics.setFont(font)
    love.graphics.clear()
    
    love.graphics.printf('PONG',
        0 - 50,
        WINDOW_HEIGHT - 50,
        WINDOW_WIDTH + 100,
        'center'
    )

    ball:render()
    player1:render()
    player2:render()

end

function love.update(dt)

    if love.keyboard.isDown('w') then
        player1.dy = -PADDLE_SPEED
    elseif love.keyboard.isDown('s') then
        player1.dy = PADDLE_SPEED
    else 
        player1.dy = 0
    end

    if love.keyboard.isDown('up') then
        player2.dy = -PADDLE_SPEED
    elseif love.keyboard.isDown('down') then
        player2.dy = PADDLE_SPEED
    else 
        player2.dy = 0
    end

    if gameState == 'play' then
        ball:update(dt)

        if ball:collides(player1) then
            ball.dx = -ball.dx * 1.05
            ball.x = player1.x + 25

            if ball.dy < 0 then
                ball.dy = -math.random(10,150)
            else
                ball.dy = math.random(10,150)
            end
        end
        if ball:collides(player2) then
            ball.dx = -ball.dx * 1.05
            ball.x = player2.x - 25 

            if ball.dy < 0 then
                ball.dy = -math.random(10,150)
            else
                ball.dy = math.random(10,150)
            end
        end

        if ball.y < 0 or ball.y > WINDOW_HEIGHT - ball.r then
            ball.dy = -ball.dy
        end

    end

    player1:update(dt)
    player2:update(dt)

end

function love.keypressed(key) 
    if key == 'enter' or key == 'return' then
        if gameState == 'start' then
            gameState = 'play'
        else
            gameState = 'start'
            ball:reset()
        end
    end
end
