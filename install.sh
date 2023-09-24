#!/usr/bin/env bash

set -Eeuo pipefail
trap cleanup SIGINT SIGTERM ERR EXIT

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

usage() {
  cat << EOF # remove the space between << and EOF, this is due to web plugin issue
Usage: $(basename "${BASH_SOURCE[0]}") [-h] [-v] [-f] -p param_value arg1 [arg2...]

Installs this neovim config to ~/.config/nvim/.

Available options:

-h, --help        Print this help and exit
-f, --overwrite   Overwrite custom configs with defaults
EOF
  exit
}

cleanup() {
  trap - SIGINT SIGTERM ERR EXIT
  # script cleanup here
}

setup_colors() {
  if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
    NOFORMAT='\033[0m' RED='\033[0;31m' GREEN='\033[0;32m' ORANGE='\033[0;33m' BLUE='\033[0;34m' PURPLE='\033[0;35m' CYAN='\033[0;36m' YELLOW='\033[1;33m'
  else
    NOFORMAT='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW=''
  fi
}

msg() {
  echo >&2 -e "${1-}"
}

die() {
  local msg=$1
  local code=${2-1} # default exit status 1
  msg "$msg"
  exit "$code"
}

parse_params() {
  # default values of variables set from params
  overwrite=0

  while :; do
    case "${1-}" in
    -h | --help) usage ;;
    --no-color) NO_COLOR=1 ;;
    -f | --overwrite) overwrite=1 ;; # example flag
    -?*) die "Unknown option: $1" ;;
    *) break ;;
    esac
    shift
  done

  return 0
}

parse_params "$@"
setup_colors

# script logic here

main() {
    now=$(date +"%Y%m%d%H%M%S")
    config_dir="$HOME/.config/nvim"

    # check if config fodler exists
    if [[ -x $config_dir ]]; then
        backup_filename="nvim_${now}_backup"
        msg "${ORANGE}${config_dir} exists!${NOFORMAT}"
        msg "${GREEN}Backing up to ~/.config/${backup_filename}${NOFORMAT}"
        mv "$config_dir" "$backup_filename"
    fi

    # create the config new directory
    mkdir -p "${config_dir}/lua/core"

    # move the files to the new config dir
    msg "${GREEN}Installing current version of nvim-conf${NOFORMAT}"
    if [[ $overwrite == 1 ]]; then
        msg "${ORANGE}Overwriting ${config_dir}/lua/config with latest defaults (overwrite=1)${NOFORMAT}"
        cp -rf ./nvim ~/.config/
    else
        cp -f ./nvim/init.lua ~/.config/nvim/init.lua
        cp -rf ./nvim/lua/core ~/.config/nvim/lua/core
        cp -f ./nvim/lua/types.lua ~/.config/nvim/lua/types.lua
    fi

    msg "${GREEN} ✅ Done!${NOFORMAT}"
}
