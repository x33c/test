-- Läs konfiguration
local config_path = "config.json"
local config = read_config(config_path)

-- Färger
local bg_color = config.colors.background or "#FFFFFF"
local header_color = config.colors.header or "#000000"
local text_color = config.colors.text or "#000000"

function node.render()
    -- Bakgrund
    gl.clear(bg_color.r, bg_color.g, bg_color.b, 1)

    -- Rubrik
    font:write(50, 20, config.title, config.layout.font_size.title, 1, 1, 1, 1)

    -- Aktuellt
    font:write(50, 150, config.aktuellt, config.layout.font_size.text, text_color.r, text_color.g, text_color.b, 1)

    -- Schema
    local y_offset = 250
    for i, item in ipairs(config.schema.person1) do
        font:write(50, y_offset + i * config.layout.padding, item, config.layout.font_size.text, text_color.r, text_color.g, text_color.b, 1)
    end
end
