#!/bin/bash
set -euo pipefail

PORT=2222

usage() {
    echo "Usage: $(basename "$0") [DIRECTION] [USERNAME] [GUEST_PATH] [HOST_PATH]"
    echo "  DIRECTION: 'to' or 'from'"
    exit 1
}

prompt() {
    local message=$1
    local -n result=$2
    read -rp "$message " result
}

gather_inputs() {
    prompt 'Transfer "to" or "from" the vagrant box?' direction
    prompt 'Guest (vagrant) username?' username
    prompt 'Guest (vagrant) path?' guest_path
    prompt 'Host (local) path?' host_path
}

main() {
    local direction=${1:-}
    local username=${2:-}
    local guest_path=${3:-}
    local host_path=${4:-}

    if [[ -z "$direction" || -z "$username" || -z "$guest_path" || -z "$host_path" ]]; then
        gather_inputs
    fi

    if [[ "$direction" == from ]]; then
        scp -rP "$PORT" "${username}@127.0.0.1:${guest_path}" "$host_path"
    elif [[ "$direction" == to ]]; then
        scp -rP "$PORT" "$host_path" "${username}@127.0.0.1:${guest_path}"
    else
        echo "Error: direction must be 'to' or 'from'"
        usage
    fi
}

main "$@"
