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
-u, --unstable    Install HEAD rather than latest release tag
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
  unstable=0

  while :; do
    case "${1-}" in
    -h | --help) usage ;;
    -v | --verbose) set -x ;;
    -u | --unstable) unstable=1 ;;
    --no-color) NO_COLOR=1 ;;
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
checkout_branch() {
    # checkout main and pull
    git checkout main
    git pull

    # if we want latest stable (default behaviour) then we get the latest tag
    if [[ $unstable == 0 ]]; then
        # Get new tags from remote
        git fetch --tags

        # Get latest tag name
        latestTag=$(git describe --tags | cut -d "-" -f 1)

        # Checkout latest tag
        git checkout "$latestTag"
    fi
}



main() {
    now=$(date +"%Y%m%d%H%M%S")
    config_dir="$HOME/.config/nvim"
    backup_filename="nvim_${now}_backup"

    # check if config fodler exists
    if [[ -x $config_dir ]]; then
        msg "${RED}${config_dir} exists!${NOFORMAT}"
        msg "${ORANGE}Backing up to ~/.config/${backup_filename}${NOFORMAT}"
        mv "$config_dir" "$HOME/.config/$backup_filename"
    fi

    # move the files to the new config dir
    checkout_branch
    msg "Installing '${latestTag}' of nvim-conf..."
    cp -rf ./nvim ~/.config/

    msg "${GREEN} ✅ Done!${NOFORMAT}"
}

main
