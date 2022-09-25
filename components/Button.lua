local love = require "love"
local Text = require "./components/Text"

function Button(func, text_color, button_color, width, height, text, text_align, font_size, button_x, button_y, text_x, text_y)
    local btn_text = {}
    func = func or function() print("THis button has no function attached") end

    if text_y then
        btn_text.y = text_y + button_y
    else
        btn_text.y = button_y
    end

    if text_x then
        btn_text.x = text_x + button_x
    else
        btn_text.x = button_x
    end

    return{
        text_color = text_color or { r=1, g=1, b=1 },
        button_color = button_color or { r=0, g=0, b=0 },
        width = width or 100,
        height = height or 100,
        text = text or "No text added",
        text_x = text_x or button_x or 0,
        text_y = text_y or button_y or 0,
        button_x = button_x or 0,
        button_y = button_y or 0,
        text_component = Text(
            text,
            btn_text.x,
            btn_text.y,
            font_size,
            false,
            false,
            width,
            text_align,
            1
        ),

        draw = function(self)
            love.graphics.setColor(self.button_color["r"], self.button_color["g"], self.button_color["b"])
            love.graphics.rectangle("fill", self.button_x, self.button_y, self.width, self.height)

            love.graphics.setColor(self.text_color["r"], self.text_color["g"], self.text_color["b"])

            self.text_component:draw()

            love.graphics.setColor(1,1,1)
        end,


    }
end

return Button