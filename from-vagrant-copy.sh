#!/bin/bash
#set -x

username=$1
guest_path=$2
host_path=$3

question() {
    message=$1
    var=$2
    echo $message
    read answer
    eval ${var}=${answer}
}

ask_questions() {
    question "Vagrant box username?" username
    question "Vagrant box (guest) file path?" guest_path
    question "Local (host) file path?" host_path
}

main() {
    if [ -z $username ] &&
       [ -z $guest_path ] &&
       [ -z $host_path ]
    then
        ask_questions
    fi
    scp -rP 2222 ${username}@127.0.0.1:${guest_path} ${host_path}
}

main
