local love require "love"

function SFX()
    local bgm = love.audio.newSource("src/sounds/bgm.mp3", "stream")
    bgm:setVolumen(0.1)
    bgm:setLooping(true)

    local effects = {
        ship_explosion = love.audio.newSource("src/sounds/src_sounds_explosion_player", "static")
        asteroid_explosion = love.audio.newSource("src/sounds/src_sounds_explosion_asteroid", "static")
        laser = love.audio.newSource("src/sounds/src_sounds_laser", "static")
        option_select = love.audio.newSource("src/sounds/src_sounds_option_select", "static")
        thruster_loud = love.audio.newSource("src/sounds/src_sounds_thruster_loud", "static")
        thruster = love.audio.newSource("src/sounds/src_sounds_thruster", "static")
    }

    return{
        fx_played = false

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