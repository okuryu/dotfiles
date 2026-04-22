fish_add_path /opt/homebrew/bin

if type -q go
  fish_add_path (go env GOPATH)/bin
end

set -x GH_TELEMETRY false
set -x theme_powerline_fonts no
set -x theme_display_date no
set -x theme_display_cmd_duration no

fzf --fish | source
