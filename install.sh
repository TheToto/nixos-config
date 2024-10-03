#!/usr/bin/env bash

bash hardware-config.sh

sudo nixos-install \
  --flake .#$1 \
  --impure

echo "Do not forget to edit root/users passwords !"