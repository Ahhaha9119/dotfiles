#!/usr/bin/env fish

set config_file $HOME/.config/caelestia/hypr-user.conf
set mango_config $HOME/.config/MangoHud/MangoHud.conf

# Target refresh rates
set rate_high 240
set rate_low 85

# Target FPS limits
set limit_high 237
set limit_low 60

# set common_fps_limits 60

# Extract current refresh rate from the monitor line and current FPS limit from MangoHud config
set current_rate (grep -Po '(?<=@)\d+' $config_file)
set current_limit (grep -Po '(?<=fps_limit=)\d+' $mango_config)

if test "$current_rate" = "$rate_high"
    set new_rate $rate_low
    set new_limit $limit_low

    #    sed -i "s/^\(fps_limit=\)$limit_high,,/\1$new_limit,,/" $mango_config
else
    set new_rate $rate_high
    set new_limit $limit_high

    #    sed -i "s/^\(fps_limit=\)$limit_low,,/\1$new_limit,,/" $mango_config
end

# Replace only the refresh rate part
sed -i "s/@$current_rate/@$new_rate/" $config_file

# Update fps limit in MangoHud config
sed -i "s/^\(fps_limit=\)$current_limit,,/\1$new_limit,,/" $mango_config

# Reload Hyprland to apply
# hyprctl reload

# echo "Refresh rate switched: $current_rate Hz → $new_rate Hz"
