#!/bin/bash

has_omf() {
  if [ -d "$HOME/.local/share/omf" ]; then
    return 0
  fi

  if [ -f "$HOME/.config/fish/functions/omf.fish" ]; then
    return 0
  fi

  return 1
}

check_required_tools() {
  local tools=("git" "fish" "go" "fzf")
  local missing=()

  for tool in "${tools[@]}"; do
    if ! command -v "$tool" &> /dev/null; then
      missing+=("$tool")
    else
      echo -e "✓ $tool is installed"
    fi
  done

  if ! has_omf; then
    missing+=("omf")
  else
    echo -e "✓ omf is installed"
  fi

  if [ ${#missing[@]} -gt 0 ]; then
    echo -e "ERROR: The following required tools are not installed:"
    printf "  - %s\n" "${missing[@]}"
    exit 1
  fi

  echo -e "✓ All required tools are installed"
}

main () {
  check_required_tools

  echo -e "configuring $HOME/.config/fish/config.fish"
  [ ! -d "$HOME/.config/fish" ] && mkdir -p "$HOME/.config/fish"
  cp ./.config/fish/config.fish "$HOME/.config/fish/config.fish"

  echo -e "configuring $HOME/.gitconfig"
  cp ./.gitconfig "$HOME/.gitconfig"

  echo -e "configuring $HOME/.gitignore_global"
  cp ./.gitignore_global "$HOME/.gitignore_global"

  echo -e "configuring $HOME/.nanorc"
  cp ./.nanorc "$HOME/.nanorc"

  echo -e "✓ Configuration complete"
}

main
