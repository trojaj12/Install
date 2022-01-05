#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi



echo "===Installing tools using APT==="

apt-get -qq update

while read -r tool; do
    [[ $tool == "" || ${tool::1} == "#" ]] && continue
    echo "Installing $tool"
    apt-get -qq --yes install $tool
done < ./tools/apt.txt

echo "===Installing tools using SNAP==="

while read -r tool; do
    [[ $tool == "" || ${tool::1} == "#" ]] && continue
    echo "Installing $tool"
    snap install $tool
done < ./tools/snap.txt

