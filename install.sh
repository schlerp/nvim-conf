#!/usr/bin/env bash

set -Eeuo pipefail
trap cleanup SIGINT SIGTERM ERR EXIT

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

usage() {
  cat << EOF # remove the space between << and EOF, this is due to web plugin issue
Usage: $(basename "${BASH_SOURCE[0]}") [-h] [-u] [-f] [-v] [-t param_value]

Installs this neovim config to ~/.config/nvim/.

Available options:

  -u, --unstable    Install origin/main rather than latest release tag
  -t, --tag         Install a specific tag
                        (takes precedence over -u)
  -c, --current     Install the currently checked out commit
                        (takes precedence over -u and -t)
  -v, --verbose     Verbose mode
                        (set -x)
  -h, --help        Print this help and exit

Examples:

  # install latest stable version
  ${BASH_SOURCE[0]}

  # install latest unstable version
  ${BASH_SOURCE[0]} -u

  # install version v1.2.0
  ${BASH_SOURCE[0]} -t v1.2.0

  # install current commit
  ${BASH_SOURCE[0]} -c
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
  targetTag=0
  current=0

  while :; do
    case "${1-}" in
    -h | --help) usage ;;
    -v | --verbose) set -x ;;
    -u | --unstable) unstable=1 ;;
    -c | --current) current=1 ;;
    --no-color) NO_COLOR=1 ;;
    -t | --tag)
      targetTag="${2-}"
      shift
      ;;
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
    git checkout main
    git pull
    git fetch --tags

    if [[ $targetTag != 0 ]]; then
        # a specific tag was set, make sure it exists
        if [ $(git tag -l "$targetTag") ]; then
            msg "${GREEN}Checking out ${targetTag}...${NOFORMAT}"
            git checkout "$targetTag"
        else
            die "${RED}Tag: '${targetTag}' does not exist!${NOFORMAT}"
        fi
    elif [[ $unstable == 0 ]]; then
        latestTag=$(git describe --tags | cut -d "-" -f 1)
        msg "${GREEN}Checking out ${latestTag}...${NOFORMAT}"
        git checkout "$latestTag"
    fi
}



main() {
    now=$(date +"%Y%m%d%H%M%S")
    config_dir="$HOME/.config/nvim"
    backup_filename="nvim_${now}_backup"

    if [[ -x $config_dir ]]; then
        msg "${RED}${config_dir} exists!${NOFORMAT}"
        msg "${ORANGE}Backing up to ~/.config/${backup_filename}${NOFORMAT}"
        mv "$config_dir" "$HOME/.config/$backup_filename"
    fi

    if [[ $current == 0 ]]; then
        checkout_branch
    fi

    msg "${GREEN}Installing nvim-conf...${NOFORMAT}"
    cp -rf ./nvim ~/.config/

    msg "${GREEN} ✅ Done!${NOFORMAT}"
}

main
