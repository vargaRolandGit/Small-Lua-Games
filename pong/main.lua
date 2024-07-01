WINDOW_WIDTH  = 1280
WINDOW_HEIGHT = 720

PADDLE_SPEED = 200

function love.load()
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
        WINDOW_WIDTH / 2 - 10,
        WINDOW_HEIGHT / 2 - 10,
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
     
end