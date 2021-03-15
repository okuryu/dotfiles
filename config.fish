if sw_vers -productVersion | grep "^10" > /dev/null
  fish_add_path /usr/local/bin
else
  fish_add_path /opt/homebrew/bin
end

set -g theme_powerline_fonts no
set -g theme_display_date no
set -g theme_display_cmd_duration no

alias ll="ls -aFl"
