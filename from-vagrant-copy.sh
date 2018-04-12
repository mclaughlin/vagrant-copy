#!/bin/bash

echo "Vagrant box username?"
read username

echo "Vagrant box (guest) file path?"
read guest_path

echo "Local (host) file path?"
read host_path

scp -rP 2222 ${username}@127.0.0.1:${guest_path} ${host_path}


