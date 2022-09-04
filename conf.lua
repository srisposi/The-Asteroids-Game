local love = require "love"

function love.conf(app)
    app.window.width = 1200
    app.window.heigth = 720
    app.window.title = "Asteroids"
    app.window.display = 2
end