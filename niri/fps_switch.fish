#!/usr/bin/env fish

set mango_config $HOME/.config/MangoHud/MangoHud.conf

set current_rate ( niri msg outputs | grep "Current mode" | grep -oE '[0-9]+\.[0-9]+' )

if test "$current_rate" = "239.999"
    set new_limit 116

    command niri msg output DP-3 mode 1920x1080@119.879
    sed -i "s/^\(fps_limit=\)224,,/\1$new_limit,,/" $mango_config

end

if test "$current_rate" = "119.879"
    set new_limit 59

    command niri msg output DP-3 mode 1920x1080@60.000
    sed -i "s/^\(fps_limit=\)116,,/\1$new_limit,,/" $mango_config

end

if test "$current_rate" = "60.000"
    set new_limit 224

    command niri msg output DP-3 mode 1920x1080@239.999
    sed -i "s/^\(fps_limit=\)59,,/\1$new_limit,,/" $mango_config

end
