local love = require "love"
local player = require "Player"

function love.load()
    love.mouse.setVisible(false)
    mouse_x, mouse_y = 0, 0

    local show_debugging = true

    player = Player(show_debugging)
end                                                          

function love.keypressed(key)
    if key == "w" or ke == "up" or key == "kp8" then
        player.thrusting = true
    end
end

function love.keyreleased(key)
    if key == "w" or ke == "up" or key == "kp8" then
        player.thrusting = false
    end
end

function love.update()
    mouse_x, mouse_y = love.mouse.getPosition()
    
    player:movePlayer()
end              

function love.draw()
    player:draw()

    love.graphics.setColor(1, 1, 1, 1)

    love.graphics.print(love.timer.getFPS(), 10, 10)
end