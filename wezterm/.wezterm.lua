local wezterm = require("wezterm")
local config = wezterm.config_builder()
local io = require("io")
local os = require("os")

-- image setting
local user_home = os.getenv("HOME")
local background_folder = user_home .. "/.config/nvim/bg"
local function pick_random_background(folder)
    local handle = io.popen('ls "' .. folder .. '"')
    local files = handle:read("*a")
    handle:close()

    local images = {}
    for file in string.gmatch(files, "[^\n]+") do
        table.insert(images, file)
    end

    if #images > 0 then
        return folder .. "/" .. images[math.random(#images)]
    else
        return nil
    end
end

config.keys                         = {
    {
        key = "b",
        mods = "CTRL|SHIFT",
        action = wezterm.action_callback(function(window, pane)
            local new_background = pick_random_background(background_folder)
            if new_background then
                window:set_config_overrides({
                    window_background_image = new_background,
                })
                wezterm.log_info("New bg:" .. new_background)
            else
                wezterm.log_error("Could not find bg image")
            end
        end),
    },
}

config.window_background_opacity    = 0.5
config.macos_window_background_blur = 35
config.window_padding               = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

config.window_background_image_hsb  = {
    -- Darken the background image by reducing it
    brightness = 0.8,
    hue = 1.0,
    saturation = 1.0,
}
-- config.window_background_gradient = {
--   colors = { '#EEBD89', '#D13ABD' },
--   -- Specifies a Linear gradient starting in the top left corner.
--   orientation = { Linear = { angle = -45.0 } },
-- }

config.color_scheme                 = 'Tokyo Night'
config.window_background_image      = user_home .. "/.config/nvim/bg/bg.jpg"

config.font                         = wezterm.font("Mononoki Nerd Font"
, { weight = "Medium", stretch = 'Expanded',
}
)
config.font_size                    = 15
config.initial_rows = 50 -- Adjust as needed
config.initial_cols = 200 -- Adjust as needed

-- Start in full-screen mode
config.default_cwd = user_home -- Sets the default working directory

config.window_decorations           = "RESIZE"
config.enable_tab_bar               = false

return config
