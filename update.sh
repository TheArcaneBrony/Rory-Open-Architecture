#!/usr/bin/env sh
nix flake update
./build.sh / $HOSTNAME