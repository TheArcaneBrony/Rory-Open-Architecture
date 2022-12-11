#!/usr/bin/env sh
if [ $# -ne 2 ]; then
    echo "Usage: $0 <root> <config>"
    echo "NOTE: hardware config will be generated from root!"
    echo "Defined configs:"
    cat flake.nix | grep 'nixpkgs.lib.nixosSystem' | sed 's/ =.*//' | sed 's/^[ \t]*//;s/[ \t]*$//' | while read cfg; do echo " - $cfg"; done
    exit 1
fi
if [ "$1" = "/" ]; then
    nixos-generate-config --show-hardware-config > hardware-configuration.nix
    git add -f hardware-configuration.nix
    nixos-rebuild switch --flake ".#${2}"
    git rm --cached hardware-configuration.nix
    exit
else
    nixos-generate-config --show-hardware-config > hardware-configuration.nix
    git add -f hardware-configuration.nix
    nixos-install --root "${1}" --flake ".#${2}" 
    git rm --cached hardware-configuration.nix
    exit
fi
