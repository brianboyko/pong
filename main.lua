-- [[ Requirements: 
--    Push is a library that allows us to draw our game at a virtual resolution
-- ]]
push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

function love.load()
    -- use nearest-neighbor filtering
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- setup small font
    smallFont = love.graphics.newFont('font.ttf', 8)
    love.graphics.setFont(smallFont)

    -- setup push
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

function love.keypressed(key)
    if key == 'escape' then 
        love.event.quit()
    end
end

function love.draw()
    -- begin rendering at virtual resolution
    push:apply('start')

    -- clear the background with pong-greyish
    love.graphics.clear(40/255, 45/255, 52/255, 1)

    -- render first paddle
    love.graphics.rectangle('fill', 10, 30, 5, 20)
    -- render second paddle
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 50, 5, 20)
    -- render ball
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)
    -- print
    love.graphics.printf( 'Hello Pong!', 0, 20, VIRTUAL_WIDTH, 'center')    
    -- end rendering at virtual resolution
    push:apply('end')
 end
