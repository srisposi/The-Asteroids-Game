local love = require "love"

function SFX()
    local bgm = love.audio.newSource("src/sounds/bgm.mp3", "stream") -- the "stream" tells LÖVE to stream the file from disk, good for longer music tracks
    bgm:setVolume(0.1)
    bgm:setLooping(true)

    local effects = {
        ship_explosion = love.audio.newSource("src/sounds/src_sounds_explosion_player.ogg", "static"),
        asteroid_explosion = love.audio.newSource("src/sounds/src_sounds_explosion_asteroid.ogg", "static"),
        laser = love.audio.newSource("src/sounds/src_sounds_laser.ogg", "static"),
        option_select = love.audio.newSource("src/sounds/src_sounds_option_select.ogg", "static"),
        thruster_loud = love.audio.newSource("src/sounds/src_sounds_thruster_loud.ogg", "static"),
        thruster = love.audio.newSource("src/sounds/src_sounds_thruster.ogg", "static"),
    }

    return{
        fx_played = false,

        setFXPlayed = function (self, has_played)
            self.fx_played = has_played
        end,

        playBGM = function(self)
            if not bgm:isPlaying() then
                bgm:play()
            end
        end,

        stopFX = function(self, effect)
            if effects[effect]:isPlaying() then
                effects[effect]:stop()
            end
        end,

        playFX = function(self, effect, mode)
            if mode == "single" then
                if not self.fx_played then
                    self:setFXPlayed(true)

                    if not effects[effect]:isPlaying() then
                        effects[effect]:play()
                    end
                end
            elseif mode == "slow" then
                if not effects[effect]:isPlaying() then
                    effects[effect]:play()
                end
            else
                self:stopFX(effect)
                effects[effect]:play()
            end                
        end
    }
end

return SFX