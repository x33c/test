-- Sundbybergs Stad Info-beamer Lua-script
-- Detta skript renderar en dynamisk layout med text och scheman som hämtas från en JSON-fil

-- Ladda in JSON-modulen (om det behövs en extern Lua-json parser, ladda upp den med Info-beamer)
local json = require "json"

-- Konfigurationsfil
local config_path = "config.json"

-- Funktion för att läsa JSON-konfigurationsfilen
local function read_config(path)
    local file = io.open(path, "r")
    if not file then
        error("Kunde inte öppna konfigurationsfilen: " .. path)
    end
    local content = file:read("*a")
    file:close()
    return json.decode(content)
end

-- Läser konfigurationsfilen
local config = read_config(config_path)

-- Funktion för att rita innehållet
function node.render()
    gl.clear(1, 1, 1, 1) -- Vit bakgrund

    -- Rita rubrik
    font:write(50, 20, config.title, 80, 1, 1, 1, 1)

    -- Rita Aktuellt-sektion
    font:write(50, 150, "Aktuellt:", 50, 0, 0, 0, 1)
    font:write(50, 220, config.aktuellt, 40, 0, 0, 0, 1)

    -- Rita scheman
    local y_offset = 400
    font:write(50, y_offset, "Schema - Person 1:", 50, 0, 0, 0, 1)
    for i, item in ipairs(config.schema.person1) do
        font:write(50, y_offset + i * 50, item, 40, 0, 0, 0, 1)
    end

    y_offset = y_offset + #config.schema.person1 * 50 + 100
    font:write(50, y_offset, "Schema - Person 2:", 50, 0, 0, 0, 1)
    for i, item in ipairs(config.schema.person2) do
        font:write(50, y_offset + i * 50, item, 40, 0, 0, 0, 1)
    end

    -- Rita Kontakt
    y_offset = y_offset + #config.schema.person2 * 50 + 100
    font:write(50, y_offset, "Kontakt:", 50, 0, 0, 0, 1)
    font:write(50, y_offset + 70, config.kontakt, 40, 0, 0, 0, 1)
end
