WINDOW_WIDTH  = 1280
WINDOW_HEIGHT = 720

PADDLE_SPEED = 300

Class = require 'class'

require 'Ball'

function love.load()

    math.randomseed(os.time())

    font = love.graphics.newFont('Inter-Bold.ttf', 34)

    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    player1Score = 0
    player2Score = 0
    player1Y     = (WINDOW_HEIGHT/100) + 10
    player2Y     = WINDOW_HEIGHT - (WINDOW_HEIGHT/100) - 160 

    ballX        = WINDOW_WIDTH  / 2 - 10
    ballY        = WINDOW_HEIGHT / 2 - 10
    ballDX       = math.random(2) == 1 and 100 or -100
    ballDY       = math.random(-50, 50)

    gameState    = 'start'

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
    love.graphics.rectangle(
        'line', 
        ballX,
        ballY,
        20,
        20
    )
    love.graphics.rectangle(
        'line',
        (WINDOW_WIDTH/100) * 3,
        player1Y,
        20, 
        150
    )
    love.graphics.rectangle(
        'line',
        WINDOW_WIDTH - (WINDOW_WIDTH/100) * 3,
        player2Y,
        20, 
        150
    )
end

function love.update(dt)
    if love.keyboard.isDown('w') and player1Y > 0 then
        player1Y = player1Y - PADDLE_SPEED * dt
    elseif love.keyboard.isDown('s') and player1Y < WINDOW_HEIGHT - 150 then
        player1Y = player1Y + PADDLE_SPEED * dt
    end

    if love.keyboard.isDown('up') and player2Y > 0 then
        player2Y = player2Y - PADDLE_SPEED * dt
    elseif love.keyboard.isDown('down') and player2Y < WINDOW_HEIGHT - 150 then
        player2Y = player2Y + PADDLE_SPEED * dt
    end

    if gameState == 'play' then
        ballX = ballX + ballDX * dt
        ballY = ballY + ballDY * dt
    end
end


function love.keypressed(key) 
    if key == 'enter' or key == 'return' then
        if gameState == 'start' then
            gameState = 'play'
        else
            gameState = 'start'
            ballX     = WINDOW_WIDTH  / 2 - 10
            ballY     = WINDOW_HEIGHT / 2 - 10
            ballDX    = math.random(2) == 1 and 100 or -100
            ballDY    = math.random(-50, 50)
        end
    end
end
