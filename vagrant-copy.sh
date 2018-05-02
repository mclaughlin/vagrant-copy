#!/bin/bash
set -x

direction=$1
username=$2
orig_path=$3
dest_path=$4

question() {
    message=$1
    var=$2
    echo $message
    read answer
    eval ${var}=${answer}
}

ask_questions() {
    question 'Would you like to transfer files "to" or "from" the vagrant box?' direction
    question 'Guest (vagrant) username?' username
    question 'Guest (vagrant) file path?' guest_path
    question 'Host (local) file path?' host_path
}

set_path() {
    if [ ! -z $guest_path ] && [ ! -z $host_path ];  
    then
        orig_path=$1
        dest_path=$2
    fi
}

main() {

    if [ -z $direction ] ||
       [ -z $username ] ||
       [ -z $orig_path ] ||
       [ -z $dest_path ]
    then
        ask_questions
    fi

    if [ $direction = from ]
    then
        set_path $guest_path $host_path
        scp -rP 2222 ${username}@127.0.0.1:${orig_path} ${dest_path}
    elif [ $direction = to ]
    then
        set_path $host_path $guest_path
        scp -rP 2222 ${orig_path} ${username}@127.0.0.1:${dest_path}
    else
        echo Usage:
        echo $ /bin/sh ./vagrant-copy.sh [DIRECTION] [USERNAME] [GUEST_PATH] [HOST_PATH]
    fi
}

main
