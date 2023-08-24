#!/bin/bash


read -e "\e[31mFIRST YOU NEED TO PUT YOUR SSH PUBLIC KEY ON THIS DIRECTORY\e[0m"

read -e "\e[31mlet's open a http server\e[0m"

sudo python3 -m http.server
