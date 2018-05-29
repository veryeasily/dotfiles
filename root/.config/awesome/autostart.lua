local awful = require("awful")

function run_once(cmd)
    findme = cmd
    firstspace = cmd:find(" ")
    if firstspace then
        findme = cmd:sub(0, firstspace-1)
    end
    awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
end

-- disable mouse when typing
run_once("syndaemon -i 1 -d  -t -K")

-- keyboard mappings (ie: capslock->ctrl)
run_once("~/scripts/reassign-caps-lock.sh")

-- gnome-network-manager
run_once("nm-applet")

-- volume manager
run_once("volti")

-- bluetooth?
run_once("blueman-applet")

-- change monitor colors at night
run_once("fluxgui")

--- compositing for transparency
run_once("unagi")