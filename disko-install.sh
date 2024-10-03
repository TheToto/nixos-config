#!/usr/bin/env bash

bash hardware-config.sh

# TODO: why out of memory ?
sudo nix \
  --experimental-features "nix-command flakes" \
  run 'github:nix-community/disko#disko-install' -- \
  --flake .#$1 \
  --disk disk1 $2